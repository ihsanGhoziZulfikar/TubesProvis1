import 'package:flutter/material.dart';
import 'loginPage.dart';
import 'navbar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'home.dart';

class AddDataPage extends StatefulWidget {
  int id_investor;
  int id_dana;

  AddDataPage({this.id_investor = 0, this.id_dana = 0});

  @override
  State<AddDataPage> createState() => _AddDataPageState();
}

class _AddDataPageState extends State<AddDataPage> {
  String namaImage = "";

  final dio = Dio();

  Future<String> uploadFile(List<int> file, String fileName) async {
    print("mulai");
    FormData formData = FormData.fromMap({
      "file": MultipartFile.fromBytes(file,
          filename: fileName, contentType: MediaType("image", "png")),
    });
    var response =
        //untuk chorme
        await dio.post("http://127.0.0.1:8000/uploadimage", data: formData);

    //untuk android
    //await dio.post("http://10.0.2.2:8000/uploadimage", data: formData);

    print(response.statusCode);
    if (response.statusCode == 200) {
      setState(() {
        namaImage = fileName;
      });
    }
    return fileName;
  }

  Future<void> _getImageFromGallery() async {
    print("get image");
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    final bytes = await pickedImage?.readAsBytes();
    if (pickedImage != null) {
      print("mulai upload");
      await uploadFile(bytes as List<int>, pickedImage.name);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: -100,
                right: -100,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/arc.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 60,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 20,
                          ),
                          child: Text(
                            'Sebelum memulai, lengkapi data diri berikut ini terlebih dahulu!',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 5,
                          ),
                          child: Text(
                            '1. Foto Diri',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 40, horizontal: 10),
                          margin: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 50),
                          decoration: BoxDecoration(
                            color: Color(0xFFD6E4F0),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: _getImageFromGallery,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      namaImage != ""
                                          ? Image.network(
                                              //chrome
                                              'http://127.0.0.1:8000/getimage/$namaImage',

                                              //android
                                              //'http://10.0.2.2:8000/getimage/$namaImage',
                                              height: 200,
                                            )
                                          : const Text(" Image Tidak Tersedia"),
                                      Image.asset(
                                        width: 50,
                                        'assets/images/icon-camera.png',
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 5,
                          ),
                          child: Text(
                            '2. Foto KTP',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 40, horizontal: 10),
                          margin: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 50),
                          decoration: BoxDecoration(
                            color: Color(0xFFD6E4F0),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      width: 50,
                                      'assets/images/icon-identification.png',
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 5,
                          ),
                          child: Text(
                            '3. Foto NPWP',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 40, horizontal: 10),
                          margin: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 50),
                          decoration: BoxDecoration(
                            color: Color(0xFFD6E4F0),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      width: 50,
                                      'assets/images/icon-document.png',
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return LoginPage();
                                      // return Navbar(
                                      //     id_investor: id_investor,
                                      //     id_dana: id_dana);
                                    },
                                  ),
                                );
                              },
                              child: Container(
                                padding: EdgeInsets.all(10),
                                margin: EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 50,
                                ),
                                decoration: BoxDecoration(
                                  color: Color(0xff1C355E),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      'MULAI ',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        height: 1,
                                        color: Color(0xfff5f5f5),
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_forward,
                                      color: Color(0xfff5f5f5),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
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
