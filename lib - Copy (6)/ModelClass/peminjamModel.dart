import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PeminjamModel {
  int id;
  int id_dana;
  int id_umkm;
  String nama;
  String email;
  String password;
  String phone;
  String tempat;
  String tanggal;
  String gender;
  String alamat;
  String provinsi;
  String kabupaten;
  String pekerjaan;
  int kodepos;
  String norek;
  int pendapatan;
  String ktp;
  String selfie;
  String npwp;

  PeminjamModel({
    required this.id,
    required this.id_dana,
    required this.id_umkm,
    required this.nama,
    required this.email,
    required this.password,
    required this.phone,
    required this.tempat,
    required this.tanggal,
    required this.gender,
    required this.alamat,
    required this.provinsi,
    required this.kabupaten,
    required this.pekerjaan,
    required this.kodepos,
    required this.norek,
    required this.pendapatan,
    required this.ktp,
    required this.selfie,
    required this.npwp,
  });

  factory PeminjamModel.fromJson(Map<String, dynamic> json) {
    return PeminjamModel(
      id: json['id'] ?? 0,
      id_dana: json['id_dana'] ?? 0,
      id_umkm: json['id_umkm'] ?? 0,
      nama: json['nama'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      phone: json['phone'] ?? '',
      tempat: json['tempat'] ?? '',
      tanggal: json['tanggal'] ?? '',
      gender: json['gender'] ?? '',
      alamat: json['alamat'] ?? '',
      provinsi: json['provinsi'] ?? '',
      kabupaten: json['kabupaten'] ?? '',
      pekerjaan: json['pekerjaan'] ?? '',
      kodepos: json['kodepos'] ?? 0,
      norek: json['norek'] ?? '',
      pendapatan: json['pendapatan'] ?? 0,
      ktp: json['ktp'] ?? '',
      selfie: json['selfie'] ?? '',
      npwp: json['npwp'] ?? '',
    );
  }
}

class PeminjamCubit extends Cubit<PeminjamModel> {
  PeminjamCubit()
      : super(PeminjamModel(
          id: 0,
          id_dana: 0,
          id_umkm: 0,
          nama: "",
          email: "",
          password: "",
          phone: "",
          tempat: "",
          tanggal: "",
          gender: "",
          alamat: "",
          provinsi: "",
          kabupaten: "",
          pekerjaan: "",
          kodepos: 0,
          norek: "",
          pendapatan: 0,
          ktp: "",
          selfie: "",
          npwp: "",
        ));

  Future<PeminjamModel?> fetchData(email, password) async {
    try {
      if (email == "" || password == "") {
        return null;
      }
      String url = "http://127.0.0.1:8000/peminjam/$email/$password";
      final response = await http.get(Uri.parse(url));
      print("hjksdhajkhj jkl");
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        if (jsonData.containsKey("data")) {
          final data = jsonData['data'] as Map<String, dynamic>;
          final peminjamModel = PeminjamModel.fromJson(data);
          return peminjamModel;
        } else {
          return null;
        }
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print(e);
      throw Exception('Failed to load data: $e');
    }
  }
}

Future<void> updatePeminjam(
  int id,
  int id_dana,
  int id_umkm,
  String nama,
  String email,
  String password,
  String phone,
  String tempat,
  String tanggal,
  String gender,
  String alamat,
  String provinsi,
  String kabupaten,
  String pekerjaan,
  int kodepos,
  String norek,
  int pendapatan,
  String ktp,
  String selfie,
  String npwp,
) async {
  final url = 'http://127.0.0.1:8000/update_peminjam_patch/$id';

  final peminjamData = {
    'id': id,
    'id_dana': id_dana,
    'id_umkm': id_umkm,
    'nama': nama,
    'email': email,
    'password': password,
    'phone': phone,
    'tempat': tempat,
    'tanggal': tanggal,
    'gender': gender,
    'alamat': alamat,
    'provinsi': provinsi,
    'kabupaten': kabupaten,
    'pekerjaan': pekerjaan,
    'kodepos': kodepos,
    'norek': norek,
    'pendapatan': pendapatan,
    'ktp': ktp,
    'selfie': selfie,
    'npwp': npwp,
  };

  final response = await http.patch(
    Uri.parse(url),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(peminjamData),
  );

  if (response.statusCode == 201) {
    // Success
    final responseData = jsonDecode(response.body);
    print('New UMKM created with ID: ${responseData['id']}');
  } else {
    // Error
    print('Failed to create UMKM. Status code: ${response.statusCode}');
    print('Error message: ${response.body}');
  }
}
