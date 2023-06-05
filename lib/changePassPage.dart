import 'package:flutter/material.dart';
import 'package:login_page/home.dart';
import 'package:login_page/registerPage.dart';
import 'package:login_page/rolePage.dart';

import 'navbar.dart';

class changePassPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    "Ubah Kata Sandi",
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
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Kata Sandi Baru',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  height: 1.265,
                                  color: Color(0xff000000),
                                ),
                              ),
                              Text(
                                '*',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  height: 1.265,
                                  color: Color(0xffff0707),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                              color: Color(0xffd6e4f0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40)),
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
                          Row(
                            children: [
                              Text(
                                'Konfirmasi Kata Sandi',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  height: 1.265,
                                  color: Color(0xff000000),
                                ),
                              ),
                              Text(
                                '*',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  height: 1.265,
                                  color: Color(0xffff0707),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                              color: Color(0xffd6e4f0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40)),
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
                          Text(
                            '*Kata Sandi minimal 8 karakter',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              height: 1.265,
                              color: Color(0xffa4a3a3),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            width: double.infinity,
                            margin: EdgeInsets.symmetric(vertical: 10),
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            decoration: BoxDecoration(
                              color: Color(0xff1c355e),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40)),
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
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            decoration: BoxDecoration(
                              color: Color(0xffff0707),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40)),
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
        ),
      ),
    );
  }
}
