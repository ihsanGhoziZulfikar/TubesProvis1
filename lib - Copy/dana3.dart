import 'package:flutter/material.dart';

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

class Dana3 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 30, left: 10),
          alignment: Alignment.topLeft,
          child: Text(
            'Dana',
            style: GoogleFonts.beVietnamPro(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
        ),
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Text(
                  'Hi Ghozi,',
                  style: GoogleFonts.beVietnamPro(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(bottom: 20, left: 10),
                  child: Text(
                    "Lihat Isi Dana mu",
                    style: GoogleFonts.inter(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  )),
              Container(
                alignment: Alignment.center,
                child: Text(
                  'Dana Tersedia',
                  style: GoogleFonts.beVietnamPro(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(bottom: 20),
                  alignment: Alignment.center,
                  child: Text(
                    "Rp4.000.000,-",
                    style: GoogleFonts.inter(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.w600),
                  )),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    // padding: EdgeInsets.all(15),
                    decoration: BoxDecoration( 
                      shape: BoxShape.circle,
                      color: Color.fromARGB(255, 2, 46, 122),
                    ),
                    width: 80,
                    child: FittedBox(
                      child: IconButton(
                        onPressed: () {}, 
                        icon: Icon(Icons.add_circle_outline),
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Text(
                      "Top Up",
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    // padding: EdgeInsets.all(15),
                    decoration: BoxDecoration( 
                      shape: BoxShape.circle,
                      color: Color.fromARGB(255, 2, 46, 122),
                    ),
                    width: 80,
                    child: FittedBox(
                      child: IconButton(
                        onPressed: () {}, 
                        icon: Icon(Icons.change_circle),
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Text(
                      "Withdraw",
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 40, right: 40),
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 208, 223, 250),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12))),
                  padding: EdgeInsets.all(14),
                  child: Row(
                    children: [
                    Text(
                      'Riwayat Transaksi',
                      style: GoogleFonts.beVietnamPro(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Container(
                      child: Icon(Icons.keyboard_arrow_right),
                    ),
                  ]
                )
              ),
            ),
          ],
        ),
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: data.length,
            itemBuilder: (context, int index) {
              return Container(
                  margin: EdgeInsets.only(left: 40, right: 40),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 208, 223, 250),
                    // borderRadius: BorderRadius.circular(12)),
                  ),
                  padding: EdgeInsets.all(14),
                  // margin: EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${data[index].date}\nInvestasi ${data[index].nama}\nRp ${data[index].jumlah},00',
                        style: GoogleFonts.beVietnamPro(
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
    );
  }
}
