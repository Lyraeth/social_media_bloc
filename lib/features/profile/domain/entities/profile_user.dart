import 'package:social_media_bloc/features/auth/domain/entities/app_user.dart';

class ProfileUser extends AppUser {
  final String tempLahir;
  final String tglLahir;
  final String email;
  final String kelasSaatIni;
  final String aktif;
  final String statLulus;

  const ProfileUser({
    required super.nis,
    required super.nisn,
    required super.nama,
    required this.tempLahir,
    required this.tglLahir,
    required this.email,
    required this.kelasSaatIni,
    required this.aktif,
    required this.statLulus,
  });

  // method convert json -> profileUser
  factory ProfileUser.fromJson(Map<String, dynamic> json) {
    return ProfileUser(
      nis: json['NIS'],
      nisn: json['NISN'],
      nama: json['Nama'],
      tempLahir: json['TempLahir'] ?? '',
      tglLahir: json['TglLahir'] ?? '',
      email: json['Email'] ?? '',
      kelasSaatIni: json['KelasSaatIni'] ?? '',
      aktif: json['Aktif'] ?? '',
      statLulus: json['Stat_lulus'] ?? '',
    );
  }
}
