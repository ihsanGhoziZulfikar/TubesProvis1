import 'package:flutter/material.dart';
import 'package:login_page/Aktivitasscreen.dart';
import 'package:login_page/KontakKami_Akun.dart';
import 'package:login_page/Tarik-dana-investor.dart';
import 'package:login_page/bayarpinjaman.dart';
import 'package:login_page/dana1.dart';
import 'package:login_page/dana2.dart';
import 'package:login_page/syaratdanketentuan_akun.dart';
import 'home.dart';
import 'loginPage.dart';
import 'registerPage.dart';
import 'rolePage.dart';
import 'addDataPage.dart';
import 'umkmDetailPage.dart';
import 'umkm.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
      // body: RegisterPage(),
      // body: RolePage(),
      // body: AddDataPage(),
      // body: UmkmDetailPage(),
      // body: Umkm(title: 'biznet'),
      // body: Home(title: 'biznet'),
      // body: AktivitasScreen(),
      // body: SyaratdanKetentuan(),
      // body: Tarikdana(),
      // body: dana1(),
      // body: dana2(),
      // body: bayarpinjaman(),
      // body: Kontakkami(),
    );
  }
}
