import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'ModelClass/accountModel.dart';
import 'ModelClass/peminjamModel.dart';
import 'navbar.dart';
import 'navbar2.dart';

class LengkapiData extends StatefulWidget {
  final int id;
  final int id_umkm;
  final int id_dana;
  final String role;

  LengkapiData({
    Key? key,
    required this.id,
    required this.id_umkm,
    required this.id_dana,
    required this.role,
  }) : super(key: key);

  @override
  State<LengkapiData> createState() => _LengkapiDataState();
}

class _LengkapiDataState extends State<LengkapiData> {
  final accountCubit = AccountCubit();
  int id = 0;
  int id_dana = 0;
  int id_umkm = 0;
  String nama = "";
  String email = "";
  String password = "";
  String phone = "";
  String tempat = "";
  String tanggal = "";
  String gender = "";
  String alamat = "";
  String provinsi = "";
  String kabupaten = "";
  String pekerjaan = "";
  int kodepos = 0;
  String norek = "";
  int pendapatan = 0;
  String ktp = "";
  String selfie = "";
  String npwp = "";

  var idController = TextEditingController();
  var id_danaController = TextEditingController();
  var id_umkmController = TextEditingController();
  var namaController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();
  var tempatController = TextEditingController();
  var tanggalController = TextEditingController();
  var genderController = TextEditingController();
  var alamatController = TextEditingController();
  var provinsiController = TextEditingController();
  var kabupatenController = TextEditingController();
  var pekerjaanController = TextEditingController();
  var kodeposController = TextEditingController();
  var norekController = TextEditingController();
  var pendapatanController = TextEditingController();
  var ktpController = TextEditingController();
  var selfieController = TextEditingController();
  var npwpController = TextEditingController();

  int _id = 0;
  int _id_dana = 0;
  int _id_umkm = 0;
  String _nama = "";
  String _email = "";
  String _password = "";
  String _phone = "";
  String _tempat = "";
  String _tanggal = "";
  String _gender = "";
  String _alamat = "";
  String _provinsi = "";
  String _kabupaten = "";
  String _pekerjaan = "";
  int _kodepos = 0;
  String _norek = "";
  int _pendapatan = 0;
  String _ktp = "";
  String _selfie = "";
  String _npwp = "";

  @override
  void initState() {
    super.initState();
    fetchDataAndUpdate();
  }

