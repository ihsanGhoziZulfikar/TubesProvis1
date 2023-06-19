import 'package:flutter/material.dart';
import 'home.dart';
import 'registerPage.dart';
import 'rolePage.dart';

import 'navbar.dart';

class RatingDialogue extends StatelessWidget {
  const RatingDialogue({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Berikan Ulasan",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w500,
            height: 1.3625,
            color: Color(0xff000000),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Text("Rating UMKM"),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.star),
            Icon(Icons.star),
            Icon(Icons.star),
            Icon(Icons.star),
            Icon(Icons.star),
          ],
        ),
        SizedBox(
          height: 25,
        ),
        Text("Deskripsi"),
        SizedBox(
          height: 15,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          height: 189,
          width: 315,
          decoration: BoxDecoration(
            color: Color(0xFFD2E2F0),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: TextField(
            maxLength: 130,
            maxLines: null,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              border: InputBorder.none,
              hintText: 'Enter your text',
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: 100,
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.only(top: 5, bottom: 5),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
                child: Center(
                  child: Text(
                    'CLOSE',
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 30,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: 100,
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.only(top: 5, bottom: 5),
                decoration: BoxDecoration(
                  color: Color(0xff1C355E),
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
                child: Center(
                  child: Text(
                    'KIRIM',
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
