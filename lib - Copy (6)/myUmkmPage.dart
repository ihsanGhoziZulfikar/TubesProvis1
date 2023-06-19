import 'package:flutter/material.dart';
import 'ModelClass/umkmModel.dart';
import 'changePassPage.dart';
import 'home.dart';
import 'pengajuanpinjaman.dart';
import 'registerPage.dart';
import 'rolePage.dart';
import 'ubahdata_umkm.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'konfirmasi.dart';
import 'navbar.dart';
import 'ratingDialogue.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// class UmkmModel {
//   int id;
//   String nama;
//   String alamat;
//   int tahun;
//   String deskripsi;
//   String jenis;

//   UmkmModel({
//     required this.id,
//     required this.nama,
//     required this.alamat,
//     required this.tahun,
//     required this.deskripsi,
//     required this.jenis,
//   });

//   factory UmkmModel.fromJson(Map<String, dynamic> json) {
//     return UmkmModel(
//       id: json['id'] ?? '',
//       nama: json['nama'] ?? '',
//       alamat: json['alamat'] ?? '',
//       tahun: json['tahun'] ?? 0,
//       deskripsi: json['deskripsi'] ?? '',
//       jenis: json['jenis'] ?? '',
//     );
//   }
// }

// class UmkmCubit extends Cubit<UmkmModel> {
//   UmkmCubit()
//       : super(UmkmModel(
//           id: 0,
//           nama: "",
//           alamat: "",
//           tahun: 0,
//           deskripsi: "",
//           jenis: "",
//         ));

//   Future<UmkmModel> fetchData(id) async {
//     try {
//       String url = "http://127.0.0.1:8000/umkm/$id";
//       final response = await http.get(Uri.parse(url));
//       print("bb");
//       if (response.statusCode == 200) {
//         print(response);
//         final jsonData = jsonDecode(response.body);
//         final data = jsonData['data'] as Map<String, dynamic>;
//         final umkmModel = UmkmModel.fromJson(data);
//         emit(umkmModel);
//         return umkmModel;
//       } else {
//         throw Exception('Failed to load data');
//       }
//     } catch (e) {
//       print(e);
//       throw Exception('Failed to load data: $e');
//     }
//   }
// }

class MyUmkmPage extends StatelessWidget {
  final umkmCubit = UmkmCubit();
  int id_peminjam;
  int id_umkm;
  int id_dana;

  MyUmkmPage({
    super.key,
    required this.id_peminjam,
    required this.id_umkm,
    required this.id_dana,
  });
  final pageController = PageController();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<UmkmModel>(
        future: umkmCubit.fetchData(id_umkm),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            final umkm = snapshot.data;
            return SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  child: Container(
                    child: Column(
                      children: [
                        Text(
                          "UMKM Saya",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w800,
                            color: Color(0xff000000),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 200.0,
                          child: PageView.builder(
                            controller: pageController,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 19.0),
                                child: Container(
                                  width: 360.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFD6E4F0),
                                    borderRadius: BorderRadius.circular(10.0),
                                    image: const DecorationImage(
                                      image: NetworkImage(
                                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6FeM9xyfXso3joBifp3uVxFPXuxwDR3UH9A&usqp=CAU'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        SmoothPageIndicator(
                          controller: pageController,
                          count: 3,
                          effect: WormEffect(
                              activeDotColor: Color(0xFF669AD9),
                              dotColor: Color(0xFFD6E4F0),
                              dotHeight: 10.0,
                              dotWidth: 10.0),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 30),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Informasi UMKM',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    height: 1.265,
                                    color: Color(0xff000000),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    Text(
                                      'Nama UMKM      : ',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        height: 1.265,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                    Text(
                                      umkm!.nama,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        height: 1.265,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Alamat UMKM    : ',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        height: 1.265,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                    Text(
                                      umkm.alamat,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        height: 1.265,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Tahun Berdiri       : ',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        height: 1.265,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                    Text(
                                      umkm.tahun.toString(),
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        height: 1.265,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Kategori UMKM  : ',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        height: 1.265,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                    Text(
                                      umkm.jenis,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        height: 1.265,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Deskripsi UMKM : ',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        height: 1.265,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                    Flexible(
                                      child: Text(
                                        umkm.deskripsi,
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          height: 1.265,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 20),
                                  child: Divider(
                                    color: Colors.black,
                                    thickness: 0.5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return UbahDataUMKM(
                                    id_peminjam: id_peminjam,
                                    id_umkm: id_umkm,
                                    id_dana: id_dana,
                                  );
                                },
                              ),
                            );
                          },
                          child: Container(
                            width: 325,
                            height: 48,
                            decoration: BoxDecoration(
                              color: Color(0xfff9ff00),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Center(
                              child: Text(
                                'Ubah Data UMKM',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  height: 1.265,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ),
                          ),
                        ),
                        // GestureDetector(
                        //   onTap: () {
                        //     Navigator.of(context).push(
                        //       MaterialPageRoute(
                        //         builder: (context) {
                        //           return PengajuanPinjaman(
                        //             id_peminjam: id_peminjam,
                        //             id_umkm: id_umkm,
                        //             id_dana: id_dana,
                        //           );
                        //         },
                        //       ),
                        //     );
                        //   },
                        //   child: Container(
                        //     width: double.infinity,
                        //     padding: EdgeInsets.all(15),
                        //     margin: EdgeInsets.only(top: 5, bottom: 5),
                        //     decoration: BoxDecoration(
                        //       color: Color(0xff1C355E),
                        //       borderRadius:
                        //           BorderRadius.all(Radius.circular(10)),
                        //     ),
                        //     child: Center(
                        //       child: Text(
                        //         'Ajukan',
                        //         style: TextStyle(
                        //           color: Color.fromARGB(255, 255, 255, 255),
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
