import 'package:android/homeUmkm.dart';
import 'package:flutter/material.dart';
import 'navbar2.dart';
import 'notificationSubmission.dart';
import 'fundingNotification.dart';
import 'withdrawalNotification.dart';
import 'topupNotification.dart';
import 'paymentNotification.dart';

import 'navbar.dart';

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

class ActivityUmkm extends StatelessWidget {
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
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return Navbar2(id: 1, id_umkm: 1);
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
                    "Aktivitas",
                    style: TextStyle(fontSize: 24),
                  )
                ],
              ),
              SizedBox(
                height: 10,
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
                            child: Row(
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF669AD9),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        getIconData(data[index].logo),
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
                                  width: 300,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${data[index].jenis}',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            '${data[index].date}',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Color(0xFF979797)),
                                          )
                                        ],
                                      ),
                                      Text(
                                        '${data[index].time}',
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
                        ),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    );
                  },
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
