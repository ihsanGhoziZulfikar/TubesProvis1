import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
// import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'ModelClass/peminjamanModel.dart';
import 'ModelClass/umkmModel.dart';
import 'navbar2.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// Future<void> tambahPinjaman(int id_peminjam, int nominal, int waktu, int bunga,
//     double cicilan, String nama, String deskripsi) async {
//   final url = 'http://127.0.0.1:8000/tambah_peminjaman/';

//   final data = {
//     'id': 0,
//     'id_peminjam': id_peminjam,
//     'durasi': waktu,
//     'bunga': bunga,
//     'cicilan': cicilan,
//     'deskripsi': nama,
//     'status': "belum",
//     'total_pinjaman': nominal,
//     'dana_terkumpul': 0,
//     'tenggat': DateFormat('yyyy-MM-dd').format(DateTime.now()),
//   };

//   final response = await http.post(
//     Uri.parse(url),
//     headers: {'Content-Type': 'application/json'},
//     body: jsonEncode(data),
//   ); //

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

class PengajuanPinjaman extends StatefulWidget {
  final int id_peminjam;
  final int id_umkm;
  final int id_dana;

  const PengajuanPinjaman({
    Key? key,
    required this.id_peminjam,
    required this.id_umkm,
    required this.id_dana,
  }) : super(key: key);

  @override
  State<PengajuanPinjaman> createState() => _PengajuanPinjamanState();
}

class _PengajuanPinjamanState extends State<PengajuanPinjaman> {
  var nominalController = TextEditingController();
  var waktuController = TextEditingController();
  var bungaController = TextEditingController();
  var namaPinjamanController = TextEditingController();
  var deskPinjamanController = TextEditingController();
  int _nominal = 0;
  int _waktu = 1;
  int _bunga = 0;
  String _namaPinjaman = "";
  String _deskPinjaman = "";
  double _cicilan = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "Pengajuan Pinjaman",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                      height: 1.3625,
                      color: Color(0xff000000),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 15),
                            child: Text(
                              "Nominal Pinjaman",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                height: 1.265,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: Color(0xffd6e4f0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40)),
                            ),
                            child: TextField(
                              controller: nominalController,
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              onChanged: (value) {
                                // Update the state or perform any desired actions with the entered value
                                setState(() {
                                  _nominal =
                                      int.tryParse(nominalController.text) ?? 0;
                                  _cicilan = (_nominal / _waktu) + _bunga;
                                });
                              },
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 10),
                                border: InputBorder.none,
                                hintText: 'Enter your text',
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 15),
                            child: Text(
                              "Jangka Waktu",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                height: 1.265,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: Color(0xffd6e4f0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40)),
                            ),
                            child: TextField(
                              controller: waktuController,
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              onChanged: (value) {
                                // Update the state or perform any desired actions with the entered value
                                setState(() {
                                  _waktu =
                                      int.tryParse(waktuController.text) ?? 1;
                                  _cicilan = (_nominal / _waktu) + _bunga;
                                });
                              },
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 10),
                                border: InputBorder.none,
                                hintText: 'Enter your text',
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 15),
                            child: Text(
                              "Bunga Pinjaman",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                height: 1.265,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: Color(0xffd6e4f0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40)),
                            ),
                            child: TextField(
                              controller: bungaController,
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              onChanged: (value) {
                                // Update the state or perform any desired actions with the entered value
                                setState(() {
                                  _bunga =
                                      int.tryParse(bungaController.text) ?? 0;
                                  _cicilan = (_nominal / _waktu) + _bunga;
                                });
                              },
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 10),
                                border: InputBorder.none,
                                hintText: 'Enter your text',
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 15),
                            child: Text(
                              "Cicilan",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                height: 1.265,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: Color(0xffd6e4f0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40)),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  _cicilan.toString(),
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    height: 1.265,
                                    color: Color(0xff000000),
                                  ),
                                ),
                                Text(
                                  "/bulan",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    height: 1.265,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ],
                            ),
                            // TextField(
                            //   decoration: InputDecoration(
                            //     contentPadding:
                            //         EdgeInsets.symmetric(horizontal: 10),
                            //     border: InputBorder.none,
                            //     hintText: 'Enter your text',
                            //   ),
                            // ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 15),
                            child: Text(
                              "Nama Pinjaman",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                height: 1.265,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: Color(0xffd6e4f0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40)),
                            ),
                            child: TextField(
                              controller: namaPinjamanController,
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 10),
                                border: InputBorder.none,
                                hintText: 'Enter your text',
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 15),
                            child: Text(
                              "Deskripsi Pinjaman",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                height: 1.265,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                          Container(
                            height: 150,
                            margin: EdgeInsets.symmetric(vertical: 10),
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: Color(0xffd6e4f0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                            child: TextField(
                              controller: deskPinjamanController,
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 10),
                                border: InputBorder.none,
                                hintText: 'Enter your text',
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _nominal =
                                    int.tryParse(nominalController.text) ??
                                        0; //akses text via controller
                                _waktu =
                                    int.tryParse(waktuController.text) ?? 1;
                                _bunga =
                                    int.tryParse(bungaController.text) ?? 0;
                                _namaPinjaman = namaPinjamanController.text;
                                _deskPinjaman = deskPinjamanController.text;

                                _cicilan = (_nominal / _waktu) + _bunga;
                              }); //refresh
                              tambahPinjaman(
                                widget.id_peminjam,
                                _nominal,
                                _waktu,
                                _bunga,
                                _cicilan,
                                _namaPinjaman,
                                _deskPinjaman,
                              );
                              updateStatusUmkm(widget.id_umkm, "Sedang");
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return Navbar2(
                                      id_peminjam: widget.id_peminjam,
                                      id_umkm: widget.id_umkm,
                                      id_dana: widget.id_dana,
                                    );
                                  },
                                ),
                              );
                            },
                            child: Container(
                              width: double.infinity,
                              margin: EdgeInsets.symmetric(vertical: 40),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 15),
                              decoration: BoxDecoration(
                                color: Color(0xff1c355e),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40)),
                              ),
                              child: Center(
                                child: Text(
                                  'Ajukan',
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
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
