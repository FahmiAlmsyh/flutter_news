import 'package:berita_flutter/api/api.dart';
import 'package:berita_flutter/api/model/DetailBerita.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Detail extends StatefulWidget {
  final String id;
  const Detail({super.key, required this.id});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  DetailBerita? dataDetail;

  @override
  void initState() {
    super.initState();
    getDetail();
  }

  Future<void> getDetail() async {
    try {
      final detail = await Api.getDetailBerita(widget.id);
      setState(() {
        dataDetail = detail;
      });
    } catch (e) {
      print("Kesalahan saat mengambil detail berita: $e");
      // Tampilkan pesan kesalahan kepada pengguna
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(dataDetail?.jdlNews ?? 'Detail Berita'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: dataDetail == null
                ? Scaffold(
                    body: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        dataDetail!.jdlNews!,
                        style: GoogleFonts.poppins(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      Text(dataDetail!.postOn!),
                      SizedBox(height: 8),
                      Image.network(
                        dataDetail!.fotoNews!,
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 8),
                      Text(dataDetail!.ketNews!),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
