import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';

class InvestorUmkmModel {
  int id;
  int id_investor;
  int id_umkm;
  int id_dana;
  int id_peminjaman;
  int saldo;
  int total_peminjaman;
  int dana_bayar;
  String status;
  String nama_umkm;
  String alamat_umkm;
  String jenis_umkm;
  String nama_peminjam;
  String deskripsi;
  double persen;

  InvestorUmkmModel({
    required this.id,
    required this.id_investor,
    required this.id_umkm,
    required this.id_dana,
    required this.id_peminjaman,
    required this.saldo,
    required this.total_peminjaman,
    required this.dana_bayar,
    required this.status,
    required this.nama_umkm,
    required this.alamat_umkm,
    required this.jenis_umkm,
    required this.nama_peminjam,
    required this.deskripsi,
    required this.persen,
  });

  factory InvestorUmkmModel.fromJson(Map<String, dynamic> json) {
    return InvestorUmkmModel(
      id: json['id'] ?? 0,
      id_investor: json['id_investor'] ?? 0,
      id_umkm: json['id_umkm'] ?? 0,
      id_dana: json['id_dana'] ?? 0,
      id_peminjaman: json['id_peminjaman'] ?? 0,
      saldo: json['saldo'] ?? 0,
      total_peminjaman: json['total_peminjaman'] ?? 0,
      dana_bayar: json['dana_bayar'] ?? 0,
      status: json['status'] ?? '',
      nama_umkm: json['nama_umkm'] ?? '',
      alamat_umkm: json['alamat_umkm'] ?? '',
      jenis_umkm: json['jenis_umkm'] ?? '',
      nama_peminjam: json['nama_peminjam'] ?? '',
      deskripsi: json['deskripsi'] ?? '',
      persen: json['persen'] ?? 0,
    );
  }
}

class InvestorUmkmCubit extends Cubit<InvestorUmkmModel> {
  InvestorUmkmCubit()
      : super(InvestorUmkmModel(
          id: 0,
          id_investor: 0,
          id_umkm: 0,
          id_dana: 0,
          id_peminjaman: 0,
          saldo: 0,
          total_peminjaman: 0,
          dana_bayar: 0,
          status: "",
          nama_umkm: "",
          alamat_umkm: "",
          jenis_umkm: "",
          nama_peminjam: "",
          deskripsi: "",
          persen: 0,
        ));

  Future<InvestorUmkmModel?> fetchData(id) async {
    try {
      if (id == "") {
        return null;
      }
      String url = "http://127.0.0.1:8000/investorumkm/id";
      final response = await http.get(Uri.parse(url));
      // print("hjksdhajkhj jkl");
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        if (jsonData.containsKey("data")) {
          final data = jsonData['data'] as Map<String, dynamic>;
          final transaksiPeminjamModel = InvestorUmkmModel.fromJson(data);
          return transaksiPeminjamModel;
        } else {
          return null;
        }
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print(e);
      throw Exception('Failed to load data: $e');
    }
  }
}

class InvestorUmkmSedangCubit extends Cubit<InvestorUmkmModel> {
  InvestorUmkmSedangCubit()
      : super(InvestorUmkmModel(
          id: 0,
          id_investor: 0,
          id_umkm: 0,
          id_dana: 0,
          id_peminjaman: 0,
          saldo: 0,
          total_peminjaman: 0,
          dana_bayar: 0,
          status: "",
          nama_umkm: "",
          alamat_umkm: "",
          jenis_umkm: "",
          nama_peminjam: "",
          deskripsi: "",
          persen: 0,
        ));

  Future<InvestorUmkmModel?> fetchData(id) async {
    try {
      if (id == "") {
        return null;
      }
      String url = "http://127.0.0.1:8000/investorumkm_sedang/id";
      final response = await http.get(Uri.parse(url));
      // print("hjksdhajkhj jkl");
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        if (jsonData.containsKey("data")) {
          final data = jsonData['data'] as Map<String, dynamic>;
          final transaksiPeminjamModel = InvestorUmkmModel.fromJson(data);
          return transaksiPeminjamModel;
        } else {
          return null;
        }
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print(e);
      throw Exception('Failed to load data: $e');
    }
  }
}

class InvestorUmkmSudahCubit extends Cubit<InvestorUmkmModel> {
  InvestorUmkmSudahCubit()
      : super(InvestorUmkmModel(
          id: 0,
          id_investor: 0,
          id_umkm: 0,
          id_dana: 0,
          id_peminjaman: 0,
          saldo: 0,
          total_peminjaman: 0,
          dana_bayar: 0,
          status: "",
          nama_umkm: "",
          alamat_umkm: "",
          jenis_umkm: "",
          nama_peminjam: "",
          deskripsi: "",
          persen: 0,
        ));

