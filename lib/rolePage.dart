import 'package:flutter/material.dart';
import 'package:login_page/registerPage.dart';

class RolePage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Color.fromARGB(255, 102, 154, 217),
      child: Stack(
        children: [
          Positioned(
            top: (MediaQuery.of(context).size.height * -0.1),
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.6,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      '../assets/images/flag.png'), // Provide the correct image path
                  fit: BoxFit.fill, // Use BoxFit.fill to stretch the image
                ),
              ),
            ),
          ),
          Container(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(50),
                  child: Image.asset(
                    '../assets/images/logo.png',
                    width: 100,
                    height: 100,
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return Scaffold(
                                body: Center(
                                  child: SingleChildScrollView(
                                    child: RegisterPage(),
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                        decoration: BoxDecoration(
                          color: Color(0xFFD6E4F0),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              child: Image.asset(
                                width: 50,
                                '../assets/images/icon-profle.png',
                              ),
                            ),
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Lender',
                                        style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    'Jika anda membutuhkan dana pinjaman untuk modal usaha atau membutuhkan tempat usaha',
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      height: 1.2125,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              child: Image.asset(
                                width: 15,
                                '../assets/images/icon-arrow.png',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return Scaffold(
                                body: Center(
                                  child: SingleChildScrollView(
                                    child: RegisterPage(),
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                        decoration: BoxDecoration(
                          color: Color(0xFFD6E4F0),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              child: Image.asset(
                                width: 50,
                                '../assets/images/icon-profle.png',
                              ),
                            ),
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Investor',
                                        style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    'Jika anda ingin menginvestasikan dana untuk membantu perkembangan umkm',
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      height: 1.2125,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              child: Image.asset(
                                width: 15,
                                '../assets/images/icon-arrow.png',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
