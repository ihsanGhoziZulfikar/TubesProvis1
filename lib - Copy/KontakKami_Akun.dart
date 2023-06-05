import 'package:flutter/material.dart';

class Kontakkami extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        // wireframeakunqyx (1:578)
        height: 852,
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xffffffff)),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            Container(
              width: 393,
              height: 70,
              child: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(16, 8, 24, 5),
                    width: 393,
                    height: 56,
                    decoration: BoxDecoration(
                      color: Color(0xffffffff),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // group54x4v (1:588)
                          margin: EdgeInsets.fromLTRB(0, 3, 51, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(16, 78, 21, 44),
              width: 393,
              height: 782,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // group113aZU (1:638)
                    margin: EdgeInsets.fromLTRB(4, 0, 0, 22),
                    width: 146,
                    height: 92,
                    child: Image.asset(
                      '../assets/images/logo.png',
                      width: 146,
                      height: 92,
                    ),
                  ),
                  Container(
                    // group188Hin (1:617)
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 45),
                    padding: EdgeInsets.fromLTRB(22, 22, 22, 22),
                    width: double.infinity,
                    height: 206,
                    decoration: BoxDecoration(
                      color: Color(0xffd6e4f0),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      // adalahloremipsumdolorsitametco (1:622)
                      child: SizedBox(
                        child: Container(
                          constraints: BoxConstraints(
                            maxWidth: 312,
                          ),
                          child: Text(
                            'BizAid adalah suatu aplikasi p2p lending yang bertujuan untuk membantu para pedagan umkm untuk mendapatkan modal agar bisa terus berjualan serta BizAid juga menyediakan sistem investasi bagi pada investor',
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
                    // autogroupbgnaViN (RcwBo7TF3onEqLn9Bkbgna)
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
                    // group187qZG (1:627)
                    margin: EdgeInsets.fromLTRB(4, 0, 0, 0),
                    width: 352,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // group184kw8 (1:628)
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
                          // group185dk2 (1:631)
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
                          // group1867fC (1:634)
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
    );
  }
}
