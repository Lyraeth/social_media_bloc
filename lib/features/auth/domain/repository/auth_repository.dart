/*

File ini berisi implementasi utama dari fitur atau modul terkait.

Fungsionalitas yang disediakan dalam file ini meliputi:
- Inisialisasi dan konfigurasi komponen utama.
- Pengelolaan data dan logika bisnis.
- Integrasi dengan modul atau layanan eksternal jika diperlukan.

Pastikan untuk membaca dokumentasi pada setiap fungsi dan kelas untuk
memahami detail implementasi dan cara penggunaannya.

*/

import 'package:social_media_bloc/features/auth/domain/entities/app_user.dart';

abstract class AuthRepository {
  // Method untuk user bisa login menggunakan NIS dan Password
  Future<AppUser?> loginWithNisAndPassword({
    required String nis,
    required String password,
  });

  // Method untuk user Logout
  Future<void> logout();

  // Method untuk mendapatkan User yang sedang login
  Future<AppUser?> getCurrentUser();
}
