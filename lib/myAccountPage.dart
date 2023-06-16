import 'package:android/ubahdata.dart';
import 'package:flutter/material.dart';
import 'changePassPage.dart';
import 'home.dart';
import 'registerPage.dart';
import 'rolePage.dart';

import 'lengkapidata.dart';
import 'navbar.dart';

class MyAccountPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Text(
                  "Akun Saya",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w800,
                    height: 1.362,
                    color: Color(0xff000000),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  padding: EdgeInsets.all(30),
                  child: CircleAvatar(
                    radius: 70,
                    backgroundImage: NetworkImage(
                        'https://cdn-icons-png.flaticon.com/512/4086/4086679.png'),
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
                        SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            Text(
                              'Email          : ',
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
                        SizedBox(height: 7),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Kata Sandi : ',
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
                                      return changePassPage();
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
                          padding: EdgeInsets.only(top: 20, bottom: 30),
                          child: Divider(
                            color: Colors.black,
                            thickness: 0.5,
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
                        SizedBox(height: 7),
                        Text(
                          'Untuk memperbarui informasi Pribadi, hubungi cs kami di bizaid@gmail.com',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            height: 1.265,
                            color: Color(0xff000000),
                          ),
                        ),
                        SizedBox(height: 20),
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
                        SizedBox(height: 7),
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
                        SizedBox(height: 7),
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
                        SizedBox(height: 7),
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
                          padding: EdgeInsets.only(top: 20, bottom: 20),
                          child: Divider(
                            color: Colors.black,
                            thickness: 0.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return LengkapiData();
                        },
                      ),
                    );
                  },
                  child: Container(
                    width: 325,
                    height: 48,
                    decoration: BoxDecoration(
                      color: Color(0xfff9ff00),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Center(
                      child: Text(
                        'Lengkapi Data Profil',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          height: 1.265,
                          color: Color(0xff000000),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
