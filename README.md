# 📖 Story App – Flutter Dicoding Project  

Story App adalah aplikasi berbagi cerita berbasis **Flutter** yang memungkinkan pengguna untuk **mendaftar, login, melihat daftar cerita, menambahkan cerita dengan foto, serta melihat detail cerita**. Aplikasi ini dikembangkan sebagai bagian dari proyek Dicoding dengan **standar navigasi declarative dan pengalaman pengguna yang optimal**. 🚀  

---

## ✨ Fitur Utama  

✅ **Autentikasi**  
🔹 Registrasi dan login menggunakan email & password.  
🔹 Password disembunyikan untuk keamanan.  
🔹 Token sesi disimpan dengan **SharedPreferences**.  
🔹 **Auto-login** jika token tersimpan, langsung masuk ke halaman utama.  
🔹 **Logout** untuk menghapus sesi dan kembali ke halaman login.  

✅ **Halaman Cerita**  
🔹 Menampilkan daftar cerita yang diambil dari **Story API Dicoding**.  
🔹 Informasi yang tersedia: **nama pengguna & foto cerita**.  
🔹 Klik item cerita untuk melihat **detail cerita** (nama pengguna, foto, dan deskripsi).  

✅ **Tambah Cerita**  
🔹 Pengguna dapat menambahkan cerita baru dengan **deskripsi dan gambar**.  
🔹 Gambar bisa diambil dari **galeri** atau **kamera**.  
🔹 Setelah sukses, otomatis kembali ke halaman utama dengan **refresh data**.  

✅ **Navigasi Canggih**  
🔹 Menggunakan **GoRouter** untuk navigasi deklaratif.  
🔹 **Mendukung deep linking** dan navigasi berbasis URL.  
🔹 **Responsif**, cocok untuk **mobile & web**.  

✅ **User Experience (UX) yang Baik**  
🔹 **Indikator loading** saat mengambil atau mengunggah data.  
🔹 **Pesan error** jika terjadi kesalahan saat request API.  
🔹 **Informasi ketika tidak ada data tersedia**.  
🔹 UI mengikuti **Material Design Guidelines**.  
🔹 **Mendukung multi-bahasa** (localization) dengan `intl`.  

---

## 🛠️ Teknologi yang Digunakan  

| Teknologi       | Deskripsi |
|----------------|----------|
| 🏗 **Flutter** | Framework utama untuk pengembangan aplikasi multiplatform (Android, iOS, Web, dan Desktop). |
| 🎯 **Dart** | Bahasa pemrograman utama untuk Flutter. |
| 🔄 **Provider** | State management untuk **Auth, API, dan Global State**. |
| 🚀 **GetX** | State management untuk **UI, Snackbar, BottomSheet, dan Dialog**. |
| 🌐 **Dio** | HTTP client untuk komunikasi API dengan fitur **Interceptor & FormData**. |
| 🛤 **GoRouter** | Navigasi deklaratif untuk **Web & Desktop**, mendukung **deep linking**. |
| 💾 **SharedPreferences** | Penyimpanan sesi pengguna seperti **token login**. |
| 📸 **ImagePicker** | Mengunggah gambar dari **kamera atau galeri**. |
| 🌍 **intl** | Mendukung **format tanggal/waktu dan multi-bahasa**. |

---

## 🌐 Konfigurasi API  

Aplikasi ini menggunakan **Story API Dicoding** sebagai sumber data utama. Dokumentasi resmi API dapat ditemukan di:  
🔗 [Story API Documentation](https://story-api.dicoding.dev/v1/)  

### 📌 Penting  

⚠ **Token harus disimpan** setelah login karena diperlukan untuk mengakses endpoint lainnya.  
⚠ Data yang dikirimkan akan **otomatis hilang setelah 1 jam**, sehingga pastikan untuk melakukan request ulang jika data tidak tersedia.  
⚠ **Jangan gunakan endpoint guest**, karena endpoint tersebut hanya ditujukan untuk latihan dan tidak dapat digunakan dalam aplikasi sebenarnya.  
