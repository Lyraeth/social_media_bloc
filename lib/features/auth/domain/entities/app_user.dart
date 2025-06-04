/*

File: app_user.dart

Deskripsi:
File ini berisi model data untuk merepresentasikan informasi pengguna (user)
dalam aplikasi. Model ini biasanya digunakan untuk menyimpan dan mengelola
data user seperti nama, email, ID, dan atribut lain yang berkaitan dengan user.

Penggunaan:
Model user ini dapat digunakan untuk proses autentikasi, otorisasi,
serta pengelolaan data user di seluruh aplikasi.

Contoh penggunaan:
```dart
final user = AppUser(id: '123', name: 'Budi', email: 'budi@email.com');
print(user.name); // Output: Budi
```

*/

class AppUser {
  final String nis;
  final String nisn;
  final String nama;

  // final String? jenisKelamin;
  // final String? agama;
  // final String? alamat;
  // final String? telpon;
  // final String diterimaDiKelas;
  // final String? nomorKelas;
  // final String? tglDiterima;
  // final String? semester;
  // final String? namaSekolahAsal;
  // final String? alamatSekolahAsal;
  // final int? tahunIjazah;
  // final String? noIjazah;
  // final String? tahunSkhun;
  // final String? noSkhun;
  // final int? anakKe;
  // final String? statKel;
  // final String? namaAyah;
  // final String? namaIbu;
  // final String? pekerjaanAyah;
  // final String? pekerjaanIbu;
  // final String? alamatOrtu;
  // final String? telponOrtu;
  // final String? nimwali;
  // final String? alamatWali;
  // final String? telpWali;
  // final String? pekerjaanWali;

  // final String? nomorKelasSaatIni;

  // final int? statUjian;
  // final String? ortuPass;
  // final String? aksesSkl;

  // final DateTime? createdAt;
  // final DateTime? updatedAt;

  const AppUser({
    required this.nis,
    required this.nisn,
    required this.nama,
    // this.tempLahir,
    // this.tglLahir,
    // this.jenisKelamin,
    // this.agama,
    // this.alamat,
    // this.telpon,
    // this.diterimaDiKelas,
    // this.nomorKelas,
    // this.tglDiterima,
    // this.semester,
    // this.namaSekolahAsal,
    // this.alamatSekolahAsal,
    // this.tahunIjazah,
    // this.noIjazah,
    // this.tahunSkhun,
    // this.noSkhun,
    // this.anakKe,
    // this.statKel,
    // this.namaAyah,
    // this.namaIbu,
    // this.pekerjaanAyah,
    // this.pekerjaanIbu,
    // this.alamatOrtu,
    // this.telponOrtu,
    // this.nimwali,
    // this.alamatWali,
    // this.telpWali,
    // this.pekerjaanWali,
    // this.email,
    // this.kelasSaatIni,
    // this.nomorKelasSaatIni,
    // this.aktif,
    // this.statUjian,
    // this.ortuPass,
    // this.aksesSkl,
    // this.statLulus,
    // this.createdAt,
    // this.updatedAt,
  });

