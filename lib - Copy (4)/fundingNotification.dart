import 'package:flutter/material.dart';
import 'activityUmkm.dart';

import 'navbar.dart';

class FundingNotificationDialogue extends StatefulWidget {
  const FundingNotificationDialogue({
    super.key,
  });

  @override
  State<FundingNotificationDialogue> createState() =>
      Funding_notificationDialogueState();
}

class Funding_notificationDialogueState
    extends State<FundingNotificationDialogue> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Text(
            "Pemberian Dana Pinjaman",
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
                  Icons.handshake_rounded,
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
            "14 Desember 2023",
            style: TextStyle(fontSize: 12, color: Color(0xFFA4A4A4)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Anda telah menerima pendanaan dari ',
                    style: TextStyle(
                      height: 1.5,
                      fontSize: 14,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                        text: 'Arya Saloka',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text:
                            '. Dengan keterangan pendanaan sebagai berikut : ',
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                RichText(
                  text: TextSpan(
                    style: TextStyle(height: 1.5),
                    children: [
                      TextSpan(
                        text: '• Nominal  : Rp5.000.000\n',
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                      TextSpan(
                        text: '• Waktu      : 23:59:59 WIB\n',
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '• Status      : ',
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          ),
                          TextSpan(
                            text: 'SUKSES\n',
                            style: TextStyle(
                                fontSize: 14,
                                color: Color.fromARGB(255, 4, 232, 12)),
                          )
                        ],
                      ),
                      TextSpan(
                        text: '• Catatan    :',
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                      TextSpan(
                        text:
                            ' Semoga dapat membantu perkembangan bisnis saudara, saran saya dapat ditambahkan menu dengan toping oreo untuk produk minumannya.\n',
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ],
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
