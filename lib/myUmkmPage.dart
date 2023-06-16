import 'package:flutter/material.dart';
import 'changePassPage.dart';
import 'home.dart';
import 'pengajuanpinjaman.dart';
import 'registerPage.dart';
import 'rolePage.dart';
import 'ubahdata_umkm.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'konfirmasi.dart';
import 'navbar.dart';
import 'ratingDialogue.dart';

class MyUmkmPage extends StatelessWidget {
  final int id;
  final String img;
  final String nama;
  final String jenis;
  final int tahun;
  final String alamat;
  final String deskripsi;

  MyUmkmPage({
    super.key,
    required this.id,
    required this.img,
    required this.nama,
    required this.tahun,
    required this.alamat,
    required this.deskripsi,
    required this.jenis,
  });
  final pageController = PageController();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  Text(
                    "UMKM Saya",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                      color: Color(0xff000000),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 200.0,
                    child: PageView.builder(
                      controller: pageController,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 19.0),
                          child: Container(
                            width: 360.0,
                            decoration: BoxDecoration(
                              color: Color(0xFFD6E4F0),
                              borderRadius: BorderRadius.circular(10.0),
                              image: const DecorationImage(
                                image: NetworkImage(
                                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6FeM9xyfXso3joBifp3uVxFPXuxwDR3UH9A&usqp=CAU'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SmoothPageIndicator(
                    controller: pageController,
                    count: 3,
                    effect: WormEffect(
                        activeDotColor: Color(0xFF669AD9),
                        dotColor: Color(0xFFD6E4F0),
                        dotHeight: 10.0,
                        dotWidth: 10.0),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Informasi UMKM',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              height: 1.265,
                              color: Color(0xff000000),
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Text(
                                'Nama UMKM      : ',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  height: 1.265,
                                  color: Color(0xff000000),
                                ),
                              ),
                              Text(
                                nama,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  height: 1.265,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Alamat UMKM    : ',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  height: 1.265,
                                  color: Color(0xff000000),
                                ),
                              ),
                              Text(
                                alamat,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  height: 1.265,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Tahun Berdiri       : ',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  height: 1.265,
                                  color: Color(0xff000000),
                                ),
                              ),
                              Text(
                                tahun.toString(),
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  height: 1.265,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Kategori UMKM  : ',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  height: 1.265,
                                  color: Color(0xff000000),
                                ),
                              ),
                              Text(
                                jenis,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  height: 1.265,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Deskripsi UMKM : ',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  height: 1.265,
                                  color: Color(0xff000000),
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  deskripsi,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    height: 1.265,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: Divider(
                              color: Colors.black,
                              thickness: 0.5,
                            ),
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
                            return UbahDataUMKM(
                              id: id,
                              img: img,
                              nama: nama,
                              alamat: alamat,
                              tahun: tahun,
                              jenis: jenis,
                              deskripsi: deskripsi,
                            );
                          },
                        ),
                      );
                    },
                    child: Container(
                      width: 325,
                      height: 48,
                      decoration: BoxDecoration(
                        color: Color(0xfff9ff00),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Center(
                        child: Text(
                          'Ubah Data UMKM',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            height: 1.265,
                            color: Color(0xff000000),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return PengajuanPinjaman();
                          },
                        ),
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(15),
                      margin: EdgeInsets.only(top: 5, bottom: 5),
                      decoration: BoxDecoration(
                        color: Color(0xff1C355E),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Center(
                        child: Text(
                          'Ajukan',
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
