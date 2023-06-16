import 'package:flutter/material.dart';
import 'activityInvestor.dart';
import 'account.dart';
import 'changePassPage.dart';
import 'dana3.dart';
import 'home.dart';
import 'myUmkmPage.dart';
import 'syaratdanketentuan_akun.dart';
import 'umkm.dart';
import 'umkmVisitorPage.dart';

import 'dana2.dart';
import 'homeUmkm.dart';

class Navbar2 extends StatefulWidget {
  final int id;
  final int id_umkm;

  const Navbar2({
    Key? key,
    required this.id,
    required this.id_umkm,
  }) : super(key: key);

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

  List<Widget> listWidget = [];

  @override
  void initState() {
    super.initState();

    listWidget = [
      HomeUmkm(
        widget
            .id_umkm, // Access the id_umkm from the widget using widget.id_umkm
        60.0,
        d: 'null',
        title: 'umkm',
      ),
      dana2(),
      Account(id: 1),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: listWidget.elementAt(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: _currentIndex == 1 ? Color(0xFFD6E4F0) : Colors.white,
        selectedItemColor: Color(0xFF669AD9),
        unselectedItemColor: Color(0xFF1C355E),
        onTap: _onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.monetization_on_rounded),
            label: 'Dana',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Akun',
          ),
        ],
      ),
    );
  }
}
