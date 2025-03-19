class SExceptions implements Exception {
  const SExceptions([
    this.message = 'Terjadi kesalahan yang tidak terduga. Silakan coba lagi.',
  ]);

  /// Factory untuk menangani berbagai kode error autentikasi atau API
  factory SExceptions.fromCode(String code) {
    switch (code) {
      // 🔹 ERROR AUTENTIKASI
      case 'invalid-email':
        return const SExceptions(
          'Alamat email yang dimasukkan tidak valid. Mohon periksa kembali.',
        );
      case 'email-already-in-use':
        return const SExceptions(
          'Email sudah digunakan. Silakan gunakan email lain atau login.',
        );
      case 'sign_in_failed':
        return const SExceptions('Gagal masuk. Silakan coba lagi.');
      case 'user-not-found':
        return const SExceptions(
            'Pengguna tidak ditemukan. Silakan periksa email Anda.');
      case 'wrong-password':
        return const SExceptions(
          'Password salah. Mohon periksa kembali dan coba lagi.',
        );
      case 'weak-password':
        return const SExceptions(
          'Password terlalu lemah. Gunakan kombinasi huruf, angka, dan simbol.',
        );
      case 'invalid-password':
        return const SExceptions('Password tidak valid. Silakan coba lagi.');
      case 'too-many-requests':
        return const SExceptions(
          'Terlalu banyak percobaan login. Coba lagi nanti.',
        );

      // 🔹 ERROR JARINGAN / API
      case 'network-request-failed':
        return const SExceptions(
          'Koneksi internet bermasalah. Periksa jaringan Anda.',
        );
      case 'server-error':
        return const SExceptions(
          'Server sedang bermasalah. Coba lagi nanti.',
        );
      case 'timeout':
        return const SExceptions(
          'Permintaan terlalu lama. Periksa koneksi dan coba lagi.',
        );
      case 'unauthorized':
        return const SExceptions(
          'Akses ditolak. Anda tidak memiliki izin untuk mengakses sumber ini.',
        );
      case 'forbidden':
        return const SExceptions(
          'Akses tidak diizinkan. Silakan hubungi admin.',
        );
      case 'not-found':
        return const SExceptions(
          'Data tidak ditemukan. Silakan coba lagi nanti.',
        );

      // 🔹 ERROR DEFAULT
      default:
        return SExceptions();
    }
  }

  final String message;

  @override
  String toString() => message;
}
