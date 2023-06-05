import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'konfirmasi.dart';

class bayarpinjaman extends StatelessWidget {
  const bayarpinjaman({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.all(14),
                margin: EdgeInsets.only(bottom: 10),
                child: Text(
                  'Bayar Pinjaman',
                  style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.all(14),
                child: Text(
                  'ATM anda',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 119, 166, 232),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.all(14),
                      margin: EdgeInsets.only(
                        bottom: 10,
                        left: 10,
                        right: 10,
                      ),
                      // child: Icon(Icons.add_circle_outline),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.add_circle_outline),
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.all(14),
                child: Text(
                  'Transfer Ke Bank',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              ),
              // Row(
              //   children: [
              //     Expanded(
              //       child:Container(
              //             decoration: BoxDecoration(
              //               color: Color.fromARGB(255, 119, 166, 232),
              //               borderRadius: BorderRadius.only(
              //                 topLeft: Radius.circular(12),
              //                 topRight: Radius.circular(12),
              //               ),
              //               border: Border(
              //                 bottom: BorderSide(
              //                   color: Colors.black,
              //                   width: 1.0,
              //                 ),
              //               ),
              //             ),
              //             margin: EdgeInsets.symmetric(horizontal: 10),
              //             padding:
              //                 EdgeInsets.fromLTRB(14, 14, 14, 14), // Updated padding
              //             child: Text(
              //               'BNI',
              //               style: GoogleFonts.inter(
              //                 fontSize: 12,
              //                 color: Colors.black,
              //               ),
              //             ),
              //         ),
              //     )
              //   ],
              // ),
              Expanded(
                child: ListView(
                  // padding: EdgeInsets.all(20),
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 119, 166, 232),
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.black,
                            width: 1.0,
                          ),
                        ),
                      ),
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      padding: EdgeInsets.fromLTRB(
                          14, 14, 14, 14), // Updated padding
                      child: Text(
                        'BNI',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 119, 166, 232),
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.black,
                            width: 1.0,
                          ),
                        ),
                      ),
                      margin: EdgeInsets.only(
                        left: 10,
                        right: 10,
                      ),
                      padding: EdgeInsets.all(14),
                      child: Text(
                        'BCA',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 119, 166, 232),
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.black,
                            width: 1.0,
                          ),
                        ),
                      ),
                      margin: EdgeInsets.only(
                        left: 10,
                        right: 10,
                      ),
                      padding: EdgeInsets.all(14),
                      child: Text(
                        'BRI',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 119, 166, 232),
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.black,
                            width: 1.0,
                          ),
                        ),
                      ),
                      margin: EdgeInsets.only(
                        left: 10,
                        right: 10,
                      ),
                      padding: EdgeInsets.all(14),
                      child: Text(
                        'Mandiri',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 119, 166, 232),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        ),
                      ),
                      margin: EdgeInsets.only(
                        left: 10,
                        right: 10,
                      ),
                      padding: EdgeInsets.all(14),
                      child: const Text(
                        'BJB Syariah',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return Konfirmasi();
                          },
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                        left: 10,
                        right: 10,
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return Konfirmasi();
                              },
                            ),
                          );
                        },
                        child: const Text('Bayar'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 2, 46, 122),
                          textStyle: const TextStyle(fontSize: 12),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 25),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ])
            ],
          ),
        ),
      ),
    );
  }
}
