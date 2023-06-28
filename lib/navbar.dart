// import 'package:flutter/material.dart';
// import 'Aktivitasscreen.dart';
// import 'account.dart';
// import 'changePassPage.dart';
// import 'dana3.dart';
// import 'home.dart';
// import 'myUmkmPage.dart';
// import 'syaratdanketentuan_akun.dart';
// import 'umkm.dart';
// import 'umkmVisitorPage.dart';

// import 'dana2.dart';

// class Navbar extends StatefulWidget {
//   @override
//   _NavbarState createState() => _NavbarState();
// }

// class _NavbarState extends State<Navbar> {
//   int _currentIndex = 0;

//   void _onTabTapped(int index) {
//     setState(() {
//       _currentIndex = index;
//     });
//   }

//   List<Widget> listWidget = [
//     Home(title: 'title'),
//     Umkm(title: 'title'),
//     Dana3(),
//     AktivitasScreen(),
//     Account(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: listWidget.elementAt(_currentIndex),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _currentIndex,
//         backgroundColor: _currentIndex == 2 ? Color(0xFFD6E4F0) : Colors.white,
//         selectedItemColor: Color(0xFF669AD9),
//         unselectedItemColor: Color(0xFF1C355E),
//         onTap: _onTabTapped,
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Beranda',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.search),
//             label: 'UMKM',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.monetization_on_rounded),
//             label: 'Dana',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.favorite),
//             label: 'Aktifitas',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'Akun',
//           ),
//         ],
//       ),
//     );
//   }
// }

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

class Navbar extends StatefulWidget {
  final int id_investor;
  final int id_dana;

  const Navbar({
    Key? key,
    required this.id_investor,
    required this.id_dana,
  }) : super(key: key);
  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _currentIndex = 0;

  List<Widget> listWidget = [];

  @override
  void initState() {
    super.initState();

    listWidget = [
      Home(
        id_investor: widget.id_investor,
        id_dana: widget.id_dana,
      ),
      Umkm(
        id_investor: widget.id_investor,
        id_dana: widget.id_dana,
      ),
      Dana3(
        id_investor: widget.id_investor,
        id_dana: widget.id_dana,
      ),
      ActivityInvestor(
        id_investor: widget.id_investor,
        id_dana: widget.id_dana,
      ),
      Account(
        id: widget.id_investor,
        id_umkm: 0,
        id_dana: widget.id_dana,
        role: "investor",
      ),
    ];
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  // List<Widget> listWidget = [
  //   Home(title: 'title'),
  //   Umkm(title: 'title'),
  //   Dana3(),
  //   ActivityInvestor(),
  //   Account(),
  // ];

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
            icon: Icon(Icons.search),
            label: 'UMKM',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.monetization_on_rounded),
            label: 'Dana',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Aktifitas',
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
