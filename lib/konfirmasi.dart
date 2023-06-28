import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:google_fonts/google_fonts.dart';

class Konfirmasi extends StatelessWidget {
  const Konfirmasi({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
                child: Column(
              children: [
                SizedBox(height: 20),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
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
                      SizedBox(width: 5),
                      Text(
                        "Konfirmasi Pemberian Pinjaman Modal",
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff1c355e),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 25),
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
                        size: 50,
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
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff1c355e),
                          ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          "Bank               : BIN",
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          "No Rekening : 12345876",
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(left: 48, top: 15, bottom: 15),
                  padding: EdgeInsets.only(left: 15),
                  alignment: Alignment.centerLeft,
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        width: 1,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  child: Text(
                    "Kirim Pinjaman Modal",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
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
                        size: 50,
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
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff1c355e),
                          ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          "Bank               : BNN",
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          "No Rekening : 01234567",
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
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
                      SizedBox(height: 5),
                      Container(
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(vertical: 5),
                        child: TextField(
                          style: TextStyle(fontSize: 13),
                          maxLength: 120,
                          maxLines: 3,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            border: InputBorder.none,
                            hintText: 'Enter your text',
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Jadwal Pemberian",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 5),
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
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey),
                        ),
                      ),
                      SizedBox(height: 20),
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
                          SizedBox(height: 10),
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
      ),
    );
  }
}
