import 'package:flutter/material.dart';
import 'package:login_page/Aktivitasscreen.dart';
import 'package:login_page/account.dart';
import 'package:login_page/changePassPage.dart';
import 'package:login_page/dana3.dart';
import 'package:login_page/home.dart';
import 'package:login_page/myUmkmPage.dart';
import 'package:login_page/syaratdanketentuan_akun.dart';
import 'package:login_page/umkm.dart';
import 'package:login_page/umkmVisitorPage.dart';

import 'dana2.dart';
import 'homeUmkm.dart';

class Navbar2 extends StatefulWidget {
  @override
  _Navbar2State createState() => _Navbar2State();
}

class _Navbar2State extends State<Navbar2> {
  int _currentIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  List<Widget> listWidget = [
    HomeUmkm(
      0,
      60.0,
      d: 'null',
      title: 'umkm',
    ),
    dana2(),
    Account(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: listWidget.elementAt(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.blue,
        onTap: _onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.money),
            label: 'Dana',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'account',
          ),
        ],
      ),
    );
  }
}
