import 'package:flutter/material.dart';
import 'package:login_page/KontakKami_Akun.dart';
import 'package:login_page/syaratdanketentuan_akun.dart';

import 'myAccountPage.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 13.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Akun",
                  style: TextStyle(
                    fontSize: 23,
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Text(
                        "Keluar",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 5.0),
                      Icon(Icons.logout, size: 24, color: Colors.red),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 32.0),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                padding: EdgeInsets.all(10.0),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://cdn-icons-png.flaticon.com/512/4086/4086679.png',
                  ),
                  radius: 80,
                )),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        "Dr. Feynman",
                        style: TextStyle(
                          fontSize: 26.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            size: 15.0,
                            color: Colors.amber,
                          ),
                          Text(
                            '5.0',
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 5.0),
                          Icon(
                            Icons.circle,
                            size: 5.0,
                            color: Colors.black,
                          ),
                          SizedBox(width: 5.0),
                          Text(
                            'Joined from 2016',
                            style: TextStyle(
                              color: Colors.grey,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 28.0),
                      TextButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(130.0),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color(0xFF1C355E)),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          overlayColor:
                              MaterialStateProperty.resolveWith<Color?>(
                            (Set<MaterialState> states) {
                              if (states.contains(MaterialState.hovered))
                                return Colors.blue.withOpacity(0.04);
                              if (states.contains(MaterialState.focused) ||
                                  states.contains(MaterialState.pressed))
                                return Colors.blue.withOpacity(0.12);
                              return null;
                            },
                          ),
                        ),
                        onPressed: () {},
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return Scaffold(
                                    body: MyAccountPage(),
                                  );
                                },
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 4.0),
                            child: Text(
                              'Ubah Akun',
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 38,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              width: 360,
              height: 225,
              decoration: BoxDecoration(
                color: Color(0xFFD6E4F0),
                borderRadius: BorderRadius.circular(40.0),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Column(children: [
                  Container(
                    height: 48,
                    width: 290,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Pusat Bantuan",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return SyaratdanKetentuan();
                          },
                        ),
                      );
                    },
                    child: Container(
                      height: 48,
                      width: 290,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Syarat dan Ketentuan",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return Kontakkami();
                          },
                        ),
                      );
                    },
                    child: Container(
                      height: 48,
                      width: 290,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Kontak Kami",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          ),
          SizedBox(height: 80.0),
        ],
      ),
    );
  }
}
