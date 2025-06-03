/*
Cubit untuk mengelola state autentikasi pengguna pada aplikasi.
`AuthCubit` bertanggung jawab untuk:
- Mengecek status autentikasi pengguna saat ini.
- Melakukan proses login menggunakan NIS dan password.
- Melakukan proses logout.
- Menyimpan data pengguna yang sedang login.
Cubit ini menggunakan `AuthRepository` untuk berinteraksi dengan sumber data autentikasi.
State yang dikelola meliputi:
- [AuthInitial]: State awal sebelum ada aksi.
- [AuthLoading]: State saat proses autentikasi sedang berlangsung.
- [Authenticated]: State ketika pengguna berhasil login.
- [Unauthenticated]: State ketika tidak ada pengguna yang login.
- [AuthError]: State ketika terjadi error pada proses autentikasi.
Contoh penggunaan:
```dart
final authCubit = AuthCubit(authRepository: repository);
authCubit.login('12345', 'password');
```
*/

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_bloc/features/auth/data/api_auth_repository.dart';
import 'package:social_media_bloc/features/auth/domain/entities/app_user.dart';
import 'package:social_media_bloc/features/auth/presentation/cubits/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final ApiAuthRepository apiAuthRepository;
  AppUser? _currentUser;

  AuthCubit({required this.apiAuthRepository}) : super(AuthInitial());

  // check apakah ada user yang login
  void checkAuth() async {
    final AppUser? user = await apiAuthRepository.getCurrentUser();
    // jika usernya ada
    if (user != null) {
      _currentUser = user;

      // AuthState jadi Authenticated
      emit(Authenticated(user));
    } else {
      // AuthState jadi Unauthenticated
      emit(Unauthenticated());
    }
  }

  // Ambil user sekarang
  AppUser? get currentUser => _currentUser;

  // login dengan NIS dan Password
  Future<void> login(String nis, String password) async {
    try {
      emit(AuthLoading());
      final user = await apiAuthRepository.loginWithNisAndPassword(
        nis: nis,
        password: password,
      );

      if (user != null) {
        _currentUser = user;
        emit(Authenticated(user));
      } else {
        emit(Unauthenticated());
      }
    } catch (e) {
      emit(AuthError(e.toString()));
      emit(Unauthenticated());
    }
  }

  // Logout
  Future<void> logout() async {
    await apiAuthRepository.logout();
    emit(Unauthenticated());
  }
}
