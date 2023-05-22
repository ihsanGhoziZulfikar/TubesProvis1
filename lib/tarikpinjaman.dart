import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TarikPinjaman extends StatelessWidget {
  const TarikPinjaman({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.all(14),
            margin: EdgeInsets.only(bottom: 10),
            child: Text(
              'Tarik Dana Pinjaman',
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
              'via ATM',
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
                  child: Text(
                    'BCA',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  // child: Icon(Icons.add_circle_outlin
                ),
              ),
            ],
          ),
          Expanded(child:
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
            Expanded(
              child: Container(
                // alignment: Alignment.bottomCenter,
                margin: EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Tarik Dana'),
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
            )
          ])
          )
        ],
      ),
    );
  }
}
