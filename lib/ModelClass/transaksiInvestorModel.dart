import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class TransaksiInvestorModel {
  int id;
  int id_investor;
  DateTime tanggal;
  int nominal;
  String jenis;
  String status;

  TransaksiInvestorModel({
    required this.id,
    required this.id_investor,
    required this.tanggal,
    required this.nominal,
    required this.jenis,
    required this.status,
  });

  factory TransaksiInvestorModel.fromJson(Map<String, dynamic> json) {
    return TransaksiInvestorModel(
      id: json['id'] ?? 0,
      id_investor: json['id_investor'] ?? 0,
      tanggal: json['tanggal'] ?? DateTime.now(),
      nominal: json['nominal'] ?? 0,
      jenis: json['jenis'] ?? '',
      status: json['status'] ?? '',
    );
  }
}

class transaksiInvestorCubit extends Cubit<TransaksiInvestorModel> {
  transaksiInvestorCubit()
      : super(TransaksiInvestorModel(
          id: 0,
          id_investor: 0,
          tanggal: DateTime.now(),
          nominal: 0,
          jenis: "",
          status: "",
        ));

  Future<TransaksiInvestorModel?> fetchData(id) async {
    try {
      if (id == "") {
        return null;
      }
      String url = "http://127.0.0.1:8000/transaksi_investor/id";
      final response = await http.get(Uri.parse(url));
      // print("hjksdhajkhj jkl");
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        if (jsonData.containsKey("data")) {
          final data = jsonData['data'] as Map<String, dynamic>;
          final transaksiInvestorModel = TransaksiInvestorModel.fromJson(data);
          return transaksiInvestorModel;
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

class ListTransaksiInvestorCubit extends Cubit<List<TransaksiInvestorModel>> {
  String url = "http://127.0.0.1:8000/tampilkan_semua_transaksi_investor/";

  ListTransaksiInvestorCubit() : super([]);

  Future<List<TransaksiInvestorModel>> fetchData() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final dataList = jsonData['data'] as List<dynamic>;
        final transaksiInvestorList = dataList
            .map((item) =>
                TransaksiInvestorModel.fromJson(item as Map<String, dynamic>))
            .toList();
        print(dataList);
        emit(transaksiInvestorList);
        return transaksiInvestorList;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print("aaa");
      throw Exception('Failed to load data: $e');
    }
  }
}
