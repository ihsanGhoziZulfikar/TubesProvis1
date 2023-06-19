import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class PeminjamanModel {
  int id;
  int id_peminjam;
  int durasi;
  int bunga;
  int cicilan;
  String deskripsi;
  String status;
  int total_pinjaman;
  int dana_terkumpul;
  int id_dana;
  int id_umkm;
  String nama_peminjam;
  String email;
  String password;
  String phone;
  String tempat;
  String tanggal;
  String gender;
  String alamat;
  String provinsi;
  String kabupaten;
  String pekerjaan;
  int kodepos;
  String norek;
  int pendapatan;
  String ktp;
  String selfie;
  String npwp;
  String nama_umkm;

  PeminjamanModel({
    required this.id,
    required this.id_peminjam,
    required this.durasi,
    required this.bunga,
    required this.cicilan,
    required this.deskripsi,
    required this.status,
    required this.total_pinjaman,
    required this.dana_terkumpul,
    required this.id_dana,
    required this.id_umkm,
    required this.nama_peminjam,
    required this.email,
    required this.password,
    required this.phone,
    required this.tempat,
    required this.tanggal,
    required this.gender,
    required this.alamat,
    required this.provinsi,
    required this.kabupaten,
    required this.pekerjaan,
    required this.kodepos,
    required this.norek,
    required this.pendapatan,
    required this.ktp,
    required this.selfie,
    required this.npwp,
    required this.nama_umkm,
  });

  factory PeminjamanModel.fromJson(Map<String, dynamic> json) {
    return PeminjamanModel(
      id: json['id'] ?? 0,
      id_peminjam: json['id_peminjam'] ?? 0,
      durasi: json['durasi'] ?? 0,
      bunga: json['bunga'] ?? 0,
      cicilan: json['cicilan'] ?? 0,
      deskripsi: json['deskripsi'] ?? '',
      status: json['status'] ?? '',
      total_pinjaman: json['total_pinjaman'] ?? 0,
      dana_terkumpul: json['dana_terkumpul'] ?? 0,
      id_dana: json['id_dana'] ?? 0,
      id_umkm: json['id_umkm'] ?? 0,
      nama_peminjam: json['nama_peminjam'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      phone: json['phone'] ?? '',
      tempat: json['tempat'] ?? '',
      tanggal: json['tanggal'] ?? '',
      gender: json['gender'] ?? '',
      alamat: json['alamat'] ?? '',
      provinsi: json['provinsi'] ?? '',
      kabupaten: json['kabupaten'] ?? '',
      pekerjaan: json['pekerjaan'] ?? '',
      kodepos: json['kodepos'] ?? 0,
      norek: json['norek'] ?? '',
      pendapatan: json['pendapatan'] ?? 0,
      ktp: json['ktp'] ?? '',
      selfie: json['selfie'] ?? '',
      npwp: json['npwp'] ?? '',
      nama_umkm: json['nama_umkm'] ?? '',
    );
  }
}

class PeminjamanCubit extends Cubit<PeminjamanModel> {
  PeminjamanCubit()
      : super(PeminjamanModel(
          id: 0,
          id_peminjam: 0,
          durasi: 0,
          bunga: 0,
          cicilan: 0,
          deskripsi: '',
          status: '',
          total_pinjaman: 0,
          dana_terkumpul: 0,
          id_dana: 0,
          id_umkm: 0,
          nama_peminjam: '',
          email: '',
          password: '',
          phone: '',
          tempat: '',
          tanggal: '',
          gender: '',
          alamat: '',
          provinsi: '',
          kabupaten: '',
          pekerjaan: '',
          kodepos: 0,
          norek: '',
          pendapatan: 0,
          ktp: '',
          selfie: '',
          npwp: '',
          nama_umkm: '',
        ));

  Future<PeminjamanModel> fetchData(id) async {
    try {
      String url = "http://127.0.0.1:8000/peminjaman/$id";
      final response = await http.get(Uri.parse(url));
      print("hjksdhajkhj jkl");
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        // if (jsonData.containsKey("data")) {
        final data = jsonData['data'] as Map<String, dynamic>;
        final peminjamanModel = PeminjamanModel.fromJson(data);
        return peminjamanModel;
        // }
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print(e);
      throw Exception('Failed to load data: $e');
    }
  }
}

class PeminjamanSedangCubit extends Cubit<PeminjamanModel> {
  PeminjamanSedangCubit()
      : super(PeminjamanModel(
          id: 0,
          id_peminjam: 0,
          durasi: 0,
          bunga: 0,
          cicilan: 0,
          deskripsi: '',
          status: '',
          total_pinjaman: 0,
          dana_terkumpul: 0,
          id_dana: 0,
          id_umkm: 0,
          nama_peminjam: '',
          email: '',
          password: '',
          phone: '',
          tempat: '',
          tanggal: '',
          gender: '',
          alamat: '',
          provinsi: '',
          kabupaten: '',
          pekerjaan: '',
          kodepos: 0,
          norek: '',
          pendapatan: 0,
          ktp: '',
          selfie: '',
          npwp: '',
          nama_umkm: '',
        ));

  Future<PeminjamanModel> fetchData(id_umkm) async {
    try {
      String url = "http://127.0.0.1:8000/peminjaman_sedang/$id_umkm";
      final response = await http.get(Uri.parse(url));
      print("hjksdhajkhj jkl");
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        // if (jsonData.containsKey("data")) {
        final data = jsonData['data'] as Map<String, dynamic>;
        final peminjamanModel = PeminjamanModel.fromJson(data);
        return peminjamanModel;
        // }
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print(e);
      throw Exception('Failed to load data: $e');
    }
  }
}

class PeminjamanSudahCubit extends Cubit<PeminjamanModel> {
  PeminjamanSudahCubit()
      : super(PeminjamanModel(
          id: 0,
          id_peminjam: 0,
          durasi: 0,
          bunga: 0,
          cicilan: 0,
          deskripsi: '',
          status: '',
          total_pinjaman: 0,
          dana_terkumpul: 0,
          id_dana: 0,
          id_umkm: 0,
          nama_peminjam: '',
          email: '',
          password: '',
          phone: '',
          tempat: '',
          tanggal: '',
          gender: '',
          alamat: '',
          provinsi: '',
          kabupaten: '',
          pekerjaan: '',
          kodepos: 0,
          norek: '',
          pendapatan: 0,
          ktp: '',
          selfie: '',
          npwp: '',
          nama_umkm: '',
        ));

  Future<PeminjamanModel> fetchData(id_umkm) async {
    try {
      String url = "http://127.0.0.1:8000/peminjaman_sudah/$id_umkm";
      final response = await http.get(Uri.parse(url));
      print("hjksdhajkhj jkl");
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        // if (jsonData.containsKey("data")) {
        final data = jsonData['data'] as Map<String, dynamic>;
        final peminjamanModel = PeminjamanModel.fromJson(data);
        return peminjamanModel;
        // }
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print(e);
      throw Exception('Failed to load data: $e');
    }
  }
}

class PeminjamanTungguCubit extends Cubit<PeminjamanModel> {
  PeminjamanTungguCubit()
      : super(PeminjamanModel(
          id: 0,
          id_peminjam: 0,
          durasi: 0,
          bunga: 0,
          cicilan: 0,
          deskripsi: '',
          status: '',
          total_pinjaman: 0,
          dana_terkumpul: 0,
          id_dana: 0,
          id_umkm: 0,
          nama_peminjam: '',
          email: '',
          password: '',
          phone: '',
          tempat: '',
          tanggal: '',
          gender: '',
          alamat: '',
          provinsi: '',
          kabupaten: '',
          pekerjaan: '',
          kodepos: 0,
          norek: '',
          pendapatan: 0,
          ktp: '',
          selfie: '',
          npwp: '',
          nama_umkm: '',
        ));

  Future<PeminjamanModel> fetchData(id_umkm) async {
    try {
      String url = "http://127.0.0.1:8000/peminjaman_tunggu/$id_umkm";
      final response = await http.get(Uri.parse(url));
      print("hjksdhajkhj jkl");
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        // if (jsonData.containsKey("data")) {
        final data = jsonData['data'] as Map<String, dynamic>;
        final peminjamanModel = PeminjamanModel.fromJson(data);
        return peminjamanModel;
        // }
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print(e);
      throw Exception('Failed to load data: $e');
    }
  }
}

class ListPeminjamanCubit extends Cubit<List<PeminjamanModel>> {
  String url = "http://127.0.0.1:8000/tampilkan_semua_peminjaman/";

  ListPeminjamanCubit() : super([]);

  Future<List<PeminjamanModel>> fetchData() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final dataList = jsonData['data'] as List<dynamic>;
        final umkmList = dataList
            .map((item) =>
                PeminjamanModel.fromJson(item as Map<String, dynamic>))
            .toList();
        print(dataList);
        emit(umkmList);
        return umkmList;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print("aaa");
      throw Exception('Failed to load data: $e');
    }
  }
}

