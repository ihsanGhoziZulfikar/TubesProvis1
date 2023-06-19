import 'package:android/ModelClass/investorUmkmModel.dart';
import 'package:android/ModelClass/peminjamanModel.dart';
import 'package:android/homeUmkm.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'ModelClass/danaModel.dart';
import 'ModelClass/investorModel.dart';
import 'ModelClass/umkmModel.dart';
import 'navbar2.dart';
import 'notificationSubmission.dart';
import 'fundingNotification.dart';
import 'withdrawalNotification.dart';
import 'topupNotification.dart';
import 'paymentNotification.dart';

import 'navbar.dart';

void bayar(int id_peminjaman, int id_umkm, int id_dana, int saldo,
    int total_pinjaman, int sisa_hutang, int nominal) async {
  if (saldo >= nominal) {
    if (nominal <= sisa_hutang) {
      updateDana(id_dana, saldo - nominal);
      updateDanaTerkumpulPeminjaman(id_peminjaman, sisa_hutang - nominal);

      final listInvestorUmkmPeminjaman = ListInvestorUmkmPeminjamanCubit();
      try {
        final investorUmkmList =
            await listInvestorUmkmPeminjaman.fetchData(id_peminjaman);
        for (var investorUmkmPeminjaman in investorUmkmList) {
          double danaTambahan =
              (nominal as double) * investorUmkmPeminjaman.persen;
          await updateDana(investorUmkmPeminjaman.id_dana,
              (investorUmkmPeminjaman.saldo + danaTambahan) as int);
          await updateDanaBayar(investorUmkmPeminjaman.id_investor,
              investorUmkmPeminjaman.dana_bayar + nominal);
        }
        if (sisa_hutang - nominal == 0) {
          updateStatusPeminjaman(id_peminjaman, "Selesai");
          updateStatusUmkm(id_umkm, "Belum");
        }
      } catch (error) {
        print('Error: $error');
      }
    }
  }
}

// void bayar(int id_peminjaman, int id_umkm, int id_dana, int saldo,
//     int total_pinjaman, int sisa_hutang, int nominal) {
//   if (saldo >= nominal) {
//     if (nominal <= sisa_hutang) {
//       updateDana(id_dana, saldo - nominal);
//       updateDanaTerkumpulPeminjaman(id_peminjaman, sisa_hutang - nominal);
//       final listInvestorUmkmPeminjaman = ListInvestorUmkmPeminjamanCubit();
//       FutureBuilder<List<InvestorUmkmModel>>(
//         future: listInvestorUmkmPeminjaman.fetchData(id_peminjaman),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return CircularProgressIndicator();
//           } else if (snapshot.hasError) {
//             return Text('Error: ${snapshot.error}');
//           } else {
//             final listInvestorUmkm = snapshot.data;
//             for (var investorUmkmPeminjaman in listInvestorUmkm!) {
//               updateDana(investorUmkmPeminjaman.id_dana,
//                   investorUmkmPeminjaman.saldo + nominal);
//             }
//             return SizedBox();
//           }
//         },
//       );
//     }
//   }
// }
// if (dana_terkumpul + nominal == total_pinjaman) {
//   updateStatusPeminjaman(id_peminjaman, "Sudah");
//   updateStatusUmkm(id_umkm, "Sudah");
// }
// void bayar(int id_peminjaman, int id_umkm, int id_dana, int saldo,
//     int total_pinjaman, int sisa_hutang, int nominal) {
//   if (saldo >= nominal) {
//     if (nominal <= sisa_hutang) {
//       updateDana(id_dana, saldo - nominal);
//       updateDanaTerkumpulPeminjaman(id_peminjaman, sisa_hutang - nominal);
//       updateInvestorDana(nominal);
//     }
//   }
// }

// void updateInvestorDana(int nominal) {
//   final listInvestorUmkm = ListInvestorUmkmCubit();
//   listInvestorUmkm.fetchData().then((snapshot) {
//     if (snapshot.connectionState == ConnectionState.waiting) {
//       return CircularProgressIndicator();
//     } else if (snapshot.hasError) {
//       return Text('Error: ${snapshot.error}');
//     } else {
//       final listInvestorUmkm = snapshot.data;
//       for (var investorUmkm in listInvestorUmkm!) {
//         updateDana(investorUmkm.id_dana, investorUmkm.saldo + nominal);
//       }
//     }
//   });
// }

class BayarPinjamanUmkm extends StatefulWidget {
  int id_peminjam;
  int id_umkm;
  int id_dana;

  BayarPinjamanUmkm(
      {required this.id_umkm,
      required this.id_dana,
      required this.id_peminjam});

  @override
  State<BayarPinjamanUmkm> createState() => _BayarPinjamanUmkmState();
}

class _BayarPinjamanUmkmState extends State<BayarPinjamanUmkm> {
  final peminjamanSudahCubit = PeminjamanSudahCubit();
  final danaCubit = DanaCubit();

  var nominalController = TextEditingController();
  int _nominal = 0;

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
              future: peminjamanSudahCubit.fetchData(widget.id_umkm),
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
                                          return Navbar2(
                                              id_peminjam: widget.id_peminjam,
                                              id_umkm: widget.id_umkm,
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
                                  "Bayar Pinjaman",
                                  style: TextStyle(fontSize: 24),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Informasi Pinjaman",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              // height: 75,
                              width: 360,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xFFD2E2F0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Jatuh tempo      :",
                                          style: TextStyle(fontSize: 14),
                                        ),
                                        Text(
                                          "14 Desember",
                                          style: TextStyle(fontSize: 14),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Divider(
                                      color: Colors.black,
                                      thickness: 0.2,
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Total Pinjaman  :",
                                          style: TextStyle(fontSize: 14),
                                        ),
                                        Text(
                                          "Rp. 1.000.000",
                                          style: TextStyle(fontSize: 14),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
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
                              // height: 165,
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
                                              "assets/images/BNI.png",
                                              height: 20,
                                              width: 50,
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Column(
                                              children: [
                                                Text(
                                                  "Bank BNI",
                                                  style:
                                                      TextStyle(fontSize: 14),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  "****1890",
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
                                              "Ihsan Subagjo",
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
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Jumlah pembayaran :",
                                          style: TextStyle(fontSize: 14),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 325,
                                    margin: EdgeInsets.symmetric(vertical: 10),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
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
                              height: 320,
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _nominal =
                                      int.tryParse(nominalController.text) ??
                                          0; //akses text via controller
                                }); //refresh
                                if (_nominal <= dana!.saldo &&
                                    _nominal <= peminjaman!.dana_terkumpul) {
                                  print("bbbbbbb");
                                  bayar(
                                    peminjaman.id,
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
                                        return Navbar2(
                                          id_peminjam: widget.id_peminjam,
                                          id_umkm: widget.id_umkm,
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
              },
            );
          }
        },
      ),
    );
  }
}
