import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'ModelClass/umkmModel.dart';
import 'navbar2.dart';

// class UmkmModel {
//   String nama;
//   String alamat;
//   int tahun;
//   String jenis;
//   String deskripsi;

//   UmkmModel({
//     required this.nama,
//     required this.alamat,
//     required this.tahun,
//     required this.jenis,
//     required this.deskripsi,
//   });

//   factory UmkmModel.fromJson(Map<String, dynamic> json) {
//     return UmkmModel(
//       nama: json['nama'] ?? '',
//       alamat: json['alamat'] ?? '',
//       tahun: json['tahun'] ?? 0,
//       jenis: json['jenis'] ?? '',
//       deskripsi: json['deskripsi'] ?? '',
//     );
//   }
// }

// class UmkmCubit extends Cubit<UmkmModel> {
//   UmkmCubit()
//       : super(UmkmModel(
//           nama: '',
//           alamat: '',
//           tahun: 0,
//           jenis: '',
//           deskripsi: '',
//         ));

//   Future<UmkmModel> fetchData(id) async {
//     try {
//       String url = "http://127.0.0.1:8000/umkm/$id";
//       final response = await http.get(Uri.parse(url));
//       print("bb");
//       if (response.statusCode == 200) {
//         print(response);
//         final jsonData = jsonDecode(response.body);
//         final data = jsonData['data'] as Map<String, dynamic>;
//         final umkmModel = UmkmModel.fromJson(data);
//         emit(umkmModel);
//         return umkmModel;
//       } else {
//         throw Exception('Failed to load data');
//       }
//     } catch (e) {
//       print(e);
//       throw Exception('Failed to load data: $e');
//     }
//   }
// }

class UbahDataUMKM extends StatefulWidget {
  final int id_peminjam;
  final int id_umkm;
  final int id_dana;

  const UbahDataUMKM({
    Key? key,
    required this.id_peminjam,
    required this.id_umkm,
    required this.id_dana,
  }) : super(key: key);

  @override
  State<UbahDataUMKM> createState() => _UbahDataUMKMState();
}

class _UbahDataUMKMState extends State<UbahDataUMKM> {
  UmkmCubit umkmCubit = UmkmCubit();
  String nama = "";
  String alamat = "";
  int tahun = 0;
  String jenis = "";
  String deskripsi = "";

  var namaController = TextEditingController();
  var alamatController = TextEditingController();
  var tahunController = TextEditingController();
  var deskripsiController = TextEditingController();
  String _nama = "";
  String _alamat = "";
  int _tahun = 0;
  String _deskripsi = "";

  String? pilihanKategori;
  List<String> items = [
    "Makanan",
    "Minuman",
    "Aksesoris",
    "Baju",
    "Tas",
  ];

  @override
  void initState() {
    super.initState();
    fetchDataAndUpdate();
  }

  void fetchDataAndUpdate() {
    umkmCubit.fetchData(widget.id_umkm).then((umkmModel) {
      // Access the nama property
      setState(() {
        nama = umkmModel.nama;
        alamat = umkmModel.alamat;
        tahun = umkmModel.tahun;
        jenis = umkmModel.jenis;
        deskripsi = umkmModel.deskripsi;

        namaController = TextEditingController(text: nama);
        alamatController = TextEditingController(text: alamat);
        tahunController = TextEditingController(text: tahun.toString());
        deskripsiController = TextEditingController(text: deskripsi);
        pilihanKategori = jenis;
      });
    }).catchError((error) {
      print('Failed to fetch data: $error');
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    namaController.dispose();
    alamatController.dispose();
    deskripsiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "Ubah Data UMKM",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                      height: 1.3625,
                      color: Color(0xff000000),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 15),
                            child: Text(
                              "Nama UMKM",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                height: 1.265,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            decoration: BoxDecoration(
                              color: Color(0xffd6e4f0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40)),
                            ),
                            child: TextField(
                              controller: namaController,
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 10),
                                border: InputBorder.none,
                                hintText: 'Enter your text',
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 15),
                            child: Text(
                              "Alamat UMKM",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                height: 1.265,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            decoration: BoxDecoration(
                              color: Color(0xffd6e4f0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40)),
                            ),
                            child: TextField(
                              controller: alamatController,
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 10),
                                border: InputBorder.none,
                                hintText: 'Enter your text',
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 15),
                            child: Text(
                              "Tahun Berdiri",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                height: 1.265,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            decoration: BoxDecoration(
                              color: Color(0xffd6e4f0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40)),
                            ),
                            child: TextField(
                              controller: tahunController,
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 10),
                                border: InputBorder.none,
                                hintText: 'Enter your text',
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 15),
                            child: Text(
                              "Kategori UMKM",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                height: 1.265,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                              color: Color(0xffd6e4f0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40)),
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: DropdownButton<String>(
                                value: pilihanKategori,
                                onChanged: (String? kategori) {
                                  setState(() {
                                    pilihanKategori = kategori;
                                  });
                                },
                                items: items.map((String kategori) {
                                  return DropdownMenuItem<String>(
                                    value: kategori,
                                    child: Text(kategori),
                                  );
                                }).toList(),
                                underline: Container(), // Menghilangkan border
                                isExpanded: true, // Mengisi ruang kontainer
                                hint: Text('Choose Category'),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 15),
                            child: Text(
                              "Deskripsi UMKM",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                height: 1.265,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                          Container(
                            height: 150,
                            margin: EdgeInsets.symmetric(vertical: 10),
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            decoration: BoxDecoration(
                              color: Color(0xffd6e4f0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                            child: TextField(
                              controller: deskripsiController,
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 5),
                                border: InputBorder.none,
                                hintText: 'Enter your text',
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 15),
                            child: Text(
                              "Daftar Foto",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                height: 1.265,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Container(
                                width: 40,
                                height: 30,
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(5),
                                margin: EdgeInsets.only(right: 5, left: 20),
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 234, 232, 232)),
                                child: Text(
                                  "foto",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              Container(
                                width: 40,
                                height: 30,
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(5),
                                margin: EdgeInsets.only(right: 5),
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 234, 232, 232)),
                                child: Text(
                                  "foto",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              Container(
                                width: 40,
                                height: 30,
                                margin: EdgeInsets.only(right: 5),
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 234, 232, 232)),
                                child: Icon(Icons.add),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _nama = namaController
                                    .text; //akses text via controller
                                _alamat = alamatController
                                    .text; //akses text via controller
                                _deskripsi = deskripsiController
                                    .text; //akses text via controller
                                _tahun = int.tryParse(tahunController.text) ??
                                    0; //akses text via controller
                              }); //refresh
                              updateUmkm(widget.id_umkm, _nama, _alamat, _tahun,
                                  _deskripsi, pilihanKategori as String);
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return Navbar2(
                                      id_peminjam: widget.id_peminjam,
                                      id_umkm: widget.id_umkm,
                                      id_dana: widget.id_dana,
                                    );
                                  },
                                ),
                              );
                            },
                            child: Container(
                              width: double.infinity,
                              margin: EdgeInsets.symmetric(vertical: 10),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 15),
                              decoration: BoxDecoration(
                                color: Color(0xff1c355e),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40)),
                              ),
                              child: Center(
                                child: Text(
                                  'Ubah Data',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    height: 1.265,
                                    color: Color(0xffffffff),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
