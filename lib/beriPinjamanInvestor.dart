import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'ModelClass/danaModel.dart';
import 'ModelClass/investorModel.dart';
import 'ModelClass/investorUmkmModel.dart';
import 'ModelClass/peminjamanModel.dart';

import 'ModelClass/umkmModel.dart';
import 'navbar.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

// Future<void> updateDana(int id, int saldo) async {
//   final url = 'http://127.0.0.1:8000/update_dana/$id';

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

Future<void> beriPinjam(
    int id_peminjaman,
    int id_investor,
    int id_umkm,
    int id_dana,
    int saldo,
    int total_pinjaman,
    int dana_terkumpul,
    int nominal) async {
  if (saldo >= nominal) {
    if (nominal <= (total_pinjaman - dana_terkumpul)) {
      updateDana(id_dana, saldo - nominal);
      updateDanaTerkumpulPeminjaman(id_peminjaman, dana_terkumpul + nominal);
      if (dana_terkumpul + nominal == total_pinjaman) {
        updateStatusPeminjaman(id_peminjaman, "Sudah");
        updateStatusUmkm(id_umkm, "Tunggu");
      }
      double persen = (nominal as double) / (total_pinjaman as double);
      tambahInvestorUmkm(id_investor, id_umkm, id_peminjaman, nominal, persen);
    }
  }

  // final url = 'http://127.0.0.1:8000/update_umkm_patch/$id';

  // final umkmData = {
  //   'id': 0,
  //   'nama': nama,
  //   'alamat': alamat,
  //   'tahun': tahun,
  //   'deskripsi': deskripsi,
  //   'jenis': jenis
  // };

  // final response = await http.patch(
  //   Uri.parse(url),
  //   headers: {'Content-Type': 'application/json'},
  //   body: jsonEncode(umkmData),
  // );

  // if (response.statusCode == 201) {
  //   // Success
  //   final responseData = jsonDecode(response.body);
  //   print('New UMKM created with ID: ${responseData['id']}');
  // } else {
  //   // Error
  //   print('Failed to create UMKM. Status code: ${response.statusCode}');
  //   print('Error message: ${response.body}');
  // }
}

class BeriPinjamanInvestor extends StatefulWidget {
  int id_investor;
  int id_dana;
  int id_umkm;
  int id_peminjaman;

  BeriPinjamanInvestor({
    super.key,
    required this.id_investor,
    required this.id_dana,
    required this.id_umkm,
    required this.id_peminjaman,
  });

  @override
  State<BeriPinjamanInvestor> createState() => _BeriPinjamanInvestorState();
}

class _BeriPinjamanInvestorState extends State<BeriPinjamanInvestor> {
  final umkmCubit = UmkmCubit();

  final danaCubit = DanaCubit();

  final investorCubit = InvestorCubit();

  final peminjamanCubit = PeminjamanCubit();

  var nominalController = TextEditingController();
  int _nominal = 0;

  final double width = 60;

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
            return FutureBuilder<PeminjamanModel>(
                future: peminjamanCubit.fetchData(widget.id_peminjaman),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    final peminjaman = snapshot.data;
                    return SafeArea(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8.0,
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return Navbar(
                                                id_investor: widget.id_investor,
                                                id_dana: widget.id_dana);
                                          },
                                        ),
                                      );
                                    },
                                    child: Icon(
                                      Icons.arrow_back_rounded,
                                      size: 35,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Beri Pinjaman",
                                    style: TextStyle(fontSize: 24),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Opsi Pembayaran Tersimpan",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 320,
                                width: 360,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(0xFFD2E2F0),
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 7.0, horizontal: 15),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Image.asset(
                                                "assets/images/BCA.png",
                                                height: 20,
                                                width: 50,
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Column(
                                                children: [
                                                  Text(
                                                    "Bank BCA",
                                                    style:
                                                        TextStyle(fontSize: 14),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    "****9020",
                                                    style:
                                                        TextStyle(fontSize: 13),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            width: 80,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.check_circle_rounded,
                                                    color: Colors.green,
                                                    size: 18,
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    "Pilih",
                                                    style:
                                                        TextStyle(fontSize: 14),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                "Bob Sadino",
                                                style: TextStyle(fontSize: 13),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      child: Column(
                                        // mainAxisAlignment:
                                        //     MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                padding: EdgeInsets.all(8),
                                                width: 150,
                                                height: 55,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Colors.white,
                                                ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text('Dana terkumpul:'),
                                                    Text(
                                                        'Rp${NumberFormat.currency(locale: 'id_ID', symbol: '').format(peminjaman!.dana_terkumpul)}'),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.all(8),
                                                width: 150,
                                                height: 55,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Colors.white,
                                                ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text('Kebutuhan :'),
                                                    Text(
                                                        'Rp${NumberFormat.currency(locale: 'id_ID', symbol: '').format(peminjaman.total_pinjaman)}'),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                padding: EdgeInsets.all(8),
                                                width: 150,
                                                height: 55,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Colors.white,
                                                ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text('Saldo saat ini :'),
                                                    Text(
                                                        'Rp${NumberFormat.currency(locale: 'id_ID', symbol: '').format(dana!.saldo)}'),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 25,
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Jumlah pembayaran :",
                                                style: TextStyle(fontSize: 14),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 325,
                                      margin:
                                          EdgeInsets.symmetric(vertical: 10),
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                      child: TextField(
                                        controller: nominalController,
                                        keyboardType: TextInputType.number,
                                        inputFormatters: <TextInputFormatter>[
                                          FilteringTextInputFormatter.digitsOnly
                                        ],
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          border: InputBorder.none,
                                          hintText: 'Enter your balance',
                                        ),
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 370,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _nominal =
                                        int.tryParse(nominalController.text) ??
                                            0; //akses text via controller
                                  }); //refresh
                                  if (_nominal <= dana.saldo &&
                                      _nominal <=
                                          (peminjaman.total_pinjaman -
                                              peminjaman.dana_terkumpul)) {
                                    print("bbbbbbb");
                                    beriPinjam(
                                      peminjaman.id,
                                      widget.id_investor,
                                      widget.id_umkm,
                                      widget.id_dana,
                                      dana.saldo,
                                      peminjaman.total_pinjaman,
                                      peminjaman.dana_terkumpul,
                                      _nominal,
                                    );
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return Navbar(
                                            id_investor: widget.id_investor,
                                            id_dana: widget.id_dana,
                                          );
                                        },
                                      ),
                                    );
                                  }
                                  ;
                                },
                                child: Container(
                                  width: 360,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0xFF1C355E),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Bayar",
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                });
          }
        },
      ),
    );
  }
}
