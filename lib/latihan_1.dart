import 'dart:convert';

import 'package:flutter/foundation.dart';

void main() {
  // JSON string yang merepresentasikan data transkrip mahasiswa
  String jsonString = '''
  {
    "nama": "Marcellio Aurel Christian",
    "nim": "22082010019",
    "jurusan": "Sistem Informasi",
    "mata_kuliah": [
      {
        "nama_mk": "Pancasila",
        "nilai": "A",
        "kredit": 4
      },
      {
        "nama_mk": "Bahasa Inggris",
        "nilai": "A-",
        "kredit": 3.75
      },
      {
        "nama_mk": "Pengetahuam Bisnis",
        "nilai": "A-",
        "kredit": 3.75
      },
      {
        "nama_mk": "Matematika Komputasi",
        "nilai": "B",
        "kredit": 3
      },
      {
        "nama_mk": "Pengantar Sistem Informasi",
        "nilai": "A",
        "kredit": 4
      },
      {
        "nama_mk": "BP-1",
        "nilai": "B",
        "kredit": 3
      },
      {
        "nama_mk": "LOGALGO",
        "nilai": "A",
        "kredit": 4
      },
      {
        "nama_mk": "Agama Islam",
        "nilai": "A",
        "kredit": 4
      },
      {
        "nama_mk": "Bahas Indonesia",
        "nilai": "A",
        "kredit": 4
      },
      {
        "nama_mk": "KWN",
        "nilai": "A",
        "kredit": 4
      },
      {
        "nama_mk": "BP-2",
        "nilai": "B+",
        "kredit": 3.5
      },
      {
        "nama_mk": "SIM",
        "nilai": "A",
        "kredit": 4
      },
      {
        "nama_mk": "BASDAT",
        "nilai": "B+",
        "kredit": 3.5
      },
      {
        "nama_mk": "APB",
        "nilai": "A",
        "kredit": 4
      },
      {
        "nama_mk": "RPL",
        "nilai": "B+",
        "kredit": 3.5
      },
      {
        "nama_mk": "METPEN",
        "nilai": "A-",
        "kredit": 3.75
      },
      {
        "nama_mk": "BELNEG",
        "nilai": "A",
        "kredit": 4
      },
      {
        "nama_mk": "TKTI",
        "nilai": "A-",
        "kredit": 3.75
      },
      {
        "nama_mk": "DMJ",
        "nilai": "A",
        "kredit": 4
      },
      {
        "nama_mk": "IMK",
        "nilai": "A",
        "kredit": 4
      },
      {
        "nama_mk": "PEMDESK",
        "nilai": "A",
        "kredit": 4
      },
      {
        "nama_mk": "ADSI",
        "nilai": "A-",
        "kredit": 3.75
      },
      {
        "nama_mk": "ABD",
        "nilai": "A",
        "kredit": 4
      }
    ]
  }
  ''';

  // Parsing JSON string ke dalam Map<String, dynamic>
  Map<String, dynamic> mahasiswaJson = jsonDecode(jsonString);

  // Akses daftar mata kuliah
  List<dynamic> mataKuliah = mahasiswaJson['mata_kuliah'];

  // Inisialisasi variabel untuk perhitungan IPK
  double totalNilai = 0.0;
  double totalKredit = 0.0;

  // Fungsi untuk mengonversi nilai huruf ke angka
  double nilaiKeAngka(String nilai) {
    switch (nilai) {
      case 'A':
        return 4.0;
      case 'A-':
        return 3.7;
      case 'B+':
        return 3.3;
      case 'B':
        return 3.0;
      case 'B-':
        return 2.7;
      case 'C+':
        return 2.3;
      case 'C':
        return 2.0;
      case 'D':
        return 1.0;
      default:
        return 0.0; // untuk nilai yang tidak dikenal atau gagal
    }
  }

  // Perulangan untuk menghitung total nilai dan total kredit
  for (var mk in mataKuliah) {
    String nilai = mk['nilai'];
    totalNilai += nilaiKeAngka(nilai) * mk['kredit'];
    totalKredit += mk['kredit'] as double; 
  }

  // Menghitung IPK
  double ipk = totalNilai / totalKredit;

  // Cetak IPK
  if (kDebugMode) {
    print(
      "IPK dari ${mahasiswaJson['nama']} Jurusan ${mahasiswaJson['jurusan']} adalah ${ipk.toStringAsFixed(2)}");
  }
}
