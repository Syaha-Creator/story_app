import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../helpers/helper_function.dart';

class SLoaders {
  /// Menyembunyikan Snackbar yang sedang aktif
  static void hideSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
  }

  /// Menampilkan Custom Toast (Snackbar Transparan)
  static void customToast(BuildContext context, {required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 0,
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.transparent,
        content: Container(
          padding: const EdgeInsets.all(12.0),
          margin: const EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: SHelperFunctions.isDarkMode(context)
                ? SColors.darkGrey.withAlpha(100)
                : SColors.darkerGrey.withAlpha(100),
          ),
          child: Center(
            child: Text(
              message,
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
        ),
      ),
    );
  }

  /// Snackbar untuk menampilkan pesan sukses
  static void successSnackBar(BuildContext context,
      {required String title, String message = '', int duration = 3}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.check_circle, color: SColors.white),
            const SizedBox(width: 10),
            Expanded(
              child: Text(title, style: const TextStyle(color: Colors.white)),
            ),
          ],
        ),
        backgroundColor: SColors.primary,
        duration: Duration(seconds: duration),
      ),
    );
  }

  /// Snackbar untuk menampilkan peringatan
  static void warningSnackBar(BuildContext context,
      {required String title, String message = ''}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.warning, color: SColors.white),
            const SizedBox(width: 10),
            Expanded(
              child: Text(title, style: const TextStyle(color: SColors.white)),
            ),
          ],
        ),
        backgroundColor: Colors.orange,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  /// Snackbar untuk menampilkan pesan error
  static void errorSnackBar(BuildContext context,
      {required String title, String message = ''}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.error, color: SColors.white),
            const SizedBox(width: 10),
            Expanded(
              child: Text(title, style: const TextStyle(color: SColors.white)),
            ),
          ],
        ),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 3),
      ),
    );
  }
}
