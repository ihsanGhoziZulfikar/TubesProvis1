import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class InvestorModel {
  int id;
  int id_dana;
  String nama;
  String email;
  String password;

  InvestorModel({
    required this.id,
    required this.id_dana,
    required this.nama,
    required this.email,
    required this.password,
  });

  factory InvestorModel.fromJson(Map<String, dynamic> json) {
    return InvestorModel(
      id: json['id'] ?? '',
      id_dana: json['id_dana'] ?? '',
      nama: json['nama'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
    );
  }
}

class InvestorCubit extends Cubit<InvestorModel> {
  InvestorCubit()
      : super(InvestorModel(
          id: 0,
          id_dana: 0,
          nama: "",
          email: "",
          password: "",
        ));

  Future<InvestorModel?> fetchData2(email, password) async {
    try {
      if (email == "" || password == "") {
        return null;
      }
      print("hjksdhajkhj jkl 1");
      String url = "http://127.0.0.1:8000/investor/$email/$password";
      final response = await http.get(Uri.parse(url));
      print("hjksdhajkhj jkl 2");
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        if (jsonData.containsKey("data")) {
          final data = jsonData['data'] as Map<String, dynamic>;
          final peminjamModel = InvestorModel.fromJson(data);
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
