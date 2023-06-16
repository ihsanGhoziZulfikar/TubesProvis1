import 'package:flutter/material.dart';

class Kontakkami extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: 852,
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xffffffff)),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(20, 40, 21, 44),
                width: 393,
                height: 782,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(4, 0, 0, 40),
                      width: 146,
                      height: 92,
                      child: Image.asset(
                        'assets/images/logo.png',
                        width: 146,
                        height: 92,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 45),
                      padding: EdgeInsets.fromLTRB(22, 22, 22, 22),
                      width: double.infinity,
                      height: 206,
                      decoration: BoxDecoration(
                        color: Color(0xffd6e4f0),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: SizedBox(
                          child: Container(
                            constraints: BoxConstraints(
                              maxWidth: 312,
                            ),
                            child: Text(
                              'BizAid adalah suatu aplikasi p2p lending yang bertujuan untuk membantu para pelaku usaha umkm untuk mendapatkan modal agar dapat terus membangun usahanya, serta BizAid juga menyediakan sistem investasi bagi para investor.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                decoration: TextDecoration.none,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                height: 1.265,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 78, 14),
                      width: 254,
                      height: 80,
                      child: Stack(
                        children: [
                          Align(
                            child: SizedBox(
                              width: 254,
                              height: 100,
                              child: Text(
                                'Halo, ada yang bisa kami bantu?\n\nKontak Kami',
                                style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  height: 1.265,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(4, 0, 0, 0),
                      width: 352,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(18, 17, 18, 17),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0xffd6e4f0),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              'Email: BizAid@gmail.com',
                              style: TextStyle(
                                decoration: TextDecoration.none,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                height: 1.265,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(17, 16, 17, 18),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0xffd6e4f0),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              'Whatsapp: +6288198801204',
                              style: TextStyle(
                                decoration: TextDecoration.none,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                height: 1.265,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(18, 16, 18, 18),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0xffd6e4f0),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              'Telepon: +6288198801204',
                              style: TextStyle(
                                decoration: TextDecoration.none,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                height: 1.265,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
