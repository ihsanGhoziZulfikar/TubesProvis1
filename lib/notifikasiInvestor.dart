import 'package:android/bellNotification.dart';
import 'package:android/home.dart';
import 'package:flutter/material.dart';

class notifikasi {
  String waktu;
  String judul;
  String konten;
  notifikasi({
    required this.waktu,
    required this.judul,
    required this.konten,
  });
}

List<notifikasi> umum = [
  notifikasi(
    waktu: "12:12 WIB",
    judul: "Perubahan Profil",
    konten:
        "Perubahan profil Anda telah berhasil diterapkan. Informasi yang diperbarui, termasuk alamat email dan nomor telepon, sekarang aktif di akun Anda. Harap periksa kembali detail profil Anda untuk memastikan keakuratan informasi.",
  ),
  notifikasi(
    waktu: "12:12 WIB",
    judul: "Perubahan Password",
    konten:
        "Anda melakukan perubahan pada akun Anda tepatnya untuk bagian Password. Harap periksa kembali detail akun/profil Anda untuk memastikan bahwa Anda yang melakukannya.",
  ),
  notifikasi(
    waktu: "12:12 WIB",
    judul: "Penawaran Investasi Umkm",
    konten:
        "Kami senang memberitahukan bahwa ada penawaran investasi UMKM baru yang tersedia. Penawaran ini memberikan kesempatan kepada Anda sebagai investor untuk berpartisipasi dalam mendukung pertumbuhan dan perkembangan UMKM. Anda dapat melihat rincian penawaran pada halaman UMKM.",
  ),
  notifikasi(
    waktu: "12:12 WIB",
    judul: "Penawaran Investasi Umkm",
    konten:
        "Kami ingin memberitahu Anda bahwa setelah periode yang cukup lama tanpa investasi, ada penawaran investasi UMKM baru yang tersedia. Ini adalah kesempatan  bagi Anda untuk kembali berinvestasi dan mendukung pertumbuhan UMKM. Anda dapat melihat rincian penawaran pada halaman UMKM.",
  ),
  notifikasi(
    waktu: "12:12 WIB",
    judul: "Penawaran Investasi Umkm",
    konten:
        "Kami senang memberitahukan bahwa ada penawaran investasi UMKM baru yang tersedia. Penawaran ini memberikan kesempatan kepada Anda sebagai investor untuk berpartisipasi dalam mendukung pertumbuhan dan perkembangan UMKM. Anda dapat melihat rincian penawaran pada halaman UMKM.",
  ),
];

List<notifikasi> umkm = [
  notifikasi(
    waktu: "12:12 WIB",
    judul: "Pembayaran Peminjaman Umkm",
    konten:
        "Kami senang untuk memberitahu Anda bahwa Anda telah menerima pembayaran dari pemilik Umkm Cendol Ihsan Seger untuk pinjaman yang Anda investasikan. Pembayaran sebesar Rp. 1,250,000-, telah berhasil diproses dan diterima ke akun investasi Anda.",
  ),
  notifikasi(
    waktu: "12:12 WIB",
    judul: "Pembayaran Umkm Terlambat",
    konten:
        "Kami ingin memberitahukan kepada Anda bahwa terdapat pinjaman yang mengalami hambatan pembayaran melebihi jadwal yang ditentukan. Pemilik Umkm Dodol Vivin belum membayar angsuran sesuai jadwal yang ditentukan. Kami akan terus memantau perkembangan dan memberikan pembaruan kepada Anda segera setelah ada perkembangan lebih lanjut.",
  ),
  notifikasi(
    waktu: "12:12 WIB",
    judul: "Pembayaran Peminjaman Umkm",
    konten:
        "Kami senang untuk memberitahu Anda bahwa Anda telah menerima pembayaran dari pemilik Umkm Cendol Ihsan Seger untuk pinjaman yang Anda investasikan. Pembayaran sebesar Rp. 1,250,000-, telah berhasil diproses dan diterima ke akun investasi Anda.",
  ),
  notifikasi(
    waktu: "12:12 WIB",
    judul: "Pembayaran Peminjaman Umkm",
    konten:
        "Kami senang untuk memberitahu Anda bahwa Anda telah menerima pembayaran dari pemilik Umkm Cendol Ihsan Seger untuk pinjaman yang Anda investasikan. Pembayaran sebesar Rp. 1,250,000-, telah berhasil diproses dan diterima ke akun investasi Anda.",
  ),
  notifikasi(
    waktu: "12:12 WIB",
    judul: "Pembayaran Peminjaman Umkm",
    konten:
        "Kami senang untuk memberitahu Anda bahwa Anda telah menerima pembayaran dari pemilik Umkm Cendol Ihsan Seger untuk pinjaman yang Anda investasikan. Pembayaran sebesar Rp. 1,250,000-, telah berhasil diproses dan diterima ke akun investasi Anda.",
  ),
  notifikasi(
    waktu: "12:12 WIB",
    judul: "Pelunasan Peminjaman Umkm",
    konten:
        "Kami senang untuk memberitahu Anda bahwa Anda telah menerima pelunasan pembayaran dari Pemilik Gerai Lanjuang untuk pinjaman yang Anda investasikan. Peminjam telah melunasi pinjaman secara penuh sesuai dengan jadwal pembayaran. Jumlah pembayaran yang Anda terima dengan total sebesar Rp.11,000,000,-.",
  ),
];

