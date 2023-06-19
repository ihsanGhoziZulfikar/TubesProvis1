import 'package:android/dana2.dart';
import 'package:android/dana3.dart';
import 'package:flutter/material.dart';
import 'navbar2.dart';
import 'notificationSubmission.dart';
import 'fundingNotification.dart';
import 'withdrawalNotification.dart';
import 'topupNotification.dart';
import 'paymentNotification.dart';
import 'package:google_fonts/google_fonts.dart';

import 'navbar.dart';

class riwayatTransaksi {
  String date;
  String jenis;
  int jumlah;
  String status;
  String warna;
  riwayatTransaksi(
      {required this.date,
      required this.jenis,
      required this.jumlah,
      required this.status,
      required this.warna});
}

getPage(String jenis) {
  switch (jenis) {
    case 'Tarik Dana':
      return WithdrawalNotificationDialogue();
    case 'Isi Saldo Dana':
      return TopupNotificationDialogue();
    case 'Bayar Pinjaman':
      return PaymentNotificationDialogue();
  }
}

List<riwayatTransaksi> data = [
  riwayatTransaksi(
      date: "20/05/2023",
      jenis: "Bayar Pinjaman",
      jumlah: 100000,
      status: "Belum Lunas",
      warna: "merah"),
  riwayatTransaksi(
      date: "20/05/2023",
      jenis: "Bayar Pinjaman",
      jumlah: 100000,
      status: "Belum Lunas",
      warna: "merah"),
  riwayatTransaksi(
      date: "20/05/2023",
      jenis: "Bayar Pinjaman",
      jumlah: 100000,
      status: "Lunas",
      warna: "green"),
  riwayatTransaksi(
      date: "20/05/2023",
      jenis: "Isi Saldo Dana",
      jumlah: 100000,
      status: "",
      warna: "white"),
  riwayatTransaksi(
      date: "20/05/2023",
      jenis: "Isi Saldo Dana",
      jumlah: 100000,
      status: "",
      warna: "white"),
  riwayatTransaksi(
      date: "20/05/2023",
      jenis: "Isi Saldo Dana",
      jumlah: 100000,
      status: "",
      warna: "white"),
  riwayatTransaksi(
      date: "20/05/2023",
      jenis: "Tarik Dana",
      jumlah: 100000,
      status: "",
      warna: "white"),
  riwayatTransaksi(
      date: "20/05/2023",
      jenis: "Tarik Dana",
      jumlah: 100000,
      status: "",
      warna: "white"),
];

class RiwayatTransaksiUmkm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                      Navigator.pop(context);
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
                    "Riwayat Transaksi",
                    style: TextStyle(fontSize: 24),
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: data.length,
                    itemBuilder: (context, int index) {
                      return GestureDetector(
                        onTap: () => showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => Dialog(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  const SizedBox(height: 15),
                                  getPage(data[index].jenis),
                                  const SizedBox(height: 15),
                                ],
                              ),
                            ),
                          ),
                        ),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          height: 60,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    '${data[index].jenis}',
                                    style: GoogleFonts.beVietnamPro(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'Rp${data[index].jumlah},-',
                                    style: GoogleFonts.beVietnamPro(
                                      fontSize: 13,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    data[index].date,
                                    style: GoogleFonts.beVietnamPro(
                                      fontSize: 11,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    '${data[index].status}',
                                    style: GoogleFonts.beVietnamPro(
                                      fontSize: 11,
                                      color: '${data[index].warna}' == 'merah'
                                          ? Color.fromARGB(255, 255, 17, 0)
                                          : Color.fromARGB(255, 6, 232, 14),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
