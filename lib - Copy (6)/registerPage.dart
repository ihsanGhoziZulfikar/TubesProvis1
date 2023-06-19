import 'package:flutter/material.dart';
import 'addDataPage.dart';
import 'loginPage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<int> createUmkm() async {
  final url = 'http://127.0.0.1:8000/tambah_umkm/';

  final umkmData = {
    'id': 0,
    'nama': "string",
    'alamat': "string",
    'tahun': 0,
    'deskripsi': "string",
    'jenis': "Makanan",
    'status': "Belum",
  };

  final response = await http.post(
    Uri.parse(url),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(umkmData),
  );

  if (response.statusCode == 201) {
    final responseData = jsonDecode(response.body);
    final umkmId = responseData['id'] as int;
    print('New UMKM created with ID: $umkmId');
    return umkmId;
  } else {
    print('Failed to create UMKM. Status code: ${response.statusCode}');
    throw Exception('Failed to create UMKM');
  }
}

Future<int> createDana() async {
  final url = 'http://127.0.0.1:8000/tambah_dana/';

  final umkmData = {
    'id': 0,
    'saldo': 0,
  };

  final response = await http.post(
    Uri.parse(url),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(umkmData),
  );

  if (response.statusCode == 201) {
    final responseData = jsonDecode(response.body);
    final danaId = responseData['id'] as int;
    print('New DANA created with ID: $danaId');
    return danaId;
  } else {
    print('Failed to create DANA. Status code: ${response.statusCode}');
    throw Exception('Failed to create UMKM');
  }
}

Future<void> registerPeminjam(
    String nama, String email, String kata_sandi, String telepon) async {
  int id_umkm = await createUmkm();
  int id_dana = await createDana();

  final url = 'http://127.0.0.1:8000/tambah_peminjam/';

  final investorData = {
    'id': 0,
    'id_dana': id_dana,
    'id_umkm': id_umkm,
    'nama': nama,
    'email': email,
    'password': kata_sandi,
    'phone': telepon,
    'tempat': "string",
    'tanggal': "string",
    'gender': "string",
    'alamat': "string",
    'provinsi': "string",
    'kabupaten': "string",
    'pekerjaan': "string",
    'kodepos': 0,
    'norek': "string",
    'pendapatan': 0,
    'ktp': "string",
    'selfie': "string",
    'npwp': "string"
  };

  final response = await http.post(
    Uri.parse(url),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(investorData),
  );

  if (response.statusCode == 201) {
    // Success
    final responseData = jsonDecode(response.body);
    print('New PEMINJAM created with ID: ${responseData['id']}');
  } else {
    // Error
    print('Failed to create PEMINJAM. Status code: ${response.statusCode}');
    print('Error message: ${response.body}');
  }
}

Future<void> registerInvestor(
    String nama, String email, String kata_sandi, String telepon) async {
  int id_dana = await createDana();

  final url = 'http://127.0.0.1:8000/tambah_investor/';

  final investorData = {
    'id': 0,
    'id_dana': id_dana,
    'nama': nama,
    'email': email,
    'password': kata_sandi,
    'phone': telepon,
    'tempat': "string",
    'tanggal': "string",
    'gender': "string",
    'alamat': "string",
    'provinsi': "string",
    'kabupaten': "string",
    'pekerjaan': "string",
    'kodepos': 0,
    'norek': "string",
    'sumber_dana': "string",
    'ktp': "string",
    'selfie': "string",
  };

  final response = await http.post(
    Uri.parse(url),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(investorData),
  );

  if (response.statusCode == 201) {
    // Success
    final responseData = jsonDecode(response.body);
    print('New INVESTOR created with ID: ${responseData['id']}');
  } else {
    // Error
    print('Failed to create INVESTOR. Status code: ${response.statusCode}');
    print('Error message: ${response.body}');
  }
}

class RegisterPage extends StatefulWidget {
  String role;
  RegisterPage({
    super.key,
    required this.role,
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var namaController = TextEditingController();
  var emailController = TextEditingController();
  var kata_sandiController = TextEditingController();
  var teleponController = TextEditingController();
  String _nama = "";
  String _email = "";
  String _kata_sandi = "";
  String _telepon = "";

  @override
  void initState() {
    super.initState();
    namaController = TextEditingController();
    emailController = TextEditingController();
    kata_sandiController = TextEditingController();
    teleponController = TextEditingController();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    namaController.dispose();
    emailController.dispose();
    kata_sandiController.dispose();
    teleponController.dispose();
    super.dispose();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(20),
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
                            'Daftar Akun',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Nama'),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: TextField(
                          controller: namaController,
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10),
                            border: InputBorder.none,
                            hintText: 'Enter your text',
                          ),
                        ),
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
                          controller: kata_sandiController,
                          obscureText: true,
                          enableSuggestions: false,
                          autocorrect: false,
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10),
                            border: InputBorder.none,
                            hintText: 'Enter your text',
                          ),
                        ),
                      ),
                      Text('Nomor Telepon'),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Row(
                          children: [
                            Flexible(
                              child: TextField(
                                controller: teleponController,
                                decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 10),
                                  border: InputBorder.none,
                                  hintText: 'Enter your text',
                                ),
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 2,
                                  height: 25,
                                  decoration: BoxDecoration(),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 20),
                                  width: 40,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color.fromRGBO(0, 0, 0, 0.247),
                                        offset: Offset(0, 2),
                                        blurRadius: 1,
                                      ),
                                    ],
                                  ),
                                  child: Align(
                                    alignment: Alignment.topCenter,
                                    child: SizedBox(
                                      width: 40,
                                      height: 15,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Color(0xffff0707),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _nama =
                                namaController.text; //akses text via controller
                            _email = emailController
                                .text; //akses text via controller
                            _kata_sandi = kata_sandiController
                                .text; //akses text via controller
                            _telepon = teleponController
                                .text; //akses text via controller
                          }); //refresh
                          if (widget.role == "investor") {
                            registerInvestor(
                                _nama, _email, _kata_sandi, _telepon);
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return AddDataPage();
                                },
                              ),
                            );
                          } else if (widget.role == "peminjam") {
                            registerPeminjam(
                                _nama, _email, _kata_sandi, _telepon);
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return AddDataPage();
                                },
                              ),
                            );
                          }
                        },
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(15),
                          margin: EdgeInsets.only(top: 5, bottom: 5),
                          decoration: BoxDecoration(
                            color: Color(0xff1C355E),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
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
                  margin: EdgeInsets.all(10),
                  child: Text(
                    'atau daftar dengan',
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
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
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
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
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
                          return LoginPage();
                        },
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          height: 1,
                          color: Color.fromRGBO(0, 0, 0, 1),
                        ),
                        children: [
                          TextSpan(
                            text: 'Sudah Memiliki Akun? ',
                          ),
                          TextSpan(
                            text: 'masuk',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              color: Color.fromRGBO(0, 0, 0, 1),
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
    );
  }
}
