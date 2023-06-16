import 'package:flutter/material.dart';
import 'package:login_page/ratingDialogue.dart';
import 'package:login_page/ulasan.dart';

class UmkmProfile extends StatelessWidget {
  final int id;
  final String img;
  final String nama;
  final String jenis;
  final String alamat;
  final String deskripsi;

  const UmkmProfile({
    super.key,
    required this.id,
    required this.img,
    required this.nama,
    required this.alamat,
    required this.deskripsi,
    required this.jenis,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              // Icon(Icons.arrow_back, size: 24, color: Colors.black),
              // SizedBox(width: 35.0),
              Text(
                "Profil Usaha Mitra UMKM $id aa",
                style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF1C355E),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12),
              Container(
                width: 340,
                height: 650,
                decoration: BoxDecoration(
                  color: Color(0xFFD2E2F0),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                        img,
                      ),
                      radius: 70,
                    ),
                    SizedBox(height: 20),
                    Text(
                      nama,
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF1C355E),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Modal Dagang Toko Kue Nastar",
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF1C355E),
                      ),
                    ),
                    SizedBox(height: 15),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.location_on, size: 14, color: Colors.red),
                          Text(
                            alamat,
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.star, size: 15, color: Colors.amber),
                            Text(
                              "5.0",
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.black,
                              ),
                            ),
                          ]),
                    ),
                    SizedBox(height: 15),
                    Container(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 5.0),
                                child: Text(
                                  "Deskripsi Mitra",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: 280,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Color(0xFF669AD9),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: RichText(
                                textAlign: TextAlign.justify,
                                text: TextSpan(
                                  text: deskripsi,
                                  // text:
                                  //     "Roberto Ihsan Lautaro merupakan Pemilik Usaha UMKM yang bergerak di bidang perdagangan, menjual berbagai macam jenis Kue Nastar.",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    Container(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 5.0),
                                child: Text(
                                  "Informasi Mitra",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: 280,
                            height: 160,
                            decoration: BoxDecoration(
                              color: Color(0xFF669AD9),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 6.5),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: Container(
                                      width: 247,
                                      height: 33,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Jangka Waktu Pendanaan",
                                              style: TextStyle(fontSize: 12),
                                            ),
                                            Text(
                                              "50 Minggu",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: Container(
                                      width: 247,
                                      height: 33,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Bunga Pinjaman",
                                              style: TextStyle(fontSize: 12),
                                            ),
                                            Text(
                                              "10 %",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: Container(
                                      width: 247,
                                      height: 33,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Nominal Pinjaman",
                                              style: TextStyle(fontSize: 12),
                                            ),
                                            Text(
                                              "Rp50.000.000",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return Ulasan();
                                },
                              ),
                            );
                          },
                          child: Row(
                            children: [
                              Text('ulasan'),
                            ],
                          ),
                        ),
                        TextButton(
                          onPressed: () => showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => Dialog(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    const SizedBox(height: 15),
                                    RatingDialogue(),
                                    const SizedBox(height: 15),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          child: const Text('Tambah Ulasan'),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
