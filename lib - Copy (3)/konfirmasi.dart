import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:google_fonts/google_fonts.dart';

class Konfirmasi extends StatelessWidget {
  const Konfirmasi({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
              child: Column(
            children: [
              SizedBox(height: 20),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 10),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: Text(
                  "Konfirmasi Pemberian Pinjaman Modal",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff1c355e),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Color(0xff1c355e),
                        width: 3,
                      ),
                    ),
                    child: Icon(
                      Icons.person_outline,
                      size: 40,
                      color: Color(0xff1c355e),
                    ),
                  ),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Lobias Maulana",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff1c355e),
                        ),
                      ),
                      Text(
                        "Bank Account : ",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              // Row(
              //   children: [
              Container(
                margin: EdgeInsets.only(left: 40, top: 10, bottom: 10),
                padding: EdgeInsets.only(left: 10),
                alignment: Alignment.centerLeft,
                height: 40,
                decoration: BoxDecoration(
                    border: Border(
                        left: BorderSide(
                  width: 1,
                  color: Colors.black,
                ))),
                child: Text(
                  "Kirim Pinjaman Modal",
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
              // Text(),
              //   ],
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Color(0xff1c355e),
                        width: 3,
                      ),
                    ),
                    child: Icon(
                      Icons.person_outline,
                      size: 40,
                      color: Color(0xff1c355e),
                    ),
                  ),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Cahaya Makmur",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff1c355e),
                        ),
                      ),
                      Text(
                        "Bank Account : ",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.all(20),
                // width: 340,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xffd6e4f0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Catatan",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      width: double.infinity,
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                      margin: EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        "Investasi Uang Pinjaman Kepada UMKM Penjual berbagai macam Properti",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff1c355e),
                        ),
                      ),
                    ),
                    Text(
                      "Jadwal Pemberian",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      margin: EdgeInsets.symmetric(vertical: 5),
                      padding: EdgeInsets.all(10),
                      width: double.infinity,
                      child: Text(
                        "Senin, 22 - 08 -2023",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Column(children: [
                        Text(
                          "Total Jumlah Pinjaman",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          "Rp 5.000.000,00",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff1c355e),
                          ),
                        ),
                      ]),
                    ),
                  ],
                ),
              ),
              // SizedBox(),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                decoration: BoxDecoration(
                  color: Color(0xff1c355e),
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                ),
                child: Center(
                  child: Text(
                    'Konfirmasi',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      height: 1.265,
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
              ),
            ],
          ))),
    );
  }
}