class ListPeminjamanSedangCubit extends Cubit<List<PeminjamanModel>> {
  ListPeminjamanSedangCubit() : super([]);

  Future<List<PeminjamanModel>> fetchData() async {
    try {
      String url = "http://127.0.0.1:8000/semua_peminjaman_sedang/";
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final dataList = jsonData['data'] as List<dynamic>;
        final umkmList = dataList
            .map((item) =>
                PeminjamanModel.fromJson(item as Map<String, dynamic>))
            .toList();
        print(dataList);
        emit(umkmList);
        return umkmList;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print("aaa");
      throw Exception('Failed to load data: $e');
    }
  }
}

Future<void> tambahPinjaman(int id_peminjam, int nominal, int waktu, int bunga,
    double cicilan, String nama, String deskripsi) async {
  final url = 'http://127.0.0.1:8000/tambah_peminjaman/';

  final data = {
    'id': 0,
    'id_peminjam': id_peminjam,
    'durasi': waktu,
    'bunga': bunga,
    'cicilan': cicilan,
    'deskripsi': nama,
    'status': "Sedang",
    'total_pinjaman': nominal,
    'dana_terkumpul': 0,
    'tenggat': DateFormat('yyyy-MM-dd').format(DateTime.now()),
  };

  final response = await http.post(
    Uri.parse(url),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(data),
  ); //

  if (response.statusCode == 201) {
    // Success
    final responseData = jsonDecode(response.body);
    print('New UMKM created with ID: ${responseData['id']}');
  } else {
    // Error
    print('Failed to create UMKM. Status code: ${response.statusCode}');
    print('Error message: ${response.body}');
  }
}

