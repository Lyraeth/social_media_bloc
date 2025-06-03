/*
State classes for authentication feature.

Mendefinisikan berbagai state yang mungkin terjadi selama proses autentikasi,
seperti initial, loading, authenticated, unauthenticated, dan error.

- [AuthInitial]: State awal sebelum proses autentikasi dimulai.
- [AuthLoading]: State saat proses autentikasi sedang berlangsung.
- [Authenticated]: State ketika user berhasil terautentikasi, menyimpan data [AppUser].
- [Unauthenticated]: State ketika user tidak terautentikasi.
- [AuthError]: State ketika terjadi error selama proses autentikasi, menyimpan pesan error.

*/

import 'package:social_media_bloc/features/auth/domain/entities/app_user.dart';

abstract class AuthState {}

// initial atau saat ini
class AuthInitial extends AuthState {}

// loading..
class AuthLoading extends AuthState {}

// authenticated atau terautentikasi
class Authenticated extends AuthState {
  final AppUser user;
  Authenticated(this.user);
}

// unauthenticated atau tidak terautentikasi
class Unauthenticated extends AuthState {}

// error handling
class AuthError extends AuthState {
  final String message;
  AuthError(this.message);
}
