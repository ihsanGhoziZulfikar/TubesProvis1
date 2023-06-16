import 'package:flutter/material.dart';
import 'activityUmkm.dart';

import 'navbar.dart';

class NotificationSubmissionDialogue extends StatefulWidget {
  const NotificationSubmissionDialogue({
    super.key,
  });

  @override
  State<NotificationSubmissionDialogue> createState() =>
      _notificationSubmissionDialogueState();
}

class _notificationSubmissionDialogueState
    extends State<NotificationSubmissionDialogue> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Text(
            "Pengajuan Pinjaman",
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
                    text:
                        'Anda telah melakukan pengajuan pinjaman untuk periode ke-3. Dengan keterangan pengajuan sebagai berikut:',
                    style: TextStyle(
                        height: 1.5, fontSize: 14, color: Colors.black),
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
                        text: '• Dana dipinjam : Rp30.000.000\n',
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                      TextSpan(
                        text: '• Jangka waktu  : 16 Bulan\n',
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                      TextSpan(
                        text: '• Besar Cicilan   : Rp1.875.000 / bulan\n',
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
