import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

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

class Ulasan extends StatelessWidget {
  const Ulasan({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            margin: EdgeInsets.only(left: 20, top: 10),
            child: Text(
              "Ulasan",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
                height: 1.3625,
                color: Color(0xff000000),
              ),
            ),
          ),
          ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: data.length,
              itemBuilder: (context, int index) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            '${data[index].date}',
                            style: TextStyle(
                              fontWeight: FontWeight.w100,
                              fontSize: 12,
                              color: Colors.grey,
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
                          Icon(Icons.star_rate, color: Colors.grey, size: 12),
                        ],
                      ),
                      SizedBox(height: 5),
                      Text(
                        '${data[index].desc}',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ])));
  }
}
