import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';

class FotoUmkmModel {
  int id;
  int id_umkm;
  String foto;

  FotoUmkmModel({
    required this.id,
    required this.id_umkm,
    required this.foto,
  });

  factory FotoUmkmModel.fromJson(Map<String, dynamic> json) {
    return FotoUmkmModel(
      id: json['id'] ?? 0,
      id_umkm: json['id_umkm'] ?? 0,
      foto: json['foto'] ?? '',
    );
  }
}

class FotoUmkmCubit extends Cubit<FotoUmkmModel> {
  FotoUmkmCubit()
      : super(FotoUmkmModel(
          id: 0,
          id_umkm: 0,
          foto: "",
        ));

  Future<FotoUmkmModel?> fetchData(id) async {
    try {
      if (id == "") {
        return null;
      }
      String url = "http://127.0.0.1:8000/fotoumkm/id";
      final response = await http.get(Uri.parse(url));
      // print("hjksdhajkhj jkl");
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        if (jsonData.containsKey("data")) {
          final data = jsonData['data'] as Map<String, dynamic>;
          final transaksiPeminjamModel = FotoUmkmModel.fromJson(data);
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

class ListUlasanCubit extends Cubit<List<FotoUmkmModel>> {
  String url = "http://127.0.0.1:8000/tampilkan_semua_fotoumkm/";

  ListUlasanCubit() : super([]);

  Future<List<FotoUmkmModel>> fetchData() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final dataList = jsonData['data'] as List<dynamic>;
        final fotoUmkmList = dataList
            .map((item) => FotoUmkmModel.fromJson(item as Map<String, dynamic>))
            .toList();
        print(dataList);
        emit(fotoUmkmList);
        return fotoUmkmList;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print("aaa");
      throw Exception('Failed to load data: $e');
    }
  }
}
