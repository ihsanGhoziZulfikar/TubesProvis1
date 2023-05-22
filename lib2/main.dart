import 'package:flutter/material.dart';
import 'package:login_page/Aktivitasscreen.dart';
import 'package:login_page/Tarik-dana-investor.dart';
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
      home: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: LoginPage(),
            // child: RegisterPage(),
            // child: RolePage(),
            // child: AddDataPage(),
            // child: UmkmDetailPage(),
            // child: Umkm(title: 'biznet'),
            // child: Home(title: 'biznet'),
            // child: AktivitasScreen(),
            // child: SyaratdanKetentuan(),
            // child: Tarikdana(),
          ),
        ),
      ),
    );
  }
}