Future<void> updateDanaTerkumpulPeminjaman(int id, int dana_terkumpul) async {
  final url = 'http://127.0.0.1:8000/update_peminjaman_patch/$id';

  final umkmData = {
    'id': id,
    'dana_terkumpul': dana_terkumpul,
  };

  final response = await http.patch(
    Uri.parse(url),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(umkmData),
  );

  if (response.statusCode == 201) {
    // Success
    final responseData = jsonDecode(response.body);
    print('New UMKM created with ID: ${responseData['id']}');
  } else {
    // Error
    print('Failed to create UMKM. Status code: ${response.statusCode}');
    print('Error message: ${response.body}');
  }
}

Future<void> updateStatusPeminjaman(int id, String status) async {
  final url = 'http://127.0.0.1:8000/update_peminjaman_patch/$id';

  final umkmData = {
    'id': id,
    'status': status,
  };

  final response = await http.patch(
    Uri.parse(url),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(umkmData),
  );

  if (response.statusCode == 201) {
    // Success
    final responseData = jsonDecode(response.body);
    print('New UMKM created with ID: ${responseData['id']}');
  } else {
    // Error
    print('Failed to create UMKM. Status code: ${response.statusCode}');
    print('Error message: ${response.body}');
  }
}


    // void  updateDanaTerkumpulPeminjaman(id_peminjaman, dana_terkumpul + nominal);
    // void updateStatusPeminjaman(id_peminjaman, "Sudah");

