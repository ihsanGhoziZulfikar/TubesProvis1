import 'package:flutter/material.dart';
import 'package:login_page/changePassPage.dart';
import 'package:login_page/home.dart';
import 'package:login_page/registerPage.dart';
import 'package:login_page/rolePage.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'navbar.dart';
import 'ratingDialogue.dart';

class MyUmkmPage extends StatelessWidget {
  final pageController = PageController();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Text(
                "UMKM Saya",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w800,
                  height: 1.3625,
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
                      padding: const EdgeInsets.symmetric(horizontal: 19.0),
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
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
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
                            'Yusuf Bakery',
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
                            'Bandung',
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
                            '2016',
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
                            'Makanan',
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
                              'Yusuf Bakery merupakan UMKM yang bergerak di bidang perdagangan, menjual berbagai macam jenis roti, donut, dan lainnya.',
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
                          thickness: 1.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
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
              TextButton(
                onPressed: () => showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => Dialog(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const SizedBox(height: 15),
                          RatingDialogue(),
                          const SizedBox(height: 15),
                        ],
                      ),
                    ),
                  ),
                ),
                child: const Text('Show Dialog'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
