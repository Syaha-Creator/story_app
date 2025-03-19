import 'package:intl/intl.dart';

class SFormatter {
  /// Format tanggal ke `dd-MMM-yyyy` (contoh: `01-Jan-2024`)
  static String formatDate(DateTime? date) {
    date ??= DateTime.now();
    return DateFormat('dd-MMM-yyyy').format(date);
  }

  /// Format waktu ke `HH:mm:ss` (contoh: `14:30:45`)
  static String formatTime(DateTime? date) {
    date ??= DateTime.now();
    return DateFormat('HH:mm:ss').format(date);
  }

  /// Format tanggal dan waktu ke `dd-MMM-yyyy HH:mm:ss`
  static String formatDateTime(DateTime? date) {
    date ??= DateTime.now();
    return DateFormat('dd-MMM-yyyy HH:mm:ss').format(date);
  }

  /// Konversi timestamp (int) ke DateTime
  static DateTime timestampToDateTime(int timestamp) {
    return DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  }

  /// Konversi DateTime ke timestamp (int)
  static int dateTimeToTimestamp(DateTime date) {
    return date.millisecondsSinceEpoch ~/ 1000;
  }

  /// Format waktu dalam bentuk `time ago` (contoh: `5 menit yang lalu`)
  static String timeAgo(DateTime date) {
    Duration difference = DateTime.now().difference(date);

    if (difference.inSeconds < 60) {
      return "${difference.inSeconds} detik yang lalu";
    } else if (difference.inMinutes < 60) {
      return "${difference.inMinutes} menit yang lalu";
    } else if (difference.inHours < 24) {
      return "${difference.inHours} jam yang lalu";
    } else if (difference.inDays < 7) {
      return "${difference.inDays} hari yang lalu";
    } else {
      return formatDate(date);
    }
  }
}
