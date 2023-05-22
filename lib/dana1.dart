import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

class dana1 extends StatelessWidget {
  const dana1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 250,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 119, 166, 232),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Dana',
                  style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Container(
                      alignment: Alignment.topCenter,
                      padding: const EdgeInsets.all(14),
                      child: Text(
                        'Dana Tersedia\nRp 4.000.000,00',
                        style: GoogleFonts.inter(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Tarik Dana'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 2, 46, 122),
                      textStyle: GoogleFonts.inter(fontSize: 20),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 25),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                'Riwayat Transaksi',
                style: GoogleFonts.roboto(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: data.length,
              itemBuilder: (context, int index) {
                return Container(
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 208, 223, 250),
                        borderRadius: BorderRadius.circular(12)),
                    padding: EdgeInsets.all(14),
                    margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${data[index].date}\nInvestasi ${data[index].nama}\nRp ${data[index].jumlah},00',
                          style: GoogleFonts.inter(
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
                    )
                  );
              },
            ),
          ),
        ],
      ),
    );
  }
}