class NotifikasiInvestor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            double screenWidth = constraints.maxWidth;
            double screenHeight = constraints.maxHeight;
            return SingleChildScrollView(
              child: DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    Container(
                      width: screenWidth,
                      height: screenHeight,
                      decoration: BoxDecoration(
                        color: Color(0xFFD6E4F0),
                        borderRadius: BorderRadius.only(),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 10),
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child:
                                    Icon(Icons.arrow_back_rounded, size: 35)),
                          ),
                          Center(
                            child: Text(
                              "Notifikasi",
                              style: TextStyle(fontSize: 24),
                            ),
                          ),
                          SizedBox(height: 30),
                          TabBar(
                            indicatorSize: TabBarIndicatorSize.label,
                            labelColor: Colors.black,
                            labelStyle: TextStyle(fontSize: 16),
                            indicatorColor: Color(0xFF669AD9),
                            tabs: [
                              Tab(text: "            Umum            "),
                              Tab(text: "           UMKM           "),
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
                                      itemCount: umum.length,
                                      itemBuilder: (context, index) {
                                        String judul = umum[index].judul;
                                        String konten = umum[index].konten;
                                        String waktu = umum[index].waktu;

                                        return GestureDetector(
                                          onTap: () => showDialog<String>(
                                            context: context,
                                            builder: (BuildContext context) =>
                                                Dialog(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    const SizedBox(height: 15),
                                                    BellNotificationDialogue(
                                                        judul: judul,
                                                        konten: konten,
                                                        waktu: waktu),
                                                    const SizedBox(height: 15),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20.0,
                                                right: 20.0,
                                                top: 5.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      judul,
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                      waktu,
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: Colors.grey),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 8),
                                                Text(
                                                  konten,
                                                  style:
                                                      TextStyle(fontSize: 13),
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                Divider(
                                                    height: 25, thickness: 1),
                                              ],
                                            ),
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
                                      itemCount: umkm.length,
                                      itemBuilder: (context, index) {
                                        String judul = umkm[index].judul;
                                        String konten = umkm[index].konten;
                                        String waktu = umkm[index].waktu;

                                        return GestureDetector(
                                          onTap: () => showDialog<String>(
                                            context: context,
                                            builder: (BuildContext context) =>
                                                Dialog(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    const SizedBox(height: 15),
                                                    BellNotificationDialogue(
                                                        judul: judul,
                                                        konten: konten,
                                                        waktu: waktu),
                                                    const SizedBox(height: 15),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20.0,
                                                right: 20.0,
                                                top: 5.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      judul,
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                      waktu,
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: Colors.grey),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 8),
                                                Text(
                                                  konten,
                                                  style:
                                                      TextStyle(fontSize: 13),
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                Divider(
                                                    height: 25, thickness: 1),
                                              ],
                                            ),
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
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