  Future<InvestorUmkmModel?> fetchData(id) async {
    try {
      if (id == "") {
        return null;
      }
      String url = "http://127.0.0.1:8000/investorumkm_sudah/id";
      final response = await http.get(Uri.parse(url));
      // print("hjksdhajkhj jkl");
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        if (jsonData.containsKey("data")) {
          final data = jsonData['data'] as Map<String, dynamic>;
          final transaksiPeminjamModel = InvestorUmkmModel.fromJson(data);
          return transaksiPeminjamModel;
        } else {
          return null;
        }
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print(e);
      throw Exception('Failed to load data: $e');
    }
  }
}

class ListInvestorUmkmCubit extends Cubit<List<InvestorUmkmModel>> {
  ListInvestorUmkmCubit() : super([]);

  Future<List<InvestorUmkmModel>> fetchData(int id_investor) async {
    try {
      String url = "http://127.0.0.1:8000/investorumkm_investor/$id_investor";
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final dataList = jsonData['data'] as List<dynamic>;
        final investorUmkmList = dataList
            .map((item) =>
                InvestorUmkmModel.fromJson(item as Map<String, dynamic>))
            .toList();
        print(dataList);
        emit(investorUmkmList);
        return investorUmkmList;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print("aaa");
      throw Exception('Failed to load data: $e');
    }
  }
}

class ListInvestorUmkmPeminjamanCubit extends Cubit<List<InvestorUmkmModel>> {
  ListInvestorUmkmPeminjamanCubit() : super([]);

  Future<List<InvestorUmkmModel>> fetchData(int id_peminjaman) async {
    try {
      String url =
          "http://127.0.0.1:8000/investorumkmpeminjaman/$id_peminjaman";
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final dataList = jsonData['data'] as List<dynamic>;
        final investorUmkmList = dataList
            .map((item) =>
                InvestorUmkmModel.fromJson(item as Map<String, dynamic>))
            .toList();
        print(dataList);
        emit(investorUmkmList);
        return investorUmkmList;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print("aaa");
      throw Exception('Failed to load data: $e');
    }
  }
}

class ListInvestorUmkmSedangCubit extends Cubit<List<InvestorUmkmModel>> {
  ListInvestorUmkmSedangCubit() : super([]);

  Future<List<InvestorUmkmModel>> fetchData(id_investor) async {
    try {
      String url = "http://127.0.0.1:8000/investorumkm_sedang/$id_investor";
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final dataList = jsonData['data'] as List<dynamic>;
        final investorUmkmList = dataList
            .map((item) =>
                InvestorUmkmModel.fromJson(item as Map<String, dynamic>))
            .toList();
        print(dataList);
        emit(investorUmkmList);
        return investorUmkmList;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print("aaa");
      throw Exception('Failed to load data: $e');
    }
  }
}

class ListInvestorUmkmSudahCubit extends Cubit<List<InvestorUmkmModel>> {
  ListInvestorUmkmSudahCubit() : super([]);

  Future<List<InvestorUmkmModel>> fetchData(id_investor) async {
    try {
      String url = "http://127.0.0.1:8000/investorumkm_sudah/$id_investor";
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final dataList = jsonData['data'] as List<dynamic>;
        final investorUmkmList = dataList
            .map((item) =>
                InvestorUmkmModel.fromJson(item as Map<String, dynamic>))
            .toList();
        print(dataList);
        emit(investorUmkmList);
        return investorUmkmList;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print("aaa");
      throw Exception('Failed to load data: $e');
    }
  }
}

Future<void> tambahInvestorUmkm(
  int id_investor,
  int id_umkm,
  int id_peminjaman,
  int total_peminjaman,
  double persen,
) async {
  final url = 'http://127.0.0.1:8000/tambah_investorumkm';

  final umkmData = {
    'id': 0,
    'id_investor': id_investor,
    'id_umkm': id_umkm,
    'total_peminjaman': total_peminjaman,
    'dana_bayar': 0,
    'status': "Sedang",
    'persen': persen,
    'id_peminjaman': id_peminjaman
  };

  final response = await http.post(
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

// tambahInvestorUmkm(id_investor, id_umkm, nominal);

Future<void> updateDanaBayar(int id, int saldo) async {
  final url = 'http://127.0.0.1:8000/update_investorumkm_patch/$id';

  final umkmData = {
    'id': 0,
    'id_investor': -9999,
    'id_umkm': -9999,
    'total_peminjaman': "kosong",
    'dana_bayar': saldo,
    'status': "kosong",
    'persen': -9999.0,
    'id_peminjaman': -9999
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
