import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:berita_flutter/api/model/DetailBerita.dart';
import 'package:berita_flutter/api/models/generalList.dart';

import 'model/ListBerita.dart';

const String baseURL = "https://lauwba.com/webservices/";

const String Url = "https://saurav.tech/NewsAPI/top-headlines/category/";

// function ini membutuhkan data ListBerita, tidak sekarang
// static, ini mmebuat function ini bisa di akses dari beberapa class yang memanggil function ini
// dan tidak membuat object baru
class Api{
  static Future<ListBerita> getListBerita()async{
    // buat gabungan url dengan base url dengan endpointnya
    String url = baseURL + "get_latest_news";

    // variable ini untuk menampung response dari hasil request API
    final response = await http.get(Uri.parse(url));

    // cek apakah status code == 20 (OK)?
    if(response.statusCode == 200){
      //return listData dari json
      return ListBerita.fromJson(jsonDecode(response.body));
    }
    // menampilkan error kepada pengguna
    throw Exception("error");
  }

  static Future<DetailBerita> getDetailBerita(String id)async{
    // buat gabungan url dengan base url dengan endpointnya
    String url = baseURL + "get_detail_news/$id";

    // variable ini untuk menampung response dari hasil request API
    final response = await http.get(Uri.parse(url));

    // cek apakah status code == 20 (OK)?
    if(response.statusCode == 200){
      //return listData dari json
      return DetailBerita.fromJson(jsonDecode(response.body));
    }
    // menampilkan error kepada pengguna
    throw Exception("error");
  }

  static Future<GeneralList> getBeritaGeneral() async {
    String url = Url + "general/in.json";

    final response = await http.get(Uri.parse(url));

    if(response.statusCode == 200) {
      return GeneralList.fromJson(jsonDecode(response.body));
    }
    throw Exception("error");

  }
}