import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'ModelClass/investorUmkmModel.dart';

// class ActivityInvestorModel {
//   int id_investor;
//   int id_dana;

//   ActivityInvestorModel({
//     required this.id_investor,
//     required this.id_dana,
//   });

//   factory ActivityInvestorModel.fromJson(Map<String, dynamic> json) {
//     return ActivityInvestorModel(
//       id_investor: json['id'] ?? 0,
//       id_dana: json['id_dana'] ?? 0,
//     );
//   }
// }

// class ActivityInvestorCubit extends Cubit<ActivityInvestorModel> {
//   ActivityInvestorCubit()
//       : super(ActivityInvestorModel(
//           id_investor: 0,
//           id_dana: 0,
//         ));

//   Future<ActivityInvestorModel> fetchData(id) async {
//     try {
//       String url = "http://127.0.0.1:8000/transaksi_investor/$id";
//       final response = await http.get(Uri.parse(url));
//       print("bb");
//       if (response.statusCode == 200) {
//         print(response);
//         final jsonData = jsonDecode(response.body);
//         final data = jsonData['data'] as Map<String, dynamic>;
//         final activityInvestorModel = ActivityInvestorModel.fromJson(data);
//         emit(activityInvestorModel);
//         return activityInvestorModel;
//       } else {
//         throw Exception('Failed to load data');
//       }
//     } catch (e) {
//       print(e);
//       throw Exception('Failed to load data: $e');
//     }
//   }
// }

class umkm {
  String foto;
  String nama;
  String status;
  String warna;
  String waktu;
  double sisa;
  double total;
  umkm({
    required this.foto,
    required this.nama,
    required this.sisa,
    required this.total,
    required this.waktu,
    this.status = "Lunas",
    this.warna = "green",
  });
}

List<umkm> pendanaan = [
  umkm(
    foto: "assets/images/daging-sapi.jpg",
    nama: "Daging Sapi Ibu Ira",
    sisa: 4000000,
    total: 10000000,
    waktu: "14 Des 2023 - 21 Jun 2024",
  ),
  umkm(
    foto: "assets/images/daging-sapi.jpg",
    nama: "Daging Sapi Ibu Ira",
    sisa: 4000000,
    total: 10000000,
    waktu: "14 Des 2023 - 21 Jun 2024",
  ),
  umkm(
    foto: "assets/images/daging-sapi.jpg",
    nama: "Daging Sapi Ibu Ira",
    sisa: 4000000,
    total: 10000000,
    waktu: "14 Des 2023 - 21 Jun 2024",
  ),
  umkm(
    foto: "assets/images/daging-sapi.jpg",
    nama: "Daging Sapi Ibu Ira",
    sisa: 4000000,
    total: 10000000,
    waktu: "14 Des 2023 - 21 Jun 2024",
  ),
  umkm(
    foto: "assets/images/daging-sapi.jpg",
    nama: "Daging Sapi Ibu Ira",
    sisa: 4000000,
    total: 10000000,
    waktu: "14 Des 2023 - 21 Jun 2024",
  ),
  umkm(
    foto: "assets/images/daging-sapi.jpg",
    nama: "Daging Sapi Ibu Ira",
    sisa: 4000000,
    total: 10000000,
    waktu: "14 Des 2023 - 21 Jun 2024",
  ),
];

List<umkm> riwayat = [
  umkm(
    foto: "assets/images/daging-sapi.jpg",
    nama: "Daging Sapi Ibu Ira",
    sisa: 4000000,
    total: 10000000,
    status: "Lunas",
    waktu: "14 Des 2023 - 21 Jun 2024",
  ),
  umkm(
    foto: "assets/images/daging-sapi.jpg",
    nama: "Daging Sapi Ibu Ira",
    sisa: 4000000,
    total: 10000000,
    status: "Tidak Lunas",
    waktu: "14 Des 2023 - 21 Jun 2024",
    warna: "red",
  ),
];

