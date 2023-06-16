import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:convert';

Future<void> postUmkm(int id, String nama, String alamat, int tahun,
    String deskripsi, String jenis) async {
  final url = 'http://127.0.0.1:8000/update_umkm_patch/$id';

  final umkmData = {
    'id': 0,
    'nama': nama,
    'alamat': alamat,
    'tahun': tahun,
    'deskripsi': deskripsi,
    'jenis': jenis
  };

  final response = await http.patch(
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
  final int id;
  final String img;
  final String nama;
  final String alamat;
  final int tahun;
  final String deskripsi;
  final String jenis;

  const UbahDataUMKM({
    Key? key,
    required this.id,
    required this.img,
    required this.nama,
    required this.alamat,
    required this.tahun,
    required this.deskripsi,
    required this.jenis,
  }) : super(key: key);

  @override
  State<UbahDataUMKM> createState() => _UbahDataUMKMState();
}

class _UbahDataUMKMState extends State<UbahDataUMKM> {
  var namaController = TextEditingController();
  var alamatController = TextEditingController();
  var tahunController = TextEditingController();
  var deskripsiController = TextEditingController();
  String _nama = "";
  String _alamat = "";
  int _tahun = 0;
  String _deskripsi = "";

  String? pilihanKategori;
  List<String> items = [
    "Makanan",
    "Minuman",
    "Aksesoris",
    "Baju",
    "Tas",
  ];

  @override
  void initState() {
    super.initState();
    namaController = TextEditingController(text: widget.nama);
    alamatController = TextEditingController(text: widget.alamat);
    tahunController = TextEditingController(text: widget.tahun.toString());
    deskripsiController = TextEditingController(text: widget.deskripsi);
    pilihanKategori = widget.jenis;
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    namaController.dispose();
    alamatController.dispose();
    deskripsiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
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
                            margin: EdgeInsets.only(left: 15),
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
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            decoration: BoxDecoration(
                              color: Color(0xffd6e4f0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40)),
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
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 15),
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
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            decoration: BoxDecoration(
                              color: Color(0xffd6e4f0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40)),
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
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 15),
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
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            decoration: BoxDecoration(
                              color: Color(0xffd6e4f0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40)),
                            ),
                            child: TextField(
                              controller: tahunController,
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 10),
                                border: InputBorder.none,
                                hintText: 'Enter your text',
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 15),
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40)),
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
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 15),
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
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            decoration: BoxDecoration(
                              color: Color(0xffd6e4f0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                            child: TextField(
                              controller: deskripsiController,
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 5),
                                border: InputBorder.none,
                                hintText: 'Enter your text',
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 15),
                            child: Text(
                              "Daftar Foto",
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
                            height: 40,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _nama = namaController
                                    .text; //akses text via controller
                                _alamat = alamatController
                                    .text; //akses text via controller
                                _deskripsi = deskripsiController
                                    .text; //akses text via controller
                                _tahun = int.tryParse(tahunController.text) ??
                                    0; //akses text via controller
                              }); //refresh
                              postUmkm(widget.id, _nama, _alamat, _tahun,
                                  _deskripsi, pilihanKategori as String);
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
                                  'Ubah Data',
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
                          SizedBox(
                            height: 30,
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
      ),
    );
  }
}
