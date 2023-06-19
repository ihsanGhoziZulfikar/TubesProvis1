import 'package:flutter/material.dart';
import 'loginPage.dart';

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
      // home: UmkmProfile(),
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
