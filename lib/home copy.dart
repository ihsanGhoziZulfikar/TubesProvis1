import 'package:android/activityUmkm.dart';
import 'package:android/notifikasiInvestor.dart';
import 'package:flutter/material.dart';
import 'profil_umkm.dart';
import 'umkmDetailPage.dart';
import 'umkmProfile.dart';

import 'data_watchlist.dart';
import 'konfirmasi.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';

class UmkmModel {
  int id;
  String nama;
  String alamat;
  String deskripsi;
  String jenis;

  UmkmModel({
    required this.id,
    required this.nama,
    required this.alamat,
    required this.deskripsi,
    required this.jenis,
  });

  factory UmkmModel.fromJson(Map<String, dynamic> json) {
    return UmkmModel(
      id: json['id'] ?? '',
      nama: json['nama'] ?? '',
      alamat: json['alamat'] ?? '',
      deskripsi: json['deskripsi'] ?? '',
      jenis: json['jenis'] ?? '',
    );
  }
}

class UmkmCubit extends Cubit<List<UmkmModel>> {
  String url = "http://127.0.0.1:8000/tampilkan_semua_umkm/";

  UmkmCubit() : super([]);

  Future<List<UmkmModel>> fetchData() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final dataList = jsonData['data'] as List<dynamic>;
        final umkmList = dataList
            .map((item) => UmkmModel.fromJson(item as Map<String, dynamic>))
            .toList();
        print(dataList);
        emit(umkmList);
        return umkmList;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print("aaa");
      throw Exception('Failed to load data: $e');
    }
  }
}

class Home extends StatefulWidget {
  const Home({super.key, required this.title});

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final umkmCubit = UmkmCubit();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    width: 80,
                    height: 80,
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(
                    left: 20.0, right: 20.0, top: 25.0, bottom: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                            'https://cdn-icons-png.flaticon.com/512/4086/4086679.png',
                          ),
                        ),
                        SizedBox(width: 10.0),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Selamat datang, ',
                                style: TextStyle(
                                    fontSize: 15.0, color: Colors.black),
                              ),
                              TextSpan(
                                  text: "Maulana",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0,
                                    color: Colors.black,
                                  )),
                              WidgetSpan(
                                child: Text(
                                  '! 👋',
                                  style: TextStyle(fontSize: 15.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return NotifikasiInvestor();
                            },
                          ),
                        );
                      },
                      child: Icon(
                        Icons.notifications,
                        size: 35,
                        color: Color(0xFF1C355E),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 16.0, top: 10.0, bottom: 12.0),
                width: 360.0,
                decoration: BoxDecoration(
                  color: Color(0xFFD6E4F0),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Dana yang tersedia :",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Row(
                      children: [Text("Rp 5.000.000")],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Container(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Rekomendasi Usaha Mitra Hari Ini',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Container(
                      height: 250.0,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: EdgeInsets.only(right: 16.0),
                            width: 150.0,
                            child: Column(
                              children: [
                                Container(
                                  height: 120.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20.0),
                                      topRight: Radius.circular(20.0),
                                    ),
                                    image: const DecorationImage(
                                      image: NetworkImage(
                                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQM_FtZK4TZilSzN8leRpCWY9wWpaIpoR-sOA&usqp=CAU'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color(0xFF1C355E),
                                      width: 0.1,
                                    ),
                                    color: Colors.transparent,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: 8, bottom: 8, left: 9.0, right: 9),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 2.8),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Ibu Ira",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Container(
                                                child: Row(children: [
                                                  Icon(
                                                    Icons.star,
                                                    size: 15.0,
                                                    color: Colors.amber,
                                                  ),
                                                  Text('5'),
                                                ]),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 2.8),
                                          child: Row(
                                            children: [
                                              Text('Properti'),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 2.8),
                                          child: Row(
                                            children: [
                                              Text('Rp150.000.000'),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 150,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(20.0),
                                      bottomRight: Radius.circular(20.0),
                                    ),
                                    color: Color(0xFF1C355E),
                                  ),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return UmkmDetailPage();
                                          },
                                        ),
                                      );
                                      // Aksi buat ngasih pinjaman
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: Color(0xFF669AD9),
                                      padding: EdgeInsets.zero,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(20.0),
                                          bottomRight: Radius.circular(20.0),
                                        ),
                                      ),
                                    ),
                                    child: Container(
                                      width: double.infinity,
                                      child: Text(
                                        'Beri Pinjaman',
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 16.0),
                    child: const Text(
                      'Usaha Mitra Yang Didanai',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                width: 360,
                decoration: BoxDecoration(
                  color: Color(0xFFD6E4F0),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: FutureBuilder<List<UmkmModel>>(
                  future: umkmCubit.fetchData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      final umkmList = snapshot.data;
                      return Container(
                        height: 500,
                        child: ListView.builder(
                          itemCount: umkmList?.length,
                          itemBuilder: (context, index) {
                            if (umkmList![0].nama != "") {
                              return Column(
                                children: [
                                  DataWatchlist(
                                    id: umkmList[index].id,
                                    img:
                                        'https://swamediainc.storage.googleapis.com/swa.co.id/wp-content/uploads/2021/01/20122139/daging-sapi.jpg',
                                    nama: umkmList[index].nama,
                                    alamat: umkmList[index].alamat,
                                    deskripsi: umkmList[index].deskripsi,
                                    jenis: umkmList[index].jenis,
                                  ),
                                  SizedBox(height: 16),
                                ],
                              );
                            }
                          },
                        ),
                      );
                    }
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
