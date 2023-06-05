import 'package:flutter/material.dart';
import 'package:login_page/umkmDetailPage.dart';

class DataWatchlist extends StatelessWidget {
  final String img;
  final String name;
  final String nameUsaha;
  final String location;

  const DataWatchlist(
      {super.key,
      required this.img,
      required this.name,
      required this.nameUsaha,
      required this.location});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return Scaffold(
                body: Center(
                  child: SingleChildScrollView(
                    child: UmkmDetailPage(),
                  ),
                ),
              );
            },
          ),
        );
      },
      child: Container(
        child: Row(
          children: [
            Container(
              width: 80.0,
              height: 80.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  bottomLeft: Radius.circular(20.0),
                ),
                image: DecorationImage(
                  image: NetworkImage(img),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 15, top: 10.0, bottom: 10.0),
              width: 245.0,
              height: 80.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 2.5),
                  Text(
                    name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // SizedBox(height: 2.0),
                  Text(nameUsaha),
                  // SizedBox(height: 5.5),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.red,
                        size: 16,
                      ),
                      SizedBox(width: 4.0),
                      Text(location),
                    ],
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
