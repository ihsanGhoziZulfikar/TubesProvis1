import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransaksiPeminjamModel {
  int id;
  int id_peminjam;
  DateTime tanggal;
  int nominal;
  String jenis;
  String status;

  TransaksiPeminjamModel({
    required this.id,
    required this.id_peminjam,
    required this.tanggal,
    required this.nominal,
    required this.jenis,
    required this.status,
  });

  factory TransaksiPeminjamModel.fromJson(Map<String, dynamic> json) {
    return TransaksiPeminjamModel(
      id: json['id'] ?? 0,
      id_peminjam: json['id_peminjam'] ?? 0,
      tanggal: json['tanggal'] ?? DateTime.now(),
      nominal: json['nominal'] ?? 0,
      jenis: json['jenis'] ?? '',
      status: json['status'] ?? '',
    );
  }
}

class TransaksiPeminjamCubit extends Cubit<TransaksiPeminjamModel> {
  TransaksiPeminjamCubit()
      : super(TransaksiPeminjamModel(
          id: 0,
          id_peminjam: 0,
          tanggal: DateTime.now(),
          nominal: 0,
          jenis: "",
          status: "",
        ));

  Future<TransaksiPeminjamModel?> fetchData(id) async {
    try {
      if (id == "") {
        return null;
      }
      String url = "http://127.0.0.1:8000/transaksi_peminjam/id";
      final response = await http.get(Uri.parse(url));
      // print("hjksdhajkhj jkl");
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        if (jsonData.containsKey("data")) {
          final data = jsonData['data'] as Map<String, dynamic>;
          final transaksiPeminjamModel = TransaksiPeminjamModel.fromJson(data);
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

class ListTransaksiInvestorCubit extends Cubit<List<TransaksiPeminjamModel>> {
  String url = "http://127.0.0.1:8000/tampilkan_semua_transaksi_peminjam/";

  ListTransaksiInvestorCubit() : super([]);

  Future<List<TransaksiPeminjamModel>> fetchData() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final dataList = jsonData['data'] as List<dynamic>;
        final transaksiPeminjamList = dataList
            .map((item) =>
                TransaksiPeminjamModel.fromJson(item as Map<String, dynamic>))
            .toList();
        print(dataList);
        emit(transaksiPeminjamList);
        return transaksiPeminjamList;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print("aaa");
      throw Exception('Failed to load data: $e');
    }
  }
}