  void fetchDataAndUpdate() {
    accountCubit.fetchData(widget.id, widget.role).then((accountModel) {
      // Access the nama property
      setState(() {
        id = accountModel.id;
        id_dana = accountModel.id_dana;
        id_umkm = accountModel.id_umkm;
        nama = accountModel.nama;
        email = accountModel.email;
        password = accountModel.password;
        phone = accountModel.phone;
        tempat = accountModel.tempat;
        tanggal = accountModel.tanggal;
        gender = accountModel.gender;
        alamat = accountModel.alamat;
        provinsi = accountModel.provinsi;
        kabupaten = accountModel.kabupaten;
        pekerjaan = accountModel.pekerjaan;
        kodepos = accountModel.kodepos;
        norek = accountModel.norek;
        pendapatan = accountModel.pendapatan;
        ktp = accountModel.ktp;
        selfie = accountModel.selfie;
        npwp = accountModel.npwp;

        idController = TextEditingController(text: id.toString());
        id_danaController = TextEditingController(text: id_dana.toString());
        id_umkmController = TextEditingController(text: id_umkm.toString());
        namaController = TextEditingController(text: nama);
        emailController = TextEditingController(text: email);
        passwordController = TextEditingController(text: password);
        phoneController = TextEditingController(text: phone);
        tempatController = TextEditingController(text: tempat);
        tanggalController = TextEditingController(text: tanggal);
        pilihanGender = gender;
        alamatController = TextEditingController(text: alamat);
        provinsiController = TextEditingController(text: provinsi);
        kabupatenController = TextEditingController(text: kabupaten);
        pekerjaanController = TextEditingController(text: pekerjaan);
        kodeposController = TextEditingController(text: kodepos.toString());
        norekController = TextEditingController(text: norek);
        pendapatanController =
            TextEditingController(text: pendapatan.toString());
        ktpController = TextEditingController(text: ktp);
        selfieController = TextEditingController(text: selfie);
        npwpController = TextEditingController(text: npwp);
      });
    }).catchError((error) {
      print('Failed to fetch data: $error');
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    idController.dispose();
    id_danaController.dispose();
    id_umkmController.dispose();
    namaController.dispose();
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    tempatController.dispose();
    tanggalController.dispose();
    alamatController.dispose();
    provinsiController.dispose();
    kabupatenController.dispose();
    pekerjaanController.dispose();
    kodeposController.dispose();
    norekController.dispose();
    pendapatanController.dispose();
    ktpController.dispose();
    selfieController.dispose();
    npwpController.dispose();
    super.dispose();
  }

  String? pilihanGender;
  List<String> items = [
    "Perempuan",
    "Laki-laki",
    "string",
  ];

  String? pilihanBank;
  List<String> banks = [
    "BRI",
    "BCA",
    "BJB",
    "MANDIRI",
    "BSI",
    "string",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<AccountModel>(
        future: accountCubit.fetchData(widget.id, widget.role),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            final account = snapshot.data;
            return Container(
              height: MediaQuery.of(context).size.height,
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        Text(
                          "Lengkapi Data",
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
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 30),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 15),
                                  child: Text(
                                    "Nama Lengkap",
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
                                  padding: EdgeInsets.symmetric(horizontal: 10),
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
                                  margin: EdgeInsets.symmetric(horizontal: 15),
                                  child: Text(
                                    "Tempat Lahir",
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
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                    color: Color(0xffd6e4f0),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(40)),
                                  ),
                                  child: TextField(
                                    controller: tempatController,
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
                                  margin: EdgeInsets.symmetric(horizontal: 15),
                                  child: Text(
                                    "Tanggal Lahir",
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
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                    color: Color(0xffd6e4f0),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(40)),
                                  ),
                                  child: TextField(
                                    controller: tanggalController,
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
                                  margin: EdgeInsets.symmetric(horizontal: 15),
                                  child: Text(
                                    "Jenis Kelamin",
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
                                      value: pilihanGender,
                                      onChanged: (String? gender) {
                                        setState(() {
                                          pilihanGender = gender;
                                        });
                                      },
                                      items: items.map((String gender) {
                                        return DropdownMenuItem<String>(
                                          value: gender,
                                          child: Text(gender),
                                        );
                                      }).toList(),
                                      underline:
                                          Container(), // Menghilangkan border
                                      isExpanded:
                                          true, // Mengisi ruang kontainer
                                      hint: Text('Choose Gender'),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 15),
                                  child: Text(
                                    "Alamat Lengkap",
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
                                  padding: EdgeInsets.symmetric(horizontal: 10),
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
                                  margin: EdgeInsets.symmetric(horizontal: 15),
                                  child: Text(
                                    "Provinsi",
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
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                    color: Color(0xffd6e4f0),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(40)),
                                  ),
                                  child: TextField(
                                    controller: provinsiController,
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
                                  margin: EdgeInsets.symmetric(horizontal: 15),
                                  child: Text(
                                    "Kabupaten/Kota",
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
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                    color: Color(0xffd6e4f0),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(40)),
                                  ),
                                  child: TextField(
                                    controller: kabupatenController,
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
                                  margin: EdgeInsets.symmetric(horizontal: 15),
                                  child: Text(
                                    "Pekerjaan",
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
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                    color: Color(0xffd6e4f0),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(40)),
                                  ),
                                  child: TextField(
                                    controller: pekerjaanController,
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
                                  margin: EdgeInsets.symmetric(horizontal: 15),
                                  child: Text(
                                    "Kode Pos",
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
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                    color: Color(0xffd6e4f0),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(40)),
                                  ),
                                  child: TextField(
                                    controller: kodeposController,
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
                                  margin: EdgeInsets.symmetric(horizontal: 15),
                                  child: Text(
                                    "Pilih Bank",
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
                                      value: pilihanBank,
                                      onChanged: (String? bank) {
                                        setState(() {
                                          pilihanBank = bank;
                                        });
                                      },
                                      items: banks.map((String bank) {
                                        return DropdownMenuItem<String>(
                                          value: bank,
                                          child: Text(bank),
                                        );
                                      }).toList(),
                                      underline:
                                          Container(), // Menghilangkan border
                                      isExpanded:
                                          true, // Mengisi ruang kontainer
                                      hint: Text('Choose Bank'),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 15),
                                  child: Text(
                                    "No Rekening",
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
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                    color: Color(0xffd6e4f0),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(40)),
                                  ),
                                  child: TextField(
                                    controller: norekController,
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
                                  margin: EdgeInsets.symmetric(horizontal: 15),
                                  child: Text(
                                    "Pekerjaan",
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
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                    color: Color(0xffd6e4f0),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(40)),
                                  ),
                                  child: TextField(
                                    controller: pekerjaanController,
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
                                  margin: EdgeInsets.symmetric(horizontal: 15),
                                  child: Text(
                                    "Pendapatan Kotor",
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
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                    color: Color(0xffd6e4f0),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(40)),
                                  ),
                                  child: TextField(
                                    controller: pendapatanController,
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
                                SizedBox(
                                  height: 40,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _id =
                                          int.tryParse(idController.text) ?? 0;
                                      _id_dana = int.tryParse(
                                              id_danaController.text) ??
                                          0;
                                      _id_umkm = int.tryParse(
                                              id_umkmController.text) ??
                                          0;
                                      _nama = namaController.text;
                                      _email = emailController.text;
                                      _password = passwordController.text;
                                      _phone = phoneController.text;
                                      _tempat = tempatController.text;
                                      _tanggal = tanggalController.text;
                                      _gender = genderController.text;
                                      _alamat = alamatController.text;
                                      _provinsi = provinsiController.text;
                                      _kabupaten = kabupatenController.text;
                                      _pekerjaan = pekerjaanController.text;
                                      _kodepos = int.tryParse(
                                              kodeposController.text) ??
                                          0;
                                      _norek = norekController.text;
                                      _pendapatan = int.tryParse(
                                              pendapatanController.text) ??
                                          0;
                                      _ktp = ktpController.text;
                                      _selfie = selfieController.text;
                                      _npwp = npwpController.text;
                                    });
                                    updatePeminjam(
                                        widget.id,
                                        _id_dana,
                                        _id_umkm,
                                        _nama,
                                        _email,
                                        _password,
                                        _phone,
                                        _tempat,
                                        _tanggal,
                                        pilihanGender as String,
                                        _alamat,
                                        _provinsi,
                                        _kabupaten,
                                        _pekerjaan,
                                        _kodepos,
                                        _norek,
                                        _pendapatan,
                                        _ktp,
                                        _selfie,
                                        _npwp);
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) {
                                          if (widget.role == "investor") {
                                            return Navbar(
                                                id_investor: widget.id,
                                                id_dana: widget.id_dana);
                                          } else {
                                            return Navbar2(
                                              id_peminjam: widget.id,
                                              id_umkm: widget.id_umkm,
                                              id_dana: widget.id_dana,
                                            );
                                          }
                                        },
                                      ),
                                    );
                                    //refresh
                                    // updateUmkm(
                                    //     widget.id_umkm,
                                    //     _nama,
                                    //     _alamat,
                                    //     _tahun,
                                    //     _deskripsi,
                                    //     pilihanKategori as String);
                                    // Navigator.of(context).push(
                                    //   MaterialPageRoute(
                                    //     builder: (context) {
                                    //       return Navbar(
                                    //         id_peminjam: widget.id_peminjam,
                                    //         id_umkm: widget.id_umkm,
                                    //         id_dana: widget.id_dana,
                                    //       );
                                    //     },
                                    //   ),
                                    // );
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
                                        'Konfirmasi',
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
            );
          }
        },
      ),
    );
  }
}
