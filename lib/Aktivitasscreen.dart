import 'package:flutter/material.dart';

class AktivitasScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(14, 0, 0, 34),
                child: Text(
                  'Aktivitas',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    height: 2,
                    color: Color(0xff000000),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10, 0, 10, 240),
                padding: EdgeInsets.fromLTRB(10, 19, 10, 58),
                // width: 500,
                // height: 440,
                decoration: BoxDecoration(
                  color: Color(0xff669ad9),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(7, 0, 14, 21),
                      width: double.infinity,
                      height: 88,
                      decoration: BoxDecoration(
                        color: Color(0xffd2e2ef),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Text(
                          'Mitra UMKM Saya',
                          style: TextStyle(
                            fontSize: 21.2103633881,
                            fontWeight: FontWeight.w500,
                            height: 1.4285713772,
                            color: Color(0xff000000),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(3, 0, 5, 23),
                      width: double.infinity,
                      height: 31,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 102, 154, 217),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40),
                          bottomLeft: Radius.circular(40),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 110,
                            height: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              children: [
                                Align(
                                  child: SizedBox(
                                    width: 70,
                                    height: 31,
                                    child: Text(
                                      'Mitra UMKM',
                                      style: TextStyle(
                                        fontSize: 11.2103633881,
                                        fontWeight: FontWeight.w500,
                                        height: 2.7029023937,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 110,
                            height: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Stack(
                              children: [
                                Align(
                                  child: SizedBox(
                                    width: 87,
                                    height: 31,
                                    child: Text(
                                      'Sisa Pembayaran',
                                      style: TextStyle(
                                        fontSize: 11.2103633881,
                                        fontWeight: FontWeight.w500,
                                        height: 2.7029023937,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 110,
                            height: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Stack(
                              children: [
                                Align(
                                  child: SizedBox(
                                    width: 91,
                                    height: 31,
                                    child: Text(
                                      'Total Peminjaman',
                                      style: TextStyle(
                                        fontSize: 11.2103633881,
                                        fontWeight: FontWeight.w500,
                                        height: 2.7029023937,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 29),
                      padding: EdgeInsets.fromLTRB(16, 6, 16, 4),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xffd9d9d9),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Yusuf Bakery',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              height: 2.7545925487,
                              color: Color(0xff000000),
                            ),
                          ),
                          SizedBox(
                            width: 67,
                          ),
                          Text(
                            'Rp. 3,500,000',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              height: 2.7545925487,
                              color: Color(0xff000000),
                            ),
                          ),
                          SizedBox(
                            width: 67,
                          ),
                          Text(
                            'Rp. 5,000,000',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              height: 2.7545925487,
                              color: Color(0xff000000),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // autogroupsf8zjn6 (Rcw5hhmmzmQnMcxKA5SF8z)
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 27),
                      padding: EdgeInsets.fromLTRB(16, 6, 16, 4),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xffd9d9d9),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 36, 0),
                            child: Text(
                              'Cendol Ihsan Seger',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                height: 2.7545925487,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 67, 0),
                            child: Text(
                              'Rp. 1,000,000',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                height: 2.7545925487,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                          Text(
                            'Rp. 4,000,000',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              height: 2.7545925487,
                              color: Color(0xff000000),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(16, 6, 16, 4),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xffd9d9d9),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Dodol Vivin',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              height: 2.7545925487,
                              color: Color(0xff000000),
                            ),
                          ),
                          SizedBox(
                            width: 76,
                          ),
                          Text(
                            'Rp. 500,000',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              height: 2.7545925487,
                              color: Color(0xff000000),
                            ),
                          ),
                          SizedBox(
                            width: 76,
                          ),
                          Text(
                            'Rp. 2,000,000',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              height: 2.7545925487,
                              color: Color(0xff000000),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
//     return Container(
//       child: Column(
//         children: [
//           Container(
//             padding: EdgeInsets.all(30),
//             child: Image.asset(
//               '../assets/images/logo.png',
//               width: 100,
//               height: 100,
//             ),
//           ),
//           Container(
//             padding: EdgeInsets.all(50),
//             margin: EdgeInsets.only(right: 50, left: 50),
//             decoration: const BoxDecoration(
//               color: Color.fromARGB(255, 102, 154, 217),
//               borderRadius: BorderRadius.only(
//                 topRight: Radius.circular(40),
//                 bottomLeft: Radius.circular(40),
//               ),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       'Masuk',
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.w700,
//                         color: Color.fromRGBO(0, 0, 0, 1),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 30,
//                 ),
//                 Text('Email'),
//                 Container(
//                   margin: EdgeInsets.symmetric(vertical: 5),
//                   decoration: BoxDecoration(
//                     color: Color.fromARGB(255, 255, 255, 255),
//                     borderRadius: BorderRadius.all(Radius.circular(10)),
//                   ),
//                   child: TextField(
//                     decoration: InputDecoration(
//                       contentPadding: EdgeInsets.symmetric(horizontal: 10),
//                       border: InputBorder.none,
//                       hintText: 'Enter your text',
//                     ),
//                   ),
//                 ),
//                 Text('Kata Sandi'),
//                 Container(
//                   margin: EdgeInsets.symmetric(vertical: 5),
//                   decoration: BoxDecoration(
//                     color: Color.fromARGB(255, 255, 255, 255),
//                     borderRadius: BorderRadius.all(Radius.circular(10)),
//                   ),
//                   child: TextField(
//                     decoration: InputDecoration(
//                       contentPadding: EdgeInsets.symmetric(horizontal: 10),
//                       border: InputBorder.none,
//                       hintText: 'Enter your text',
//                     ),
//                   ),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     Text('Lupa Kata Sandi? '),
//                     Text(
//                       'Klik disini',
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 50,
//                 ),
//                 Container(
//                   width: double.infinity,
//                   padding: EdgeInsets.all(15),
//                   margin: EdgeInsets.only(top: 5, bottom: 5),
//                   decoration: BoxDecoration(
//                     color: Color.fromARGB(255, 0, 30, 255),
//                     borderRadius: BorderRadius.all(Radius.circular(10)),
//                   ),
//                   child: Center(
//                     child: Text(
//                       'Kirim',
//                       style: TextStyle(
//                         color: Color.fromARGB(255, 255, 255, 255),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             margin: EdgeInsets.all(20),
//             child: Text(
//               'atau masuk dengan',
//               style: TextStyle(
//                   fontSize: 10,
//                   fontWeight: FontWeight.w700,
//                   color: Color.fromARGB(255, 151, 151, 151)),
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 margin: EdgeInsets.all(20),
//                 padding: EdgeInsets.all(15),
//                 decoration: BoxDecoration(
//                   color: Color.fromRGBO(214, 228, 240, 1),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Container(
//                   width: 50,
//                   height: 50,
//                   decoration: BoxDecoration(
//                     color: Color.fromRGBO(255, 255, 255, 1),
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: Center(
//                     child: Text(
//                       'G',
//                       style: TextStyle(
//                         fontSize: 27,
//                         fontWeight: FontWeight.w600,
//                         color: Color.fromRGBO(0, 0, 0, 1),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.all(20),
//                 padding: EdgeInsets.all(15),
//                 decoration: BoxDecoration(
//                   color: Color.fromRGBO(214, 228, 240, 1),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Container(
//                   width: 50,
//                   height: 50,
//                   decoration: BoxDecoration(
//                     color: Color.fromRGBO(255, 255, 255, 1),
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: Center(
//                     child: Text(
//                       'f',
//                       style: TextStyle(
//                         fontSize: 27,
//                         fontWeight: FontWeight.w600,
//                         color: Color.fromRGBO(0, 0, 0, 1),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
