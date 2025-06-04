import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:social_media_bloc/features/profile/domain/entities/profile_user.dart';
import 'package:social_media_bloc/features/profile/domain/repository/profile_repository.dart';

class ApiProfileRepository implements ProfileRepository {
  final _apiUrl = 'https://laravelbackend.jh-beon.cloud/smk/public/api/siswa';
  final _storage = FlutterSecureStorage();

  @override
  Future<ProfileUser?> fetchUserProfile(String nis) async {
    final token = await _storage.read(key: "token");
    try {
      final fetchUser = await http.get(
        Uri.parse('$_apiUrl/$nis'),
        headers: {'Authorization': 'Bearer $token'},
      );

      if (fetchUser.statusCode == 200) {
        final data = jsonDecode(fetchUser.body);

        return ProfileUser(
          nis: nis,
          nisn: data['NISN'],
          nama: data['Nama'],
          tempLahir: data['TempLahir'],
          tglLahir: data['TglLahir'],
          email: data['Email'],
          kelasSaatIni: data['KelasSaatIni'],
          aktif: data['Aktif'],
          statLulus: data['Stat_lulus'],
        );
      }

      return null;
    } catch (e) {
      return null;
    }
  }
}
