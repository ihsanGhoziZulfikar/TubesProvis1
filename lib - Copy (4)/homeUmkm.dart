import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_page/loginPage.dart';
import 'package:login_page/myUmkmPage.dart';
import 'activityUmkm.dart';

import 'bayarpinjaman.dart';
import 'navbar.dart';
import 'notificationSubmission.dart';
import 'package:http/http.dart' as http;

class UmkmModel {
  int id;
  String nama;
  String alamat;
  int tahun;
  String deskripsi;
  String jenis;

  UmkmModel({
    required this.id,
    required this.nama,
    required this.alamat,
    required this.tahun,
    required this.deskripsi,
    required this.jenis,
  });

  factory UmkmModel.fromJson(Map<String, dynamic> json) {
    return UmkmModel(
      id: json['id'] ?? '',
      nama: json['nama'] ?? '',
      alamat: json['alamat'] ?? '',
      tahun: json['tahun'] ?? 0,
      deskripsi: json['deskripsi'] ?? '',
      jenis: json['jenis'] ?? '',
    );
  }
}

class UmkmCubit extends Cubit<UmkmModel> {
  UmkmCubit()
      : super(UmkmModel(
          id: 0,
          nama: "",
          alamat: "",
          tahun: 0,
          deskripsi: "",
          jenis: "",
        ));

  Future<UmkmModel> fetchData(id) async {
    try {
      String url = "http://127.0.0.1:8000/umkm/0";
      final response = await http.get(Uri.parse(url));
      print("bb");
      if (response.statusCode == 200) {
        print(response);
        final jsonData = jsonDecode(response.body);
        final data = jsonData['data'] as Map<String, dynamic>;
        final umkmModel = UmkmModel.fromJson(data);
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

class HomeUmkm extends StatelessWidget {
  final umkmCubit = UmkmCubit();
  final double width;
  var id_umkm;

  HomeUmkm(this.id_umkm, this.width,
      {required String title, required String d});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<UmkmModel>(
        future: umkmCubit.fetchData(id_umkm),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            final umkm = snapshot.data;
            return SafeArea(
              child: Center(
                child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    double screenWidth = constraints.maxWidth;
                    double screenHeight = constraints.maxHeight;
                    return SingleChildScrollView(
                      child: Container(
                        width: screenWidth,
                        height: screenHeight,
                        decoration: BoxDecoration(
                          color: Color(0xFFD2E2F0),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 27.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: 'Selamat datang, ',
                                                    style: TextStyle(
                                                        fontSize: 16.0,
                                                        color:
                                                            Color(0xFF1C355E)),
                                                  ),
                                                  TextSpan(
                                                    text: "Dr. Feynman",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16.0,
                                                      color: Color(0xFF1C355E),
                                                    ),
                                                  ),
                                                  WidgetSpan(
                                                    child: Text(
                                                      '! 👋',
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xFF1C355E),
                                                          fontSize: 16.0),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "14 Desember 2023",
                                              style: TextStyle(
                                                  color: Color(0xFF979797),
                                                  fontSize: 16.0),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  CircleAvatar(
                                    radius: 25.0,
                                    backgroundImage: NetworkImage(
                                      'https://cdn-icons-png.flaticon.com/512/4086/4086679.png',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Container(
                              width: 352,
                              height: 115,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 18.0, horizontal: 25),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Progress Pembayaran",
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 12.0),
                                    Row(
                                      children: [
                                        Stack(
                                          children: <Widget>[
                                            Container(
                                              width: 250,
                                              height: 20.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFD9D9D9),
                                                borderRadius:
                                                    BorderRadius.circular(40.0),
                                              ),
                                            ),
                                            Material(
                                              child: AnimatedContainer(
                                                width: 250 * 0.5,
                                                height: 20.0,
                                                duration: Duration(seconds: 1),
                                                decoration: BoxDecoration(
                                                  color: Color(0xFF669AD9),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          40.0),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(width: 11.0),
                                        Text(
                                          "50%",
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 3.0),
                                    Text(
                                      "Jumlah Pinjaman : Rp30.000.000",
                                      style: TextStyle(
                                        fontSize: 12.0,
                                        color: Color(0xFF979797),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return bayarpinjaman();
                                        },
                                      ),
                                    );
                                  },
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 166,
                                        height: 115,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.payments_rounded,
                                              size: 60,
                                              color: Color(0xFF669AD9),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              "Bayar Pinjaman",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return MyUmkmPage(
                                            id: umkm!.id,
                                            nama: umkm!.nama,
                                            alamat: umkm!.alamat,
                                            tahun: umkm!.tahun,
                                            deskripsi: umkm!.deskripsi,
                                            img: umkm!.nama,
                                            jenis: umkm!.jenis,
                                          );
                                        },
                                      ),
                                    );
                                  },
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 166,
                                        height: 115,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons
                                                  .store_mall_directory_rounded,
                                              size: 60,
                                              color: Color(0xFF669AD9),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              "UMKM Saya",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              height: 325,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30),
                                ),
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Aktivitas Terbaru",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) {
                                                return SingleChildScrollView(
                                                  child: ActivityUmkm(),
                                                );
                                              },
                                            ),
                                          );
                                        },
                                        child: Text(
                                          "Lainnya",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Color(0xFFB1B1B1)),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  GestureDetector(
                                    onTap: () => showDialog<String>(
                                      context: context,
                                      builder: (BuildContext context) => Dialog(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              const SizedBox(height: 15),
                                              NotificationSubmissionDialogue(),
                                              const SizedBox(height: 15),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    child: Container(
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 50,
                                            width: 50,
                                            decoration: BoxDecoration(
                                              color: Color(0xFF669AD9),
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons
                                                      .document_scanner_rounded,
                                                  size: 30,
                                                  color: Colors.white,
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Container(
                                            width: 282,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Pengajuan Pinjaman",
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                      "14 Desember 2023",
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: Color(
                                                              0xFF979797)),
                                                    )
                                                  ],
                                                ),
                                                Text(
                                                  "12:12 WIB",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 50,
                                          width: 50,
                                          decoration: BoxDecoration(
                                            color: Color(0xFF669AD9),
                                            borderRadius:
                                                BorderRadius.circular(100),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.handshake_rounded,
                                                size: 30,
                                                color: Colors.white,
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Container(
                                          width: 282,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Pemberian Dana",
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    "14 Desember 2023",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color:
                                                            Color(0xFF979797)),
                                                  )
                                                ],
                                              ),
                                              Text(
                                                "12:12 WIB",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 50,
                                          width: 50,
                                          decoration: BoxDecoration(
                                            color: Color(0xFF669AD9),
                                            borderRadius:
                                                BorderRadius.circular(100),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.credit_card_outlined,
                                                size: 30,
                                                color: Colors.white,
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Container(
                                          width: 282,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Tarik Dana",
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    "14 Desember 2023",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color:
                                                            Color(0xFF979797)),
                                                  )
                                                ],
                                              ),
                                              Text(
                                                "12:12 WIB",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 50,
                                          width: 50,
                                          decoration: BoxDecoration(
                                            color: Color(0xFF669AD9),
                                            borderRadius:
                                                BorderRadius.circular(100),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.payments_rounded,
                                                size: 30,
                                                color: Colors.white,
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Container(
                                          width: 282,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Bayar Pinjaman",
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    "14 Desember 2023",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color:
                                                            Color(0xFF979797)),
                                                  )
                                                ],
                                              ),
                                              Text(
                                                "12:12 WIB",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
