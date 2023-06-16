import 'package:flutter/material.dart';
import 'home.dart';
import 'registerPage.dart';
import 'rolePage.dart';

import 'navbar.dart';
import 'navbar2.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PeminjamModel {
  int id;
  int id_umkm;
  String nama;
  String email;
  String password;

  PeminjamModel({
    required this.id,
    required this.id_umkm,
    required this.nama,
    required this.email,
    required this.password,
  });

  factory PeminjamModel.fromJson(Map<String, dynamic> json) {
    return PeminjamModel(
      id: json['id'] ?? '',
      id_umkm: json['id_umkm'] ?? '',
      nama: json['nama'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
    );
  }
}

class PeminjamCubit extends Cubit<PeminjamModel> {
  PeminjamCubit()
      : super(PeminjamModel(
          id: 0,
          id_umkm: 0,
          nama: "",
          email: "",
          password: "",
        ));

  Future<PeminjamModel?> fetchData(email, password) async {
    try {
      if (email == "" || password == "") {
        return null;
      }
      String url = "http://127.0.0.1:8000/peminjam/$email/$password";
      final response = await http.get(Uri.parse(url));
      print("hjksdhajkhj jkl");
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        if (jsonData.containsKey("data")) {
          final data = jsonData['data'] as Map<String, dynamic>;
          final peminjamModel = PeminjamModel.fromJson(data);
          return peminjamModel;
        } else {
          return null;
        }
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print(e);
      throw Exception('Failed to load data: $e');
    }
  }
}

class InvestorModel {
  int id;
  String nama;
  String email;
  String password;

  InvestorModel({
    required this.id,
    required this.nama,
    required this.email,
    required this.password,
  });

  factory InvestorModel.fromJson(Map<String, dynamic> json) {
    return InvestorModel(
      id: json['id'] ?? '',
      nama: json['nama'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
    );
  }
}

class InvestorCubit extends Cubit<InvestorModel> {
  InvestorCubit()
      : super(InvestorModel(
          id: 0,
          nama: "",
          email: "",
          password: "",
        ));

  Future<InvestorModel?> fetchData2(email, password) async {
    try {
      if (email == "" || password == "") {
        return null;
      }
      print("hjksdhajkhj jkl 1");
      String url = "http://127.0.0.1:8000/investor/$email/$password";
      final response = await http.get(Uri.parse(url));
      print("hjksdhajkhj jkl 2");
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        if (jsonData.containsKey("data")) {
          final data = jsonData['data'] as Map<String, dynamic>;
          final peminjamModel = InvestorModel.fromJson(data);
          return peminjamModel;
        } else {
          return null;
        }
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print(e);
      throw Exception('Failed to load data: $e');
    }
  }
}

class aktivitasUmkm {
  String date;
  String jenis;
  String time;
  String logo;
  aktivitasUmkm({
    required this.date,
    required this.jenis,
    required this.time,
    required this.logo,
  });
}

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final peminjamCubit = PeminjamCubit();
  final investorCubit = InvestorCubit();

  var emailController = TextEditingController();
  var passController = TextEditingController();
  String _email = "-";
  String _pass = "-";

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passController = TextEditingController();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(30),
                    child: Image.asset(
                      'assets/images/logo.png',
                      width: 100,
                      height: 100,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(30),
                    margin: EdgeInsets.only(right: 50, left: 50),
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 102, 154, 217),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40),
                        bottomLeft: Radius.circular(40),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Masuk',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text('Email'),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: TextField(
                            controller: emailController,
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10),
                              border: InputBorder.none,
                              hintText: 'Enter your text',
                            ),
                          ),
                        ),
                        Text('Kata Sandi'),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: TextField(
                            controller: passController,
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10),
                              border: InputBorder.none,
                              hintText: 'Enter your text',
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('Lupa Kata Sandi? '),
                            Text(
                              'Klik disini',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        GestureDetector(
                          onTap: () async {
                            setState(() {
                              _email = emailController
                                  .text; //akses text via controller
                              _pass = passController.text;
                            }); //refresh
                            var peminjam =
                                await peminjamCubit.fetchData(_email, _pass);
                            if (peminjam != null) {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return Navbar2(
                                      id: peminjam.id,
                                      id_umkm: peminjam.id_umkm,
                                    );
                                  },
                                ),
                              );
                            } else {
                              var investor =
                                  await investorCubit.fetchData2(_email, _pass);
                              if (investor != null) {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return Navbar(id: investor.id);
                                    },
                                  ),
                                );
                              }
                            }
                            // postUmkm(widget.id, _nama, _email, _tahun,
                            //     _password, pilihanKategori as String);
                          },
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(15),
                            margin: EdgeInsets.only(top: 5, bottom: 5),
                            decoration: BoxDecoration(
                              color: Color(0xff1C355E),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Center(
                              child: Text(
                                'Kirim',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    child: Text(
                      'atau masuk dengan',
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          color: Color.fromARGB(255, 151, 151, 151)),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.all(20),
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(214, 228, 240, 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text(
                              'G',
                              style: TextStyle(
                                fontSize: 27,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(20),
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(214, 228, 240, 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text(
                              'f',
                              style: TextStyle(
                                fontSize: 27,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return RolePage();
                          },
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.all(20),
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(0, 0, 0, 1),
                          ),
                          children: [
                            TextSpan(
                              text: 'Tidak memiliki akun? ',
                            ),
                            TextSpan(
                              text: 'daftar sekarang',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                                color: Color(0xff000000),
                              ),
                            ),
                          ],
                        ),
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
