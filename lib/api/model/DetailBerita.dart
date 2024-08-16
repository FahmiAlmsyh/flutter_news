/// id : "076c33e0930e6549925763a44eb0540a"
/// jdl_news : "PENGUMUMAN BAGI YANG LULUS BEASISWA KELAS INCUBATOR 2022"
/// post_on : "Senin, 18-04-2022 14:00"
/// nama_kategori : "Berita"
/// foto_news : "https://www.lauwba.com/../news/pengumuman-bagi-yang-lulus-beasiswa-kelas-incubator-2022.JPG"
/// judul_seo : "pengumuman-bagi-yang-lulus-beasiswa-kelas-incubator-2022"
/// ket_news : "Pengumuman bagi yang lulus\r\nsecara administrasi beasiswa kelas incubator 2022 akan kami umumkan setelah\r\nlibur lebaran. Terimakasih"
/// message : "data ditemukan"
/// error : 200

class DetailBerita {
  DetailBerita({
      String? id, 
      String? jdlNews, 
      String? postOn, 
      String? namaKategori, 
      String? fotoNews, 
      String? judulSeo, 
      String? ketNews, 
      String? message, 
      num? error,}){
    _id = id;
    _jdlNews = jdlNews;
    _postOn = postOn;
    _namaKategori = namaKategori;
    _fotoNews = fotoNews;
    _judulSeo = judulSeo;
    _ketNews = ketNews;
    _message = message;
    _error = error;
}

  DetailBerita.fromJson(dynamic json) {
    _id = json['id'];
    _jdlNews = json['jdl_news'];
    _postOn = json['post_on'];
    _namaKategori = json['nama_kategori'];
    _fotoNews = json['foto_news'];
    _judulSeo = json['judul_seo'];
    _ketNews = json['ket_news'];
    _message = json['message'];
    _error = json['error'];
  }
  String? _id;
  String? _jdlNews;
  String? _postOn;
  String? _namaKategori;
  String? _fotoNews;
  String? _judulSeo;
  String? _ketNews;
  String? _message;
  num? _error;
DetailBerita copyWith({  String? id,
  String? jdlNews,
  String? postOn,
  String? namaKategori,
  String? fotoNews,
  String? judulSeo,
  String? ketNews,
  String? message,
  num? error,
}) => DetailBerita(  id: id ?? _id,
  jdlNews: jdlNews ?? _jdlNews,
  postOn: postOn ?? _postOn,
  namaKategori: namaKategori ?? _namaKategori,
  fotoNews: fotoNews ?? _fotoNews,
  judulSeo: judulSeo ?? _judulSeo,
  ketNews: ketNews ?? _ketNews,
  message: message ?? _message,
  error: error ?? _error,
);
  String? get id => _id;
  String? get jdlNews => _jdlNews;
  String? get postOn => _postOn;
  String? get namaKategori => _namaKategori;
  String? get fotoNews => _fotoNews;
  String? get judulSeo => _judulSeo;
  String? get ketNews => _ketNews;
  String? get message => _message;
  num? get error => _error;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['jdl_news'] = _jdlNews;
    map['post_on'] = _postOn;
    map['nama_kategori'] = _namaKategori;
    map['foto_news'] = _fotoNews;
    map['judul_seo'] = _judulSeo;
    map['ket_news'] = _ketNews;
    map['message'] = _message;
    map['error'] = _error;
    return map;
  }

}