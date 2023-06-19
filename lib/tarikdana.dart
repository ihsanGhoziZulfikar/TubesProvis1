import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// import 'ModelClass/danaMOdel.dart';
import 'ModelClass/danaModel.dart';
import 'navbar.dart';
import 'navbar2.dart';

// class DanaModel {
//   int id;
//   int saldo;

//   DanaModel({
//     required this.id,
//     required this.saldo,
//   });

//   factory DanaModel.fromJson(Map<String, dynamic> json) {
//     return DanaModel(
//       id: json['id'] ?? 0,
//       saldo: json['saldo'] ?? 0,
//     );
//   }
// }

// class DanaCubit extends Cubit<DanaModel> {
//   DanaCubit()
//       : super(DanaModel(
//           id: 0,
//           saldo: 0,
//         ));

//   Future<DanaModel> fetchData(id) async {
//     try {
//       String url = "http://127.0.0.1:8000/dana/$id";
//       final response = await http.get(Uri.parse(url));
//       print("bb");
//       if (response.statusCode == 200) {
//         print(response);
//         final jsonData = jsonDecode(response.body);
//         final data = jsonData['data'] as Map<String, dynamic>;
//         final umkmModel = DanaModel.fromJson(data);
//         emit(umkmModel);
//         return umkmModel;
//       } else {
//         throw Exception('Failed to load data');
//       }
//     } catch (e) {
//       print(e);
//       throw Exception('Failed to load data: $e');
//     }
//   }
// }

// Future<void> updateDana(int id, int saldo) async {
//   final url = 'http://127.0.0.1:8000/update_dana_patch/$id';

//   final umkmData = {
//     'id': 0,
//     'saldo': saldo,
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

class TarikDana extends StatefulWidget {
  int id;
  int id_umkm;
  int id_dana;
  String role;

  TarikDana(
      {super.key,
      required this.id,
      required this.id_umkm,
      required this.id_dana,
      required this.role});

  @override
  State<TarikDana> createState() => _TarikDanaState();
}

class _TarikDanaState extends State<TarikDana> {
  final danaCubit = DanaCubit();
  int nominal = 0;

  var nominalController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<DanaModel>(
          future: danaCubit.fetchData(widget.id_dana),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              final dana = snapshot.data;
              return Container(
                  height: MediaQuery.of(context).size.height,
                  child: SingleChildScrollView(
                      child: Container(
                          child: Column(children: [
                    SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Tarik Dana",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.normal,
                        height: 1.3625,
                        color: Color(0xff000000),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "Jumlah Penarikan",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          height: 1.3625,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                      const Text(
                                        "Biaya Transfer + Rp 2.500,00",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w200,
                                          height: 1.3625,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 10),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    decoration: BoxDecoration(
                                      color: Color(0xffd6e4f0),
                                    ),
                                    child: TextField(
                                      controller: nominalController,
                                      keyboardType: TextInputType.number,
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                      decoration: InputDecoration(
                                        contentPadding:
                                            EdgeInsets.symmetric(horizontal: 5),
                                        border: InputBorder.none,
                                        hintText: 'Rp ',
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "Dana Tersedia",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          height: 1.3625,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          const Text(
                                            "Rp ",
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              height: 1.3625,
                                              color: Color(0xff000000),
                                            ),
                                          ),
                                          Text(
                                            dana!.saldo.toString(),
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              height: 1.3625,
                                              color: Color(0xff000000),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "Informasi Rekening Saya",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      height: 1.3625,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                  Text(
                                    "Bank       : Bank BCA",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w300,
                                      height: 1.3625,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                  Text(
                                    "Atas Nama  : Wijaya Kusuma",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w300,
                                      height: 1.3625,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                  Text(
                                    "No Rekening  : 102345708",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w300,
                                      height: 1.3625,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 280,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        nominal = int.tryParse(
                                                nominalController.text) ??
                                            0; //akses text via controller
                                      }); //refresh
                                      if (dana.saldo >= nominal) {
                                        updateDana(
                                          widget.id_dana,
                                          dana!.saldo - nominal,
                                        );
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) {
                                              if (widget.role == "peminjam") {
                                                return Navbar2(
                                                  id_peminjam: widget.id,
                                                  id_umkm: widget.id_umkm,
                                                  id_dana: widget.id_dana,
                                                );
                                              } else {
                                                return Navbar(
                                                  id_investor: widget.id,
                                                  id_dana: widget.id_dana,
                                                );
                                              }
                                            },
                                          ),
                                        );
                                      }
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      margin:
                                          EdgeInsets.symmetric(vertical: 10),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 15),
                                      decoration: BoxDecoration(
                                        color: Color(0xff1c355e),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(40)),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Tarik Dana',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            height: 1.265,
                                            color: Color(0xffffffff),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ])))
                  ]))));
            }
          }),
    );
  }
}
