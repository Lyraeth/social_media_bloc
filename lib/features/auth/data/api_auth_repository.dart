/*
[api_auth_repository.dart]

Repository otentikasi yang mengimplementasikan [AuthRepository] menggunakan API eksternal.

Fitur utama:
- Login menggunakan NIS dan password, menyimpan token dan data user ke [FlutterSecureStorage].
- Logout dengan menghapus seluruh data dari storage.
- Mendapatkan user yang sedang login dari storage.

Metode:
- [loginWithNisAndPassword]: Melakukan request ke endpoint login, menyimpan token dan data user jika berhasil, serta mengembalikan objek [AppUser].
- [logout]: Menghapus seluruh data yang tersimpan di storage.
- [getCurrentUser]: Mengambil data user yang sedang login dari storage dan mengembalikan objek [AppUser].

Catatan:
- Data user disimpan dalam storage dalam bentuk JSON.
- Error handling dilakukan dengan melempar exception jika login gagal.
- Pastikan dependensi [flutter_secure_storage] dan [http] sudah ditambahkan pada proyek.

Digunakan pada fitur autentikasi aplikasi.
*/

import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:social_media_bloc/features/auth/domain/entities/app_user.dart';
import 'package:social_media_bloc/features/auth/domain/repository/auth_repository.dart';

class ApiAuthRepository implements AuthRepository {
  final _apiUrl = 'https://laravelbackend.jh-beon.cloud/smk/public/api/login';
  final _storage = FlutterSecureStorage();

