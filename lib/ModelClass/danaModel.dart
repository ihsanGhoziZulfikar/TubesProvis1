import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DanaModel {
  int id;
  int saldo;

  DanaModel({
    required this.id,
    required this.saldo,
  });

  factory DanaModel.fromJson(Map<String, dynamic> json) {
    return DanaModel(
      id: json['id'] ?? 0,
      saldo: json['saldo'] ?? 0,
    );
  }
}

class DanaCubit extends Cubit<DanaModel> {
  DanaCubit()
      : super(DanaModel(
          id: 0,
          saldo: 0,
        ));

  Future<DanaModel> fetchData(id) async {
    try {
      String url = "http://127.0.0.1:8000/dana/$id";
      final response = await http.get(Uri.parse(url));
      print("bb");
      if (response.statusCode == 200) {
        print(response);
        final jsonData = jsonDecode(response.body);
        final data = jsonData['data'] as Map<String, dynamic>;
        final umkmModel = DanaModel.fromJson(data);
        emit(umkmModel);
        return umkmModel;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print(e);
      throw Exception('Failed to load data: $e');
    }
  }
}


Future<void> updateDana(int id, int saldo) async {
  final url = 'http://127.0.0.1:8000/update_dana_patch/$id';

  final umkmData = {
    'id': 0,
    'saldo': saldo,
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