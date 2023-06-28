import 'package:android/loginPage.dart';
import 'package:android/pusatBantuan.dart';
import 'package:flutter/material.dart';
import 'KontakKami_Akun.dart';
import 'syaratdanketentuan_akun.dart';

import 'myAccountPage.dart';
import 'ModelClass/accountModel.dart';

class Account extends StatelessWidget {
  int id;
  int id_umkm;
  int id_dana;
  String role;
  Account({
    Key? key,
    required this.id,
    required this.id_umkm,
    required this.id_dana,
    required this.role,
  }) : super(key: key);

  final accountCubit = AccountCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<AccountModel>(
        future: accountCubit.fetchData(id, role),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            final account = snapshot.data;
            return SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 14.0, vertical: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Akun",
                          style: TextStyle(
                            fontSize: 24,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return LoginPage();
                                },
                              ),
                            );
                          },
                          child: Container(
                            child: Row(
                              children: [
                                Text(
                                  "Keluar",
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 5.0),
                                Icon(Icons.logout, size: 24, color: Colors.red),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 32.0),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                        padding: EdgeInsets.all(10.0),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                            'https://cdn-icons-png.flaticon.com/512/4086/4086679.png',
                          ),
                          radius: 80,
                        )),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Text(
                                account!.nama,
                                style: TextStyle(
                                  fontSize: 26.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 8.0,
                              ),
                              Text(
                                'Bergabung sejak 2016',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                              SizedBox(height: 28.0),
                              TextButton(
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(130.0),
                                    ),
                                  ),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Color(0xFF1C355E)),
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                  overlayColor:
                                      MaterialStateProperty.resolveWith<Color?>(
                                    (Set<MaterialState> states) {
                                      if (states
                                          .contains(MaterialState.hovered))
                                        return Colors.blue.withOpacity(0.04);
                                      if (states.contains(
                                              MaterialState.focused) ||
                                          states
                                              .contains(MaterialState.pressed))
                                        return Colors.blue.withOpacity(0.12);
                                      return null;
                                    },
                                  ),
                                ),
                                onPressed: () {},
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return MyAccountPage(
                                            id: id,
                                            id_umkm: id_umkm,
                                            id_dana: id_dana,
                                            role: role,
                                          );
                                        },
                                      ),
                                    );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0, vertical: 4.0),
                                    child: Text(
                                      'Lihat Profil',
                                      style: TextStyle(fontSize: 16.0),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      width: 360,
                      height: 225,
                      decoration: BoxDecoration(
                        color: Color(0xFFD6E4F0),
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Column(children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return PusatBantuan();
                                  },
                                ),
                              );
                            },
                            child: Container(
                              height: 48,
                              width: 290,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(40.0),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Pusat Bantuan",
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      size: 16,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return SyaratdanKetentuan();
                                  },
                                ),
                              );
                            },
                            child: Container(
                              height: 48,
                              width: 290,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(40.0),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Syarat dan Ketentuan",
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      size: 16,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return Kontakkami();
                                  },
                                ),
                              );
                            },
                            child: Container(
                              height: 48,
                              width: 290,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(40.0),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Kontak Kami",
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      size: 16,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ]),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
