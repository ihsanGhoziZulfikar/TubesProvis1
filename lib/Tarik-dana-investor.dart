import 'package:flutter/material.dart';

class Tarikdana extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        // wireframetarikdanaDwU (1:1391)
        height: 852,
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xffffffff)),
          borderRadius: BorderRadius.circular(28),
        ),
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 17),
              width: 393,
              height: 852,
              decoration: BoxDecoration(
                color: Color(0xffffffff),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // autogroupoqtuqCA (RcwWMzgYxhw8w5JsuboqTU)
                    padding: EdgeInsets.fromLTRB(14, 59, 13, 20),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // tarikdanapinjamanAES (1:1393)
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 41),
                          child: Text(
                            'Tarik Dana Pinjaman',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                              height: 1.2125,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                        Container(
                          // group110FWn (1:1397)
                          margin: EdgeInsets.fromLTRB(1, 0, 0, 499),
                          width: 365,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                // viaatmNLW (1:1398)
                                'Via ATM',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  height: 2.0200345357,
                                  color: Color(0xff000000),
                                ),
                              ),
                              Container(
                                // group108Jzr (1:1399)
                                padding: EdgeInsets.fromLTRB(19, 13, 19, 14),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Color(0xff669ad9),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  'BCA',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    height: 2.0200345357,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // group100nf8 (1:1394)
                          margin: EdgeInsets.fromLTRB(0, 0, 1, 0),
                          padding: EdgeInsets.fromLTRB(144, 7.83, 149, 2.17),
                          decoration: BoxDecoration(
                            color: Color(0xff1c355e),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            'Tarik Dana',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              height: 3,
                              color: Color(0xffffffff),
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
