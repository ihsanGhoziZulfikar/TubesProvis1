import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_page/Tarik-dana-investor.dart';
import 'package:login_page/bayarpinjaman.dart';
import 'package:login_page/tarikpinjaman.dart';

class riwayatTransaksi {
  String date;
  String nama;
  int jumlah;
  riwayatTransaksi(
      {required this.date, required this.nama, required this.jumlah});
}

List<riwayatTransaksi> data = [
  riwayatTransaksi(date: "20/05/2023", nama: "Mia", jumlah: 100000),
  riwayatTransaksi(date: "20/05/2023", nama: "Mia", jumlah: 100000),
  riwayatTransaksi(date: "20/05/2023", nama: "Mia", jumlah: 100000),
  riwayatTransaksi(date: "20/05/2023", nama: "Mia", jumlah: 100000),
  riwayatTransaksi(date: "20/05/2023", nama: "Mia", jumlah: 100000),
];

class dana2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 30, left: 10),
          alignment: Alignment.topLeft,
          child: Text(
            'Dana',
            style: GoogleFonts.beVietnamPro(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
        ),
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 40),
                child: Text(
                  'Dana Tersedia',
                  style: GoogleFonts.beVietnamPro(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(bottom: 20, left: 40),
                  child: Text(
                    "Rp 4.000.000,00",
                    style: GoogleFonts.inter(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.w600),
                  )),
              Container(
                  margin: EdgeInsets.only(bottom: 30, left: 40),
                  child: Text(
                    'Kontrol keuanganmu dalam genggaman.\nLihat saldo peminjamanmu dan histori\ntransaksi dengan mudah di sini!',
                    style: GoogleFonts.beVietnamPro(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                  )),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return Scaffold(
                        body: bayarpinjaman(),
                      );
                    },
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.all(15),
                // margin: EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Color.fromARGB(255, 2, 46, 122),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: 100,
                      margin: EdgeInsets.only(bottom: 30),
                      child: Text(
                        'Bayar\nPinjaman',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomRight,
                      child: Icon(Icons.credit_card_sharp, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return Scaffold(
                        body: TarikPinjaman(),
                      );
                    },
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.all(15),
                // margin: EdgeInsets.only(left: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Color.fromARGB(255, 2, 46, 122),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: 100,
                      margin: EdgeInsets.only(bottom: 30),
                      child: Text(
                        'Tarik\nPinjaman',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomRight,
                      child: Icon(Icons.local_print_shop_sharp,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: Container(
                  margin: EdgeInsets.only(left: 40, right: 40),
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 208, 223, 250),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12))),
                  padding: EdgeInsets.all(14),
                  child: Row(children: [
                    Text(
                      'Riwayat Transaksi',
                      style: GoogleFonts.beVietnamPro(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Container(
                      child: Icon(Icons.keyboard_arrow_right),
                    ),
                  ])),
            ),
          ],
        ),
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: data.length,
            itemBuilder: (context, int index) {
              return Container(
                  margin: EdgeInsets.only(left: 40, right: 40),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 208, 223, 250),
                    // borderRadius: BorderRadius.circular(12)),
                  ),
                  padding: EdgeInsets.all(14),
                  // margin: EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${data[index].date}\nBayar ke investor ${data[index].nama}\nRp ${data[index].jumlah},00',
                        style: GoogleFonts.beVietnamPro(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 40),
                        alignment: Alignment.centerRight,
                        child: Icon(Icons.keyboard_arrow_right),
                      )
                    ],
                  ));
            },
          ),
        ),
      ],
    );
  }
}