  // Convert AppUser ke format JSON
  // Map<String, dynamic> toJson() {
  //   return {
  //     'nis': nis,
  //     'nisn': nisn,
  //     'nama': nama,
  //     'tempLahir': tempLahir,
  //     'tglLahir': tglLahir,
  //     'jenisKelamin': jenisKelamin,
  //     'agama': agama,
  //     'alamat': alamat,
  //     'telpon': telpon,
  //     'diterimaDiKelas': diterimaDiKelas,
  //     'nomorKelas': nomorKelas,
  //     'tglDiterima': tglDiterima,
  //     'semester': semester,
  //     'namaSekolahAsal': namaSekolahAsal,
  //     'alamatSekolahAsal': alamatSekolahAsal,
  //     'tahunIjazah': tahunIjazah,
  //     'noIjazah': noIjazah,
  //     'tahunSkhun': tahunSkhun,
  //     'noSkhun': noSkhun,
  //     'anakKe': anakKe,
  //     'statKel': statKel,
  //     'namaAyah': namaAyah,
  //     'namaIbu': namaIbu,
  //     'pekerjaanAyah': pekerjaanAyah,
  //     'pekerjaanIbu': pekerjaanIbu,
  //     'alamatOrtu': alamatOrtu,
  //     'telponOrtu': telponOrtu,
  //     'nmWali': nmWali,
  //     'alamatWali': alamatWali,
  //     'telpWali': telpWali,
  //     'pekerjaanWali': pekerjaanWali,
  //     'email': email,
  //     'kelasSaatIni': kelasSaatIni,
  //     'nomorKelasSaatIni': nomorKelasSaatIni,
  //     'aktif': aktif,
  //     'statNaik': statNaik,
  //     'unameOrtu': unameOrtu,
  //     'ortuPass': ortuPass,
  //     'statUjian': statUjian,
  //     'aksesSkl': aksesSkl,
  //     'statLulus': statLulus,
  //     'createdAt': createdAt?.toIso8601String(),
  //     'updatedAt': updatedAt?.toIso8601String(),
  //   };
  // }

  // Convert JSON ke AppUser
  factory AppUser.fromJson(Map<String, dynamic> json) {
    return AppUser(
      nis: json['NIS'],
      nisn: json['NISN'],
      nama: json['Nama'],

      // jenisKelamin: json['JenisKelamin'] as String?,
      // agama: json['Agama'] as String?,
      // alamat: json['Alamat'] as String?,
      // telpon: json['Telpon'] as String?,
      // diterimaDiKelas: json['DiterimaDiKelas'] as String?,
      // nomorKelas: json['NomorKelas'] as String?,
      // tglDiterima: json['TglDiTerima'] as String?,
      // semester: json['Semester'] as String?,
      // namaSekolahAsal: json['NamaSekolahAsal'] as String?,
      // alamatSekolahAsal: json['AlamatSekolahAsal'] as String?,
      // tahunIjazah: json['TahunIjasah'] is int
      //     ? json['TahunIjasah'] as int?
      //     : int.tryParse(json['TahunIjasah']?.toString() ?? ''),
      // noIjazah: json['NoIjasah'] as String?,
      // tahunSkhun: json['TahunSkhun']?.toString(),
      // noSkhun: json['NoSkhun'] as String?,
      // anakKe: json['AnakKe'] is int
      //     ? json['AnakKe'] as int?
      //     : int.tryParse(json['AnakKe']?.toString() ?? ''),
      // statKel: json['StatKel'] as String?,
      // namaAyah: json['NamaAyah'] as String?,
      // namaIbu: json['NamaIbu'] as String?,
      // pekerjaanAyah: json['PekerjaanAyah'] as String?,
      // pekerjaanIbu: json['PekerjaanIbu'] as String?,
      // alamatOrtu: json['AlamatOrtu'] as String?,
      // telponOrtu: json['TelponOrtu'] as String?,
      // nimwali: json['NmWali'] as String?,
      // alamatWali: json['AlamatWali'] as String?,
      // telpWali: json['TelpWali'] as String?,
      // pekerjaanWali: json['PekerjaanWali'] as String?,

      // nomorKelasSaatIni: json['NomorKelasSaatIni'] as String?,

      // statUjian: json['StatUjian'] is int
      //     ? json['StatUjian'] as int?
      //     : int.tryParse(json['StatUjian']?.toString() ?? ''),
      // ortuPass: json['OrtuPass'] as String?,
      // aksesSkl: json['Akses_skl'] as String?,

      // createdAt: json['created_at'] != null
      //     ? DateTime.tryParse(json['created_at'])
      //     : null,
      // updatedAt: json['updated_at'] != null
      //     ? DateTime.tryParse(json['updated_at'])
      //     : null,
    );
  }
}
