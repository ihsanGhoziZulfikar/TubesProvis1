import 'package:flutter/material.dart';
import 'activityUmkm.dart';

import 'navbar.dart';

class BellNotificationDialogue extends StatefulWidget {
  String judul;
  String konten;
  String waktu;

  BellNotificationDialogue({
    super.key,
    required this.judul,
    required this.konten,
    required this.waktu,
  });

  @override
  State<BellNotificationDialogue> createState() =>
      Bell_notificationSubmigueState();
}

class Bell_notificationSubmigueState extends State<BellNotificationDialogue> {
  @override
  Widget build(BuildContext context) {
    double containerHeight = 0; // Deklarasi variabel containerHeight
    if (widget.konten.length > 250 && widget.konten.length < 320) {
      containerHeight = 410; // Mengatur tinggi kontainer menjadi 600
    } else if (widget.konten.length > 320) {
      containerHeight = 430; // Mengatur tinggi kontainer menjadi 600
    } else {
      containerHeight = 380; // Mengatur tinggi kontainer menjadi 400
    }
    return Container(
      height: containerHeight,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Text(
            widget.judul,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: Color(0xFF669AD9),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.document_scanner_rounded,
                  size: 50,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            widget.waktu,
            style: TextStyle(fontSize: 12, color: Color(0xFFA4A4A4)),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              widget.konten,
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 14, color: Colors.black),
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Color(0xFF1C355E),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Close'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
