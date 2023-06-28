import 'package:flutter/material.dart';
import 'activityUmkm.dart';

import 'navbar.dart';

class TopupNotificationDialogue extends StatefulWidget {
  const TopupNotificationDialogue({
    super.key,
  });

  @override
  State<TopupNotificationDialogue> createState() =>
      Funding_notificationDialogueState();
}

class Funding_notificationDialogueState
    extends State<TopupNotificationDialogue> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 421,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Text(
            "Pengisian Saldo Dana",
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
                  Icons.paypal_rounded,
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
            padding: const EdgeInsets.only(left: 30.0, right: 25.0, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text:
                        'Anda telah melakukan Pengisian Saldo dengan keterangan sebagai berikut :',
                    style: TextStyle(
                      height: 1.5,
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(height: 1.5),
                      children: [
                        TextSpan(
                          text: '• ID Transaksi  : 349AklOqw903\n',
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                        TextSpan(
                          text: '• Nominal         : Rp30.000.000\n',
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                        TextSpan(
                          text: '• Waktu             : 23:59:59 WIB\n',
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                        TextSpan(
                          children: [
                            TextSpan(
                              text: '• Status             : ',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.black),
                            ),
                            TextSpan(
                              text: 'SUKSES\n',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Color.fromARGB(255, 4, 232, 12)),
                            )
                          ],
                        ),
                      ],
                    ),
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
