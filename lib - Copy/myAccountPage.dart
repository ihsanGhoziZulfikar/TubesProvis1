import 'package:flutter/material.dart';
import 'package:login_page/changePassPage.dart';
import 'package:login_page/home.dart';
import 'package:login_page/registerPage.dart';
import 'package:login_page/rolePage.dart';

import 'navbar.dart';

class MyAccountPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Text(
                "Akun Saya",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w800,
                  height: 1.3625,
                  color: Color(0xff000000),
                ),
              ),
              Container(
                padding: EdgeInsets.all(30),
                child: Stack(
                  children: [
                    Image.asset(
                      '../assets/images/icon-profile.png',
                      width: 100,
                      height: 100,
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Color(0xff1C355E),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                        ),
                      ),
                    )
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
                      Text(
                        'Informasi Akun',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          height: 1.265,
                          color: Color(0xff000000),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            'Email       : ',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              height: 1.265,
                              color: Color(0xff000000),
                            ),
                          ),
                          Text(
                            'drfeynman@gmail.com',
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Password : ',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  height: 1.265,
                                  color: Color(0xff000000),
                                ),
                              ),
                              Text(
                                '***********',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  height: 1.265,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return Scaffold(
                                      body: changePassPage(),
                                    );
                                  },
                                ),
                              );
                            },
                            child: Text(
                              'Ubah Kata Sandi',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                height: 1.265,
                                color: Color(0xffff0707),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Divider(
                          color: Colors.black,
                          thickness: 1.0,
                        ),
                      ),
                      Text(
                        'Informasi Pribadi',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          height: 1.265,
                          color: Color(0xff000000),
                        ),
                      ),
                      Text(
                        'Untuk memperbarui informasi Pribadi, hubungi cs kami di bizaid@gmail.com',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          height: 1.265,
                          color: Color(0xff000000),
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            'Nama Lengkap  : ',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              height: 1.265,
                              color: Color(0xff000000),
                            ),
                          ),
                          Text(
                            'Dr. Feynman',
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
                            'No. Handphone : ',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              height: 1.265,
                              color: Color(0xff000000),
                            ),
                          ),
                          Text(
                            '08123456789',
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                'KTP                     : ',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  height: 1.265,
                                  color: Color(0xff000000),
                                ),
                              ),
                              Text(
                                'Sudah diunggah',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  height: 1.265,
                                  color: Color(0xff757575),
                                ),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.remove_red_eye,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'No Rekening      : ',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              height: 1.265,
                              color: Color(0xff000000),
                            ),
                          ),
                          Text(
                            'Ada',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              height: 1.265,
                              color: Color(0xff757575),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Divider(
                          color: Colors.black,
                          thickness: 1.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 325,
                height: 48,
                decoration: BoxDecoration(
                  color: Color(0xfff9ff00),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Center(
                  child: Text(
                    'Lengkapi Data Pribadi',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      height: 1.265,
                      color: Color(0xff000000),
                    ),
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
