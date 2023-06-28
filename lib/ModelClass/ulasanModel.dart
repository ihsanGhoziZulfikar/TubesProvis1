import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';

class UlasanModel {
  int id;
  int id_umkm;
  String ulasan;
  int rating;

  UlasanModel({
    required this.id,
    required this.id_umkm,
    required this.ulasan,
    required this.rating,
  });

  factory UlasanModel.fromJson(Map<String, dynamic> json) {
    return UlasanModel(
      id: json['id'] ?? 0,
      id_umkm: json['id_umkm'] ?? 0,
      ulasan: json['ulasan'] ?? '',
      rating: json['rating'] ?? 0,
    );
  }
}

class UlasanCubit extends Cubit<UlasanModel> {
  UlasanCubit()
      : super(UlasanModel(
          id: 0,
          id_umkm: 0,
          ulasan: "",
          rating: 0,
        ));

  Future<UlasanModel?> fetchData(id) async {
    try {
      if (id == "") {
        return null;
      }
      String url = "http://127.0.0.1:8000/ulasan/id";
      final response = await http.get(Uri.parse(url));
      // print("hjksdhajkhj jkl");
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        if (jsonData.containsKey("data")) {
          final data = jsonData['data'] as Map<String, dynamic>;
          final transaksiPeminjamModel = UlasanModel.fromJson(data);
          return transaksiPeminjamModel;
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

class ListUlasanCubit extends Cubit<List<UlasanModel>> {
  String url = "http://127.0.0.1:8000/tampilkan_semua_ulasan/";

  ListUlasanCubit() : super([]);

  Future<List<UlasanModel>> fetchData() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final dataList = jsonData['data'] as List<dynamic>;
        final ulasanList = dataList
            .map((item) => UlasanModel.fromJson(item as Map<String, dynamic>))
            .toList();
        print(dataList);
        emit(ulasanList);
        return ulasanList;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print("aaa");
      throw Exception('Failed to load data: $e');
    }
  }
}
