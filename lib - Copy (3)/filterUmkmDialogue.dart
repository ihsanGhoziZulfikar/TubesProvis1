import 'package:flutter/material.dart';
import 'package:login_page/home.dart';
import 'package:login_page/registerPage.dart';
import 'package:login_page/rolePage.dart';

import 'navbar.dart';

class FilterUmkmDialogue extends StatefulWidget {
  const FilterUmkmDialogue({
    super.key,
  });

  @override
  State<FilterUmkmDialogue> createState() => _FilterUmkmDialogueState();
}

enum rating { r1, r2, r3, r4, r5 }

class _FilterUmkmDialogueState extends State<FilterUmkmDialogue> {
  @override
  Widget build(BuildContext context) {
    var nilaiSlider = 5.0;
    rating? ratingStar;
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Text(
            "Filter",
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Lokasi",
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Color(0xff000000),
                ),
              ),
              Container(
                width: 180,
                height: 40,
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Color(0xffD2E2F0),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Bandung',
                    ),
                    Icon(Icons.keyboard_arrow_down),
                  ],
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Divider(
              color: Colors.black,
              thickness: 1.0,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Jangka Waktu",
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Color(0xff000000),
                ),
              ),
              Container(
                width: 180,
                height: 40,
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Color(0xffD2E2F0),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '12 Bulan',
                    ),
                    Icon(Icons.keyboard_arrow_down),
                  ],
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Divider(
              color: Colors.black,
              thickness: 1.0,
            ),
          ),
          Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Besar Pinjaman",
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    color: Color(0xff000000),
                  ),
                ),
              ),
              Slider(
                value: nilaiSlider,
                max: 15,
                divisions: 3,
                label: nilaiSlider.round().toString(),
                onChanged: (double value) {
                  setState() {
                    nilaiSlider = value;
                  }
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('< 1 juta'),
                  Text('5 juta'),
                  Text('10 juta'),
                  Text('15 juta'),
                ],
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Divider(
              color: Colors.black,
              thickness: 1.0,
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Rating UMKM",
              style: TextStyle(
                fontWeight: FontWeight.w300,
                color: Color(0xff000000),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber),
                        Icon(Icons.star, color: Colors.amber),
                        Icon(Icons.star, color: Colors.amber),
                        Icon(Icons.star, color: Colors.amber),
                        Icon(Icons.star, color: Colors.amber),
                      ],
                    ),
                    Radio<rating>(
                      value: rating.r5,
                      groupValue: ratingStar,
                      onChanged: (value) {
                        setState(() {
                          ratingStar = value;
                        });
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber),
                        Icon(Icons.star, color: Colors.amber),
                        Icon(Icons.star, color: Colors.amber),
                        Icon(Icons.star, color: Colors.amber),
                        Icon(Icons.star_border, color: Colors.amber),
                      ],
                    ),
                    Radio<rating>(
                      value: rating.r4,
                      groupValue: ratingStar,
                      onChanged: (value) {
                        setState(() {
                          ratingStar = value;
                        });
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber),
                        Icon(Icons.star, color: Colors.amber),
                        Icon(Icons.star, color: Colors.amber),
                        Icon(Icons.star_border, color: Colors.amber),
                        Icon(Icons.star_border, color: Colors.amber),
                      ],
                    ),
                    Radio<rating>(
                      value: rating.r3,
                      groupValue: ratingStar,
                      onChanged: (value) {
                        setState(() {
                          ratingStar = value;
                        });
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber),
                        Icon(Icons.star, color: Colors.amber),
                        Icon(Icons.star_border, color: Colors.amber),
                        Icon(Icons.star_border, color: Colors.amber),
                        Icon(Icons.star_border, color: Colors.amber),
                      ],
                    ),
                    Radio<rating>(
                      value: rating.r2,
                      groupValue: ratingStar,
                      onChanged: (value) {
                        setState(() {
                          ratingStar = value;
                        });
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber),
                        Icon(Icons.star_border, color: Colors.amber),
                        Icon(Icons.star_border, color: Colors.amber),
                        Icon(Icons.star_border, color: Colors.amber),
                        Icon(Icons.star_border, color: Colors.amber),
                      ],
                    ),
                    Radio<rating>(
                      value: rating.r1,
                      groupValue: ratingStar,
                      onChanged: (value) {
                        setState(() {
                          ratingStar = value;
                        });
                      },
                    ),
                  ],
                ),
                Container(
                  width: 100,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(top: 35),
                  decoration: BoxDecoration(
                    color: Color(0xff1C355E),
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                  child: Center(
                    child: Text(
                      'ATUR',
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
