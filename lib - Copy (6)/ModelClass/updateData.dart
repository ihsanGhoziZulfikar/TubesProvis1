// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// Future<void> updateUmkm(int id, String nama, String alamat, int tahun,
//     String deskripsi, String jenis) async {
//   final url = 'http://127.0.0.1:8000/update_umkm_patch/$id';

//   final umkmData = {
//     'id': 0,
//     'nama': nama,
//     'alamat': alamat,
//     'tahun': tahun,
//     'deskripsi': deskripsi,
//     'jenis': jenis
//   };

//   final response = await http.patch(
//     Uri.parse(url),
//     headers: {'Content-Type': 'application/json'},
//     body: jsonEncode(umkmData),
//   );

//   if (response.statusCode == 201) {
//     // Success
//     final responseData = jsonDecode(response.body);
//     print('New UMKM created with ID: ${responseData['id']}');
//   } else {
//     // Error
//     print('Failed to create UMKM. Status code: ${response.statusCode}');
//     print('Error message: ${response.body}');
//   }
// }
