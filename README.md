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
| **Flutter** | Framework utama |
| **Dart** | Bahasa pemrograman |
| **Provider** | State management |
| **Dio** | HTTP client untuk komunikasi API |
| **GoRouter** | Navigasi deklaratif & deep linking |
| **SharedPreferences** | Penyimpanan sesi lokal |
| **ImagePicker** | Mengunggah gambar dari kamera/galeri |
| **intl** | Localization & multi-bahasa |

---
