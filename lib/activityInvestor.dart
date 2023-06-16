import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

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
    foto:
        "https://swamediainc.storage.googleapis.com/swa.co.id/wp-content/uploads/2021/01/20122139/daging-sapi.jpg",
    nama: "Daging Sapi Ibu Ira",
    sisa: 4000000,
    total: 10000000,
    waktu: "14 Des 2023 - 21 Jun 2024",
  ),
  umkm(
    foto:
        "https://swamediainc.storage.googleapis.com/swa.co.id/wp-content/uploads/2021/01/20122139/daging-sapi.jpg",
    nama: "Daging Sapi Ibu Ira",
    sisa: 4000000,
    total: 10000000,
    waktu: "14 Des 2023 - 21 Jun 2024",
  ),
  umkm(
    foto:
        "https://swamediainc.storage.googleapis.com/swa.co.id/wp-content/uploads/2021/01/20122139/daging-sapi.jpg",
    nama: "Daging Sapi Ibu Ira",
    sisa: 4000000,
    total: 10000000,
    waktu: "14 Des 2023 - 21 Jun 2024",
  ),
  umkm(
    foto:
        "https://swamediainc.storage.googleapis.com/swa.co.id/wp-content/uploads/2021/01/20122139/daging-sapi.jpg",
    nama: "Daging Sapi Ibu Ira",
    sisa: 4000000,
    total: 10000000,
    waktu: "14 Des 2023 - 21 Jun 2024",
  ),
  umkm(
    foto:
        "https://swamediainc.storage.googleapis.com/swa.co.id/wp-content/uploads/2021/01/20122139/daging-sapi.jpg",
    nama: "Daging Sapi Ibu Ira",
    sisa: 4000000,
    total: 10000000,
    waktu: "14 Des 2023 - 21 Jun 2024",
  ),
  umkm(
    foto:
        "https://swamediainc.storage.googleapis.com/swa.co.id/wp-content/uploads/2021/01/20122139/daging-sapi.jpg",
    nama: "Daging Sapi Ibu Ira",
    sisa: 4000000,
    total: 10000000,
    waktu: "14 Des 2023 - 21 Jun 2024",
  ),
];

List<umkm> riwayat = [
  umkm(
    foto:
        "https://swamediainc.storage.googleapis.com/swa.co.id/wp-content/uploads/2021/01/20122139/daging-sapi.jpg",
    nama: "Daging Sapi Ibu Ira",
    sisa: 4000000,
    total: 10000000,
    status: "Lunas",
    waktu: "14 Des 2023 - 21 Jun 2024",
  ),
  umkm(
    foto:
        "https://swamediainc.storage.googleapis.com/swa.co.id/wp-content/uploads/2021/01/20122139/daging-sapi.jpg",
    nama: "Daging Sapi Ibu Ira",
    sisa: 4000000,
    total: 10000000,
    status: "Tidak Lunas",
    waktu: "14 Des 2023 - 21 Jun 2024",
    warna: "red",
  ),
];

class ActivityInvestor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                      padding: const EdgeInsets.only(left: 8.0, right: 20.0),
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
                    text: '    Semua    ',
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
                          itemCount: pendanaan.length,
                          itemBuilder: (context, index) {
                            String foto = pendanaan[index].foto;
                            String nama = pendanaan[index].nama;
                            double sisa = pendanaan[index].sisa;
                            double total = pendanaan[index].total;
                            String waktu = pendanaan[index].waktu;

                            return Padding(
                              padding: const EdgeInsets.only(
                                  left: 10.0, right: 10.0, top: 10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ListTile(
                                    leading: Image.network(
                                      foto,
                                      fit: BoxFit.cover,
                                    ),
                                    title: Text(
                                      nama,
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
                                              MainAxisAlignment.spaceBetween,
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
                                              ).format(sisa),
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 3),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
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
                                              ).format(total),
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
                                              style: TextStyle(fontSize: 10),
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
                          itemCount: pendanaan.length,
                          itemBuilder: (context, index) {
                            String foto = pendanaan[index].foto;
                            String nama = pendanaan[index].nama;
                            double sisa = pendanaan[index].sisa;
                            double total = pendanaan[index].total;
                            String waktu = pendanaan[index].waktu;

                            return Padding(
                              padding: const EdgeInsets.only(
                                  left: 10.0, right: 10.0, top: 10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ListTile(
                                    leading: Image.network(
                                      foto,
                                      fit: BoxFit.cover,
                                    ),
                                    title: Text(
                                      nama,
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
                                              MainAxisAlignment.spaceBetween,
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
                                              ).format(sisa),
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 3),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
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
                                              ).format(total),
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
                                              style: TextStyle(fontSize: 10),
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
                          itemCount: riwayat.length,
                          itemBuilder: (context, index) {
                            String foto = riwayat[index].foto;
                            String nama = riwayat[index].nama;
                            String status = riwayat[index].status;
                            double total = riwayat[index].total;
                            String waktu = riwayat[index].waktu;

                            return Padding(
                              padding: const EdgeInsets.only(
                                  left: 10.0, right: 10.0, top: 10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ListTile(
                                    leading: Image.network(
                                      foto,
                                      fit: BoxFit.cover,
                                    ),
                                    title: Text(
                                      nama,
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
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Total Pinjaman:",
                                              style: TextStyle(fontSize: 12),
                                            ),
                                            Text(
                                              NumberFormat.currency(
                                                symbol: 'Rp',
                                                decimalDigits: 0,
                                              ).format(total),
                                              style: TextStyle(fontSize: 12),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 3),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Status akhir:",
                                              style: TextStyle(fontSize: 12),
                                            ),
                                            Text(
                                              status,
                                              style: TextStyle(
                                                fontSize: 12,
                                                color:
                                                    '${riwayat[index].warna}' ==
                                                            'green'
                                                        ? Color.fromARGB(
                                                            255, 6, 232, 14)
                                                        : Color.fromARGB(
                                                            255, 255, 17, 0),
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
                                              style: TextStyle(fontSize: 10),
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