class ActivityInvestor extends StatelessWidget {
  final listInvestorUmkmCubit = ListInvestorUmkmCubit();
  final listInvestorUmkmSedangCubit = ListInvestorUmkmCubit();
  // final listInvestorUmkmSudahCubit = ListInvestorUmkmCubit();
  // final listInvestorUmkmCubit = ListInvestorUmkmCubit();
  // final listInvestorUmkmSedangCubit = ListInvestorUmkmSedangCubit();
  final listInvestorUmkmSudahCubit = ListInvestorUmkmSudahCubit();
  int id_investor;
  int id_dana;

  ActivityInvestor({
    super.key,
    required this.id_investor,
    required this.id_dana,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<InvestorUmkmModel>>(
        future: listInvestorUmkmCubit.fetchData(id_investor),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Aktivitas masih kosong.');
          } else {
            final listInvestorUmkm = snapshot.data;
            return SafeArea(
              child: DefaultTabController(
                length: 3,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(14, 0, 0, 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Aktivitas',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                              height: 2,
                              color: Color(0xff000000),
                            ),
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 8.0, right: 20.0),
                            child: Text(
                              "Di sini kamu dapat melihat berbagai informasi terkait aktivitas investasi yang telah kamu berikan. Terdapat beberapa menu yang dapat dijelajahi untuk memantau perkembangan investasimu.",
                              style: GoogleFonts.beVietnamPro(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    TabBar(
                      indicatorSize: TabBarIndicatorSize.label,
                      labelColor: Colors.black,
                      labelStyle: TextStyle(fontSize: 16),
                      indicatorColor: Color(0xFF669AD9),
                      tabs: [
                        Tab(
                          text: '   Sedang    ',
                        ),
                        Tab(
                          text: '  Pendanaan  ',
                        ),
                        Tab(
                          text: '   Riwayat   ',
                        ),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 15.0),
                              child: ListView.builder(
                                itemCount: listInvestorUmkm?.length,
                                itemBuilder: (context, index) {
                                  String foto = pendanaan[index].foto;
                                  String waktu = pendanaan[index].waktu;

                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10.0, right: 10.0, top: 10.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ListTile(
                                          leading: Image.asset(
                                            foto,
                                            fit: BoxFit.cover,
                                          ),
                                          title: Text(
                                            "ppp",
                                            // listInvestorUmkm![index]
                                            //     .nama_umkm,
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          subtitle: Column(
                                            children: [
                                              SizedBox(height: 5),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "Sisa Pembayaran:",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.black),
                                                  ),
                                                  Text(
                                                    NumberFormat.currency(
                                                      symbol: 'Rp',
                                                      decimalDigits: 0,
                                                    ).format(listInvestorUmkm![
                                                                index]
                                                            .total_peminjaman -
                                                        listInvestorUmkm![index]
                                                            .dana_bayar),
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.black),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 3),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "Total Pinjaman:",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.black),
                                                  ),
                                                  Text(
                                                    NumberFormat.currency(
                                                      symbol: 'Rp',
                                                      decimalDigits: 0,
                                                    ).format(
                                                        listInvestorUmkm![index]
                                                            .total_peminjaman),
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.black),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 10),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    waktu,
                                                    style:
                                                        TextStyle(fontSize: 10),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          onTap: () {
                                            // Aksi yang dijalankan saat ListTile di-tap
                                          },
                                        ),
                                        Divider(height: 20, thickness: 1),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          FutureBuilder<List<InvestorUmkmModel>>(
                            future: listInvestorUmkmSedangCubit
                                .fetchData(id_investor),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return CircularProgressIndicator();
                              } else if (snapshot.hasError) {
                                return Text('Masih kosong.');
                              } else {
                                final listInvestorUmkm = snapshot.data;
                                return Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30),
                                      topRight: Radius.circular(30),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 15.0),
                                    child: ListView.builder(
                                      itemCount: pendanaan.length,
                                      itemBuilder: (context, index) {
                                        String foto = pendanaan[index].foto;
                                        String waktu = pendanaan[index].waktu;

                                        return Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10.0,
                                              right: 10.0,
                                              top: 10.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              ListTile(
                                                leading: Image.asset(
                                                  foto,
                                                  fit: BoxFit.cover,
                                                ),
                                                title: Text(
                                                  listInvestorUmkm![index]
                                                      .nama_umkm,
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                subtitle: Column(
                                                  children: [
                                                    SizedBox(height: 5),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          "Sisa Pembayaran:",
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                        Text(
                                                          NumberFormat.currency(
                                                            symbol: 'Rp',
                                                            decimalDigits: 0,
                                                          ).format(listInvestorUmkm![
                                                                      index]
                                                                  .total_peminjaman -
                                                              listInvestorUmkm![
                                                                      index]
                                                                  .dana_bayar),
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(height: 3),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          "Total Pinjaman:",
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                        Text(
                                                          NumberFormat.currency(
                                                            symbol: 'Rp',
                                                            decimalDigits: 0,
                                                          ).format(
                                                              listInvestorUmkm![
                                                                      index]
                                                                  .total_peminjaman),
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(height: 10),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        Text(
                                                          waktu,
                                                          style: TextStyle(
                                                              fontSize: 10),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                onTap: () {
                                                  // Aksi yang dijalankan saat ListTile di-tap
                                                },
                                              ),
                                              Divider(height: 20, thickness: 1),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                );
                              }
                            },
                          ),
                          FutureBuilder<List<InvestorUmkmModel>>(
                            future: listInvestorUmkmSudahCubit
                                .fetchData(id_investor),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return CircularProgressIndicator();
                              } else if (snapshot.hasError) {
                                return Text('Tidak ada riwayat.');
                              } else {
                                final listInvestorUmkm = snapshot.data;
                                return Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30),
                                      topRight: Radius.circular(30),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 15.0),
                                    child: ListView.builder(
                                      itemCount: riwayat.length,
                                      itemBuilder: (context, index) {
                                        String foto = riwayat[index].foto;
                                        String waktu = riwayat[index].waktu;

                                        return Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10.0,
                                              right: 10.0,
                                              top: 10.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              ListTile(
                                                leading: Image.asset(
                                                  foto,
                                                  fit: BoxFit.cover,
                                                ),
                                                title: Text(
                                                  listInvestorUmkm![index]
                                                      .nama_umkm,
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                subtitle: Column(
                                                  children: [
                                                    SizedBox(height: 5),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          "Total Pinjaman:",
                                                          style: TextStyle(
                                                              fontSize: 12),
                                                        ),
                                                        Text(
                                                          NumberFormat.currency(
                                                            symbol: 'Rp',
                                                            decimalDigits: 0,
                                                          ).format(
                                                              listInvestorUmkm![
                                                                      index]
                                                                  .total_peminjaman),
                                                          style: TextStyle(
                                                              fontSize: 12),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(height: 3),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          "Status akhir:",
                                                          style: TextStyle(
                                                              fontSize: 12),
                                                        ),
                                                        Text(
                                                          listInvestorUmkm![
                                                                  index]
                                                              .status,
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                            color: '${riwayat[index].warna}' ==
                                                                    'green'
                                                                ? Color
                                                                    .fromARGB(
                                                                        255,
                                                                        6,
                                                                        232,
                                                                        14)
                                                                : Color
                                                                    .fromARGB(
                                                                        255,
                                                                        255,
                                                                        17,
                                                                        0),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(height: 10),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        Text(
                                                          waktu,
                                                          style: TextStyle(
                                                              fontSize: 10),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                onTap: () {
                                                  // Aksi yang dijalankan saat ListTile di-tap
                                                },
                                              ),
                                              Divider(height: 20, thickness: 1),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
