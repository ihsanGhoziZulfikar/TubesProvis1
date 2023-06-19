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

class listUlasan {
  String date;
  String nama;
  String desc;
  listUlasan({required this.date, required this.nama, required this.desc});
}

List<listUlasan> data = [
  listUlasan(
      date: "11 Jan 2025",
      nama: "Lubertus Minamino",
      desc:
          "Pak Gatot selaku pemilik UMKM Sirup Gulali sangat berdedikasi dan berintegritas dalam memenuhi janjinya untuk bayar tagihan."),
  listUlasan(
      date: "11 Jan 2025",
      nama: "Lubertus Minamino",
      desc:
          "Pak Gatot selaku pemilik UMKM Sirup Gulali sangat berdedikasi dan berintegritas dalam memenuhi janjinya untuk bayar tagihan."),
  listUlasan(
      date: "11 Jan 2025",
      nama: "Lubertus Minamino",
      desc:
          "Pak Gatot selaku pemilik UMKM Sirup Gulali sangat berdedikasi dan berintegritas dalam memenuhi janjinya untuk bayar tagihan."),
  listUlasan(
      date: "11 Jan 2025",
      nama: "Lubertus Minamino",
      desc:
          "Pak Gatot selaku pemilik UMKM Sirup Gulali sangat berdedikasi dan berintegritas dalam memenuhi janjinya untuk bayar tagihan."),
];

class UlasanUmkm extends StatelessWidget {
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
                    "Ulasan",
                    style: TextStyle(fontSize: 24),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 3, top: 10.0),
                    child: Text(
                      "4",
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
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
                      return Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xffd6e4f0),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${data[index].nama}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14,
                                    color: Colors.black,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                                Text(
                                  '${data[index].date}',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                Icon(Icons.star_rate,
                                    color: Color.fromARGB(255, 247, 223, 5),
                                    size: 12),
                                SizedBox(width: 2),
                                Icon(Icons.star_rate,
                                    color: Color.fromARGB(255, 247, 223, 5),
                                    size: 12),
                                SizedBox(width: 2),
                                Icon(Icons.star_rate,
                                    color: Color.fromARGB(255, 247, 223, 5),
                                    size: 12),
                                SizedBox(width: 2),
                                Icon(Icons.star_rate,
                                    color: Color.fromARGB(255, 247, 223, 5),
                                    size: 12),
                                SizedBox(width: 2),
                                Icon(Icons.star_rate,
                                    color: Colors.grey, size: 12),
                              ],
                            ),
                            SizedBox(height: 5),
                            Text(
                              '${data[index].desc}',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 13,
                                color: Colors.black,
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ],
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
