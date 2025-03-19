import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/api_constant.dart';
import '../exceptions/exceptions.dart';
import '../popups/loaders.dart';

class DioClient {
  static final DioClient _instance = DioClient._internal();
  late Dio _dio;

  factory DioClient() {
    return _instance;
  }

  DioClient._internal() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConstant.apiURL,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );

    // Tambahkan interceptor untuk menyertakan token
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          final token = prefs.getString('token');
          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          handler.reject(_handleDioError(e));
        },
      ),
    );
  }

  /// Menangani error dari Dio dan menampilkan Snackbar
  DioException _handleDioError(DioException e) {
    String errorMessage;

    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        errorMessage = 'Koneksi timeout. Silakan coba lagi.';
        break;
      case DioExceptionType.sendTimeout:
        errorMessage = 'Pengiriman data timeout. Silakan coba lagi.';
        break;
      case DioExceptionType.receiveTimeout:
        errorMessage = 'Penerimaan data timeout. Silakan coba lagi.';
        break;
      case DioExceptionType.badResponse:
        final statusCode = e.response?.statusCode;
        errorMessage = _handleHttpStatusCode(statusCode);
        break;
      case DioExceptionType.cancel:
        errorMessage = 'Request dibatalkan.';
        break;
      default:
        errorMessage = 'Terjadi kesalahan. Silakan coba lagi.';
    }

    return DioException(
      requestOptions: e.requestOptions,
      type: e.type,
      error: SExceptions(errorMessage),
    );
  }

  /// Menentukan pesan error berdasarkan status HTTP
  String _handleHttpStatusCode(int? statusCode) {
    switch (statusCode) {
      case 400:
        return 'Permintaan tidak valid. Periksa data Anda.';
      case 401:
        return 'Unauthorized. Silakan login kembali.';
      case 403:
        return 'Akses tidak diizinkan. Hubungi admin.';
      case 404:
        return 'Data tidak ditemukan.';
      case 500:
        return 'Terjadi kesalahan pada server.';
      default:
        return 'Terjadi kesalahan yang tidak diketahui.';
    }
  }

  /// GET Request dengan UI Feedback
  Future<Response> get(BuildContext context, String endpoint,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      return await _dio.get(endpoint, queryParameters: queryParameters);
    } on DioException catch (e) {
      SLoaders.errorSnackBar(context,
          title: "Error", message: e.error.toString());
      throw SExceptions.fromCode(
          e.response?.statusCode.toString() ?? 'server-error');
    }
  }

  /// POST Request dengan UI Feedback
  Future<Response> post(BuildContext context, String endpoint,
      {Map<String, dynamic>? data, bool isMultipart = false}) async {
    try {
      if (isMultipart) {
        FormData formData = FormData.fromMap(data!);
        return await _dio.post(endpoint, data: formData);
      } else {
        return await _dio.post(endpoint, data: data);
      }
    } on DioException catch (e) {
      SLoaders.errorSnackBar(context,
          title: "Error", message: e.error.toString());
      throw SExceptions.fromCode(
          e.response?.statusCode.toString() ?? 'server-error');
    }
  }

  /// PUT Request dengan UI Feedback
  Future<Response> put(BuildContext context, String endpoint,
      {Map<String, dynamic>? data}) async {
    try {
      return await _dio.put(endpoint, data: data);
    } on DioException catch (e) {
      SLoaders.errorSnackBar(context,
          title: "Error", message: e.error.toString());
      throw SExceptions.fromCode(
          e.response?.statusCode.toString() ?? 'server-error');
    }
  }

  /// DELETE Request dengan UI Feedback
  Future<Response> delete(BuildContext context, String endpoint) async {
    try {
      return await _dio.delete(endpoint);
    } on DioException catch (e) {
      SLoaders.errorSnackBar(context,
          title: "Error", message: e.error.toString());
      throw SExceptions.fromCode(
          e.response?.statusCode.toString() ?? 'server-error');
    }
  }
}