  @override
  Future<AppUser?> loginWithNisAndPassword({
    required String nis,
    required String password,
  }) async {
    try {
      // Signin
      final userCredential = await http.post(
        Uri.parse(_apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'nis': nis, 'password': password}),
      );

      // kalo login berhasil
      if (userCredential.statusCode == 200) {
        final data = jsonDecode(userCredential.body);
        final accessToken = data['access_token'];
        final nisSiswa = data['siswa']['NIS'];
        final dataSiswa = data['siswa'];

        // masukkan token, nis, dan data siswa yang login ke Storage
        await _storage.write(key: "token", value: accessToken);
        await _storage.write(key: "nis", value: nisSiswa);
        await _storage.write(key: "siswa", value: jsonEncode(dataSiswa));

        // masukkan data user login ke AppUser
        AppUser user = AppUser(
          nis: dataSiswa['NIS'],
          nisn: dataSiswa['NISN'],
          nama: dataSiswa['Nama'],
          tempLahir: dataSiswa['TempLahir'],
          tglLahir: dataSiswa['TglLahir'],
          jenisKelamin: dataSiswa['JenisKelamin'],
          agama: dataSiswa['Agama'],
          alamat: dataSiswa['Alamat'],
          telpon: dataSiswa['Telpon'],
          diterimaDiKelas: dataSiswa['DiterimaDiKelas'],
          nomorKelas: dataSiswa['NomorKelas'],
          tglDiterima: dataSiswa['TglDiTerima'],
          semester: dataSiswa['Semester'],
          namaSekolahAsal: dataSiswa['NamaSekolahAsal'],
          alamatSekolahAsal: dataSiswa['AlamatSekolahAsal'],
          tahunIjazah: dataSiswa['TahunIjasah'],
          noIjazah: dataSiswa['NoIjasah'],
          tahunSkhun: dataSiswa['TahunSkhun'],
          noSkhun: dataSiswa['NoSkhun'],
          anakKe: dataSiswa['AnakKe'],
          statKel: dataSiswa['StatKel'],
          namaAyah: dataSiswa['NamaAyah'],
          namaIbu: dataSiswa['NamaIbu'],
          pekerjaanAyah: dataSiswa['PekerjaanAyah'],
          pekerjaanIbu: dataSiswa['PekerjaanIbu'],
          alamatOrtu: dataSiswa['AlamatOrtu'],
          telponOrtu: dataSiswa['TelponOrtu'],
          alamatWali: dataSiswa['AlamatWali'],
          telpWali: dataSiswa['TelpWali'],
          pekerjaanWali: dataSiswa['PekerjaanWali'],
          email: dataSiswa['Email'],
          kelasSaatIni: dataSiswa['KelasSaatIni'],
          nomorKelasSaatIni: dataSiswa['NomorKelasSaatIni'],
          aktif: dataSiswa['Aktif'],
          ortuPass: dataSiswa['OrtuPass'],
          statUjian: dataSiswa['StatUjian'],
          aksesSkl: dataSiswa['Akses_skl'],
          statLulus: dataSiswa['Stat_lulus'],
          createdAt: dataSiswa['created_at'],
          updatedAt: dataSiswa['updated_at'],
        );
        // Return Usernya
        return user;
      }
    }
    // Error handling kalo login gagal
    catch (e) {
      throw Exception('Login gagal: $e');
    }
    return null;
  }

  @override
  Future<void> logout() async {
    await _storage.deleteAll();
  }

  @override
  Future<AppUser?> getCurrentUser() async {
    // Ambil data siswa yang login dari Storage
    final siswaString = await _storage.read(key: 'siswa');

    // jika tidak ada data siswa di storage atau tidak ada user yang login
    if (siswaString == null) {
      return null;
    }

    // Decode data siswa dari JSON
    final dataSiswa = jsonDecode(siswaString);

    // Kembalikan AppUser dari data siswa
    return AppUser(
      nis: dataSiswa['NIS'],
      nisn: dataSiswa['NISN'],
      nama: dataSiswa['Nama'],
      tempLahir: dataSiswa['TempLahir'],
      tglLahir: dataSiswa['TglLahir'],
      jenisKelamin: dataSiswa['JenisKelamin'],
      agama: dataSiswa['Agama'],
      alamat: dataSiswa['Alamat'],
      telpon: dataSiswa['Telpon'],
      diterimaDiKelas: dataSiswa['DiterimaDiKelas'],
      nomorKelas: dataSiswa['NomorKelas'],
      tglDiterima: dataSiswa['TglDiTerima'],
      semester: dataSiswa['Semester'],
      namaSekolahAsal: dataSiswa['NamaSekolahAsal'],
      alamatSekolahAsal: dataSiswa['AlamatSekolahAsal'],
      tahunIjazah: dataSiswa['TahunIjasah'],
      noIjazah: dataSiswa['NoIjasah'],
      tahunSkhun: dataSiswa['TahunSkhun'],
      noSkhun: dataSiswa['NoSkhun'],
      anakKe: dataSiswa['AnakKe'],
      statKel: dataSiswa['StatKel'],
      namaAyah: dataSiswa['NamaAyah'],
      namaIbu: dataSiswa['NamaIbu'],
      pekerjaanAyah: dataSiswa['PekerjaanAyah'],
      pekerjaanIbu: dataSiswa['PekerjaanIbu'],
      alamatOrtu: dataSiswa['AlamatOrtu'],
      telponOrtu: dataSiswa['TelponOrtu'],
      alamatWali: dataSiswa['AlamatWali'],
      telpWali: dataSiswa['TelpWali'],
      pekerjaanWali: dataSiswa['PekerjaanWali'],
      email: dataSiswa['Email'],
      kelasSaatIni: dataSiswa['KelasSaatIni'],
      nomorKelasSaatIni: dataSiswa['NomorKelasSaatIni'],
      aktif: dataSiswa['Aktif'],
      ortuPass: dataSiswa['OrtuPass'],
      statUjian: dataSiswa['StatUjian'],
      aksesSkl: dataSiswa['Akses_skl'],
      statLulus: dataSiswa['Stat_lulus'],
      createdAt: dataSiswa['created_at'],
      updatedAt: dataSiswa['updated_at'],
    );
  }
}
