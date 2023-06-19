import 'package:android/myAccountPage.dart';
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
  final int id_peminjam;
  final int id_umkm;
  final int id_dana;
  final String role;
  final int initialIndex;

  const Navbar2({
    Key? key,
    required this.id_peminjam,
    required this.id_umkm,
    required this.id_dana,
    this.role = "",
    this.initialIndex = 0,
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

    _currentIndex = widget.initialIndex;

    listWidget = [
      HomeUmkm(
        id_peminjam: widget.id_peminjam,
        id_umkm: widget
            .id_umkm, // Access the id_umkm from the widget using widget.id_umkm
        id_dana: widget.id_dana,
      ),
      dana2(
        id_peminjam: widget.id_peminjam,
        id_umkm: widget
            .id_umkm, // Access the id_umkm from the widget using widget.id_umkm
        id_dana: widget.id_dana,
      ),
      Account(
        id: widget.id_peminjam,
        id_umkm: widget.id_umkm,
        id_dana: widget.id_dana,
        role: "peminjam",
      ),
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
