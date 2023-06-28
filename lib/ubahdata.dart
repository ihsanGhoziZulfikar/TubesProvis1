import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UbahData extends StatelessWidget {
  const UbahData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Text(
                "Ubah Akun",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w800,
                  height: 1.3625,
                  color: Color(0xff000000),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 120,
                margin: EdgeInsets.only(left: 120),
                child: Stack(
                  children: [
                    Positioned(
                      left: 40,
                      child: Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.black, // Warna border
                            width: 3.0, 
                          )
                        ),
                        child: Icon(Icons.person_outline, size: 50),
                      ),
                    ),
                    Positioned(
                      top: 45,
                      left: 95,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 1, 47, 68),
                          // border: Border.all(
                          //   color: Colors.black, // Warna border
                          //   width: 3.0, 
                          // )
                        ),
                        child: InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(100.0), // Atur radius sesuai dengan ukuran ikon
                          child: Padding(
                            padding: const EdgeInsets.all(4.0), // Sesuaikan padding sesuai kebutuhan Anda
                            child: Icon(Icons.photo_camera, size: 10, color: Colors.white,),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        child: Text(
                          "Nama",
                          style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                height: 1.265,
                                color: Color(0xff000000),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: Color(0xffd6e4f0),
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10),
                            border: InputBorder.none,
                            hintText: 'Enter your text',
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        child: Text(
                          "Username",
                          style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                height: 1.265,
                                color: Color(0xff000000),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: Color(0xffd6e4f0),
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10),
                            border: InputBorder.none,
                            hintText: 'Enter your text',
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        child: Text(
                          "Email",
                          style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                height: 1.265,
                                color: Color(0xff000000),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: Color(0xffd6e4f0),
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10),
                            border: InputBorder.none,
                            hintText: 'Enter your text',
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        child: Text(
                          "Nomor Telepon",
                          style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                height: 1.265,
                                color: Color(0xff000000),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: Color(0xffd6e4f0),
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10),
                            border: InputBorder.none,
                            hintText: 'Enter your text',
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        child: Text(
                          "Tanggal Lahir",
                          style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                height: 1.265,
                                color: Color(0xff000000),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: Color(0xffd6e4f0),
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10),
                            border: InputBorder.none,
                            hintText: 'Enter your text',
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        child: Text(
                          "Alamat",
                          style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                height: 1.265,
                                color: Color(0xff000000),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: Color(0xffd6e4f0),
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10),
                            border: InputBorder.none,
                            hintText: 'Enter your text',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(vertical: 10),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        decoration: BoxDecoration(
                          color: Color(0xff1c355e),
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                        ),
                        child: Center(
                          child: Text(
                            'Ubah',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              height: 1.265,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(vertical: 10),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        decoration: BoxDecoration(
                          color: Color(0xffff0707),
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                        ),
                        child: Center(
                          child: Text(
                            'Batal',
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
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}