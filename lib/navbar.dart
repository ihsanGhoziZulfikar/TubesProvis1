import 'package:flutter/material.dart';
import 'package:login_page/Aktivitasscreen.dart';
import 'package:login_page/account.dart';
import 'package:login_page/home.dart';
import 'package:login_page/syaratdanketentuan_akun.dart';
import 'package:login_page/umkm.dart';

import 'dana2.dart';

class Navbar extends StatefulWidget {
  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _currentIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  List<Widget> listWidget = [
    Home(title: 'title'),
    Umkm(title: 'title'),
    dana2(),
    AktivitasScreen(),
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
            icon: Icon(Icons.search),
            label: 'UMKM',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.money),
            label: 'Dana',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Activity',
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
