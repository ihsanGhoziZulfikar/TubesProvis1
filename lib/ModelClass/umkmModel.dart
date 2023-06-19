import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';

class UmkmModel {
  int id;
  String nama;
  String alamat;
  String deskripsi;
  int tahun;
  String jenis;
  String status;

  UmkmModel({
    required this.id,
    required this.nama,
    required this.alamat,
    required this.deskripsi,
    required this.tahun,
    required this.jenis,
    required this.status,
  });

  factory UmkmModel.fromJson(Map<String, dynamic> json) {
    return UmkmModel(
      id: json['id'] ?? '',
      nama: json['nama'] ?? '',
      alamat: json['alamat'] ?? '',
      deskripsi: json['deskripsi'] ?? '',
      tahun: json['tahun'] ?? 0,
      jenis: json['jenis'] ?? '',
      status: json['status'] ?? '',
    );
  }
}

class UmkmCubit extends Cubit<UmkmModel> {
  UmkmCubit()
      : super(UmkmModel(
          id: 0,
          nama: '',
          alamat: '',
          deskripsi: '',
          tahun: 0,
          jenis: '',
          status: '',
        ));

  Future<UmkmModel> fetchData(id) async {
    try {
      String url = "http://127.0.0.1:8000/umkm/$id";
      final response = await http.get(Uri.parse(url));
      print("bb");
      if (response.statusCode == 200) {
        print(response);
        final jsonData = jsonDecode(response.body);
        final data = jsonData['data'] as Map<String, dynamic>;
        final accountModel = UmkmModel.fromJson(data);
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

class ListUmkmCubit extends Cubit<List<UmkmModel>> {
  String url = "http://127.0.0.1:8000/tampilkan_semua_umkm/";

  ListUmkmCubit() : super([]);

  Future<List<UmkmModel>> fetchData() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final dataList = jsonData['data'] as List<dynamic>;
        final umkmList = dataList
            .map((item) => UmkmModel.fromJson(item as Map<String, dynamic>))
            .toList();
        print(dataList);
        emit(umkmList);
        return umkmList;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print("aaa");
      throw Exception('Failed to load data: $e');
    }
  }
}

Future<void> updateUmkm(int id, String nama, String alamat, int tahun,
    String deskripsi, String jenis) async {
  final url = 'http://127.0.0.1:8000/update_umkm_patch/$id';

  final umkmData = {
    'id': 0,
    'nama': nama,
    'alamat': alamat,
    'tahun': tahun,
    'deskripsi': deskripsi,
    'jenis': jenis
  };

  final response = await http.patch(
    Uri.parse(url),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(umkmData),
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

Future<void> updateStatusUmkm(int id, String status) async {
  final url = 'http://127.0.0.1:8000/update_umkm_patch/$id';

  final umkmData = {
    'id': id,
    'status': status,
  };

  final response = await http.patch(
    Uri.parse(url),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(umkmData),
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
