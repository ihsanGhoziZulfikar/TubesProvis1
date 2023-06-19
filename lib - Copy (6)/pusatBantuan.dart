import 'package:flutter/material.dart';

class PusatBantuan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: 400,
                height: 280,
                decoration: BoxDecoration(
                  color: Color(0xFFD6E4F0),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(200),
                    bottomRight: Radius.circular(200),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 50),
                    Text("Pusat Bantuan", style: TextStyle(fontSize: 22)),
                    SizedBox(height: 32),
                    Image.asset(
                      'assets/images/logo.png',
                      width: 146,
                      height: 92,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 70),
              Column(
                children: [
                  Container(
                    width: 363,
                    child: ExpansionTile(
                      tilePadding: EdgeInsets.symmetric(horizontal: 20),
                      backgroundColor: Color(0xFFD6E4F0),
                      collapsedBackgroundColor: Color(0xFFD6E4F0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      collapsedShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      title: Text("Apakah peer-to-peer (P2P) lending itu?",
                          style: TextStyle(fontSize: 14)),
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 20),
                          child: Text(
                              "P2P lending adalah sistem pinjaman online yang menghubungkan peminjam dan pemberi pinjaman secara langsung melalui platform seperti BizAid. Peminjam dapat mengajukan pinjaman tanpa melalui lembaga keuangan tradisional, sementara pemberi pinjaman dapat memberikan pinjaman dan menghasilkan keuntungan. Dengan P2P lending, pinjaman menjadi lebih mudah diakses dan prosesnya lebih cepat."),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    width: 363,
                    child: ExpansionTile(
                      tilePadding: EdgeInsets.symmetric(horizontal: 20),
                      backgroundColor: Color(0xFFD6E4F0),
                      collapsedBackgroundColor: Color(0xFFD6E4F0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      collapsedShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      title: Text(
                          "Dokumen apa saja yang harus dipersiapkan untuk pendaftaran?",
                          style: TextStyle(fontSize: 14)),
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 20),
                          child: Text(
                              "Untuk pendaftaran di BizAid, Anda perlu menyiapkan beberapa dokumen penting. Dokumen-dokumen yang biasanya diperlukan meliputi KTP atau identitas pribadi lainnya, NPWP, surat izin usaha, laporan keuangan terkini, dan dokumen pendukung lainnya sesuai dengan persyaratan yang ditetapkan."),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    width: 363,
                    child: ExpansionTile(
                      tilePadding: EdgeInsets.symmetric(horizontal: 20),
                      backgroundColor: Color(0xFFD6E4F0),
                      collapsedBackgroundColor: Color(0xFFD6E4F0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      collapsedShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      title: Text(
                          "Bagaimana cara mendaftar sebagai pemberi pinjaman di aplikasi BizAid?",
                          style: TextStyle(fontSize: 14)),
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 20),
                          child: Text(
                              'Untuk mendaftar sebagai pemberi pinjaman di aplikasi BizAid, Anda perlu mengunduh dan menginstal aplikasi BizAid, kemudian pilih opsi "Mendaftar sebagai Pemberi Pinjaman". Isi formulir pendaftaran, verifikasi identitas dengan mengunggah dokumen-dokumen yang diminta, lengkapi profil pemberi pinjaman, dan tentukan jumlah dana serta suku bunga yang akan Anda pinjamkan. Setelah melalui proses verifikasi, Anda akan mendapatkan konfirmasi bahwa pendaftaran sebagai pemberi pinjaman telah berhasil. Selanjutnya, Anda dapat mulai menjelajahi dan memilih pinjaman yang ingin Anda berikan serta mengikuti proses investasi yang ditetapkan oleh BizAid.'),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    width: 363,
                    child: ExpansionTile(
                      tilePadding: EdgeInsets.symmetric(horizontal: 20),
                      backgroundColor: Color(0xFFD6E4F0),
                      collapsedBackgroundColor: Color(0xFFD6E4F0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      collapsedShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      title: Text(
                        "Bagaimana BizAid menyimpan data yang telah saya berikan?",
                        style: TextStyle(fontSize: 14),
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 20),
                          child: Text(
                              "BizAid mengimplementasikan langkah-langkah keamanan yang ketat untuk melindungi dan menjaga kerahasiaan data yang Anda berikan. Data Anda disimpan dengan enkripsi, hanya dapat diakses oleh pihak berwenang, dan kami mematuhi peraturan privasi yang berlaku. Keamanan dan privasi data Anda adalah prioritas kami."),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    width: 363,
                    child: ExpansionTile(
                      tilePadding: EdgeInsets.symmetric(horizontal: 20),
                      backgroundColor: Color(0xFFD6E4F0),
                      collapsedBackgroundColor: Color(0xFFD6E4F0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      collapsedShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      title: Text("Bagaimana jika peminjam gagal membayar?",
                          style: TextStyle(fontSize: 14)),
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 20),
                          child: Text(
                              "Jika peminjam mengalami kesulitan atau gagal membayar pinjamannya, BizAid memiliki kebijakan dan langkah-langkah tertentu yang akan diambil. BizAid akan melakukan upaya untuk menghubungi peminjam dan mencari solusi terbaik untuk menyelesaikan masalah pembayaran. Jika peminjam tetap tidak dapat membayar, BizAid dapat mengambil tindakan yang sesuai sesuai dengan ketentuan kontrak pinjaman, termasuk melakukan penagihan melalui lembaga penagihan yang berwenang."),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 40),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
