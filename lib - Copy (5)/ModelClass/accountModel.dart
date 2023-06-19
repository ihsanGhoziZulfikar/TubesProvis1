import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AccountModel {
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

  AccountModel({
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

  factory AccountModel.fromJson(Map<String, dynamic> json) {
    return AccountModel(
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

class AccountCubit extends Cubit<AccountModel> {
  AccountCubit()
      : super(AccountModel(
          id: 0,
          id_dana: 0,
          id_umkm: 0,
          nama: '',
          email: '',
          password: '',
          phone: '',
          tempat: '',
          tanggal: '',
          gender: '',
          alamat: '',
          provinsi: '',
          kabupaten: '',
          pekerjaan: '',
          kodepos: 0,
          norek: '',
          pendapatan: 0,
          ktp: '',
          selfie: '',
          npwp: '',
        ));

  Future<AccountModel> fetchData(id, tanda) async {
    try {
      String url = "http://127.0.0.1:8000/$tanda/$id";
      final response = await http.get(Uri.parse(url));
      print("bb");
      if (response.statusCode == 200) {
        print(response);
        final jsonData = jsonDecode(response.body);
        final data = jsonData['data'] as Map<String, dynamic>;
        final accountModel = AccountModel.fromJson(data);
        emit(accountModel);
        return accountModel;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print(e);
      throw Exception('Failed to load data: $e');
    }
  }
}
