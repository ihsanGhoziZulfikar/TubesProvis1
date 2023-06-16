import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

Future<void> postUmkm(
    String nama, String alamat, String deskripsi, String jenis) async {
  final url = 'http://127.0.0.1:8000/tambah_umkm/';

  final umkmData = {
    'id': 0,
    'nama': nama,
    'alamat': alamat,
    'deskripsi': deskripsi,
    'jenis': jenis
  };

  final response = await http.post(
    Uri.parse(url),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(umkmData),
  );

  if (response.statusCode == 201) {
    // Success
    final responseData = jsonDecode(response.body);
    print('New UMKM created with ID: ${responseData['id']}');
  } else {
    // Error
    print('Failed to create UMKM. Status code: ${response.statusCode}');
    print('Error message: ${response.body}');
  }
}

class UbahDataUMKM extends StatefulWidget {
  const UbahDataUMKM({Key? key}) : super(key: key);

  @override
  State<UbahDataUMKM> createState() => _UbahDataUMKMState();
}

class _UbahDataUMKMState extends State<UbahDataUMKM> {
  final namaController = TextEditingController();
  final alamatController = TextEditingController();
  final jenisController = TextEditingController();
  final deskripsiController = TextEditingController();
  String _nama = "";
  String _alamat = "";
  String _jenis = "";
  String _deskripsi = "";

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    namaController.dispose();
    alamatController.dispose();
    jenisController.dispose();
    deskripsiController.dispose();
    super.dispose();
  }

  String? pilihanKategori;
  List<String> items = [
    "Makanan",
    "Minuman",
    "Aksesoris",
    "Baju",
    "Tas",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Text(
                  "Ubah Data UMKM",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w800,
                    height: 1.3625,
                    color: Color(0xff000000),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          child: Text(
                            "Nama UMKM",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              height: 1.265,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            color: Color(0xffd6e4f0),
                            borderRadius: BorderRadius.all(Radius.circular(40)),
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
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          child: Text(
                            "Alamat UMKM",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              height: 1.265,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            color: Color(0xffd6e4f0),
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                          ),
                          child: TextField(
                            controller: alamatController,
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10),
                              border: InputBorder.none,
                              hintText: 'Enter your text',
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          child: Text(
                            "Tahun Berdiri",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              height: 1.265,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            color: Color(0xffd6e4f0),
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10),
                              border: InputBorder.none,
                              hintText: 'Enter your text',
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          child: Text(
                            "Kategori UMKM",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              height: 1.265,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            color: Color(0xffd6e4f0),
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: DropdownButton<String>(
                              value: pilihanKategori,
                              onChanged: (String? kategori) {
                                setState(() {
                                  pilihanKategori = kategori;
                                });
                              },
                              items: items.map((String kategori) {
                                return DropdownMenuItem<String>(
                                  value: kategori,
                                  child: Text(kategori),
                                );
                              }).toList(),
                              underline: Container(), // Menghilangkan border
                              isExpanded: true, // Mengisi ruang kontainer
                              hint: Text('Choose Category'),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          child: Text(
                            "Deskripsi UMKM",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              height: 1.265,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                        Container(
                          height: 150,
                          margin: EdgeInsets.symmetric(vertical: 10),
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            color: Color(0xffd6e4f0),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: TextField(
                            controller: deskripsiController,
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10),
                              border: InputBorder.none,
                              hintText: 'Enter your text',
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          child: Text(
                            "List Foto",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              height: 1.265,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Container(
                              width: 40,
                              height: 30,
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(5),
                              margin: EdgeInsets.only(right: 5, left: 20),
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 234, 232, 232)),
                              child: Text(
                                "foto",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Container(
                              width: 40,
                              height: 30,
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(5),
                              margin: EdgeInsets.only(right: 5),
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 234, 232, 232)),
                              child: Text(
                                "foto",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Container(
                              width: 40,
                              height: 30,
                              margin: EdgeInsets.only(right: 5),
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 234, 232, 232)),
                              child: Icon(Icons.add),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _nama = namaController
                                  .text; //akses text via controller
                              _alamat = alamatController
                                  .text; //akses text via controller
                              _deskripsi = deskripsiController
                                  .text; //akses text via controller
                            }); //refresh
                            postUmkm(_nama, _alamat, _deskripsi,
                                pilihanKategori as String);
                          },
                          child: Container(
                            width: double.infinity,
                            margin: EdgeInsets.symmetric(vertical: 10),
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            decoration: BoxDecoration(
                              color: Color(0xff1c355e),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40)),
                            ),
                            child: Center(
                              child: Text(
                                'Halo $_nama',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  height: 1.265,
                                  color: Color(0xffffffff),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
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
