import 'package:android/fundingNotification.dart';
import 'package:android/paymentNotification.dart';
import 'package:android/topupNotification.dart';
import 'package:android/withdrawalNotification.dart';
import 'package:flutter/material.dart';
import 'loginPage.dart';
import 'myUmkmPage.dart';
import 'activityUmkm.dart';

import 'bayarpinjaman.dart';
import 'navbar.dart';
import 'notificationSubmission.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
      String url = "http://127.0.0.1:8000/umkm/$id";
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

class aktivitasUmkm {
  String date;
  String jenis;
  String time;
  String logo;
  aktivitasUmkm({
    required this.date,
    required this.jenis,
    required this.time,
    required this.logo,
  });
}

IconData getIconData(String iconName) {
  switch (iconName) {
    case 'document_scanner_rounded':
      return Icons.document_scanner_rounded;
    case 'handshake_rounded':
      return Icons.handshake_rounded;
    case 'credit_card_outlined':
      return Icons.credit_card_outlined;
    case 'paypal_rounded':
      return Icons.paypal_rounded;
    case 'payments_rounded':
      return Icons.payments_rounded;
    default:
      return Icons.error_outline;
  }
}

getPage(String jenis) {
  switch (jenis) {
    case 'Pengajuan Pinjaman':
      return NotificationSubmissionDialogue();
    case 'Pemberian Dana':
      return FundingNotificationDialogue();
    case 'Tarik Dana':
      return WithdrawalNotificationDialogue();
    case 'Isi Saldo Dana':
      return TopupNotificationDialogue();
    case 'Bayar Pinjaman':
      return PaymentNotificationDialogue();
  }
}

List<aktivitasUmkm> data = [
  aktivitasUmkm(
    date: "14 Desember 2023",
    jenis: "Pengajuan Pinjaman",
    time: "12:12 WIB",
    logo: "document_scanner_rounded",
  ),
  aktivitasUmkm(
    date: "14 Desember 2023",
    jenis: "Pemberian Dana",
    time: "12:12 WIB",
    logo: "handshake_rounded",
  ),
  aktivitasUmkm(
    date: "14 Desember 2023",
    jenis: "Tarik Dana",
    time: "12:12 WIB",
    logo: "credit_card_outlined",
  ),
  aktivitasUmkm(
    date: "14 Desember 2023",
    jenis: "Isi Saldo Dana",
    time: "12:12 WIB",
    logo: "paypal_rounded",
  ),
  aktivitasUmkm(
    date: "14 Desember 2023",
    jenis: "Bayar Pinjaman",
    time: "12:12 WIB",
    logo: "payments_rounded",
  ),
];

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
                                    vertical: 5.0, horizontal: 25),
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
                                    SizedBox(height: 10.0),
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
                                            nama: umkm.nama,
                                            alamat: umkm.alamat,
                                            tahun: umkm.tahun,
                                            deskripsi: umkm.deskripsi,
                                            img: umkm.nama,
                                            jenis: umkm.jenis,
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
                              height: 322.4,
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
                                                return ActivityUmkm();
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
                                  Expanded(
                                    child: ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      shrinkWrap: true,
                                      itemCount: data.length,
                                      itemBuilder: (context, int index) {
                                        String namaIcon = data[index].logo;
                                        return Column(
                                          children: [
                                            GestureDetector(
                                              onTap: () => showDialog<String>(
                                                context: context,
                                                builder:
                                                    (BuildContext context) =>
                                                        Dialog(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: <Widget>[
                                                        const SizedBox(
                                                            height: 15),
                                                        getPage(
                                                            data[index].jenis),
                                                        const SizedBox(
                                                            height: 15),
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
                                                        color:
                                                            Color(0xFF669AD9),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(100),
                                                      ),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Icon(
                                                            getIconData(
                                                                data[index]
                                                                    .logo),
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
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                '${data[index].jenis}',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                              Text(
                                                                '${data[index].date}',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    color: Color(
                                                                        0xFF979797)),
                                                              )
                                                            ],
                                                          ),
                                                          Text(
                                                            '${data[index].time}',
                                                            style: TextStyle(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
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
                                          ],
                                        );
                                      },
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
