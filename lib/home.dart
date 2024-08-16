import 'package:berita_flutter/api/api.dart';
import 'package:berita_flutter/api/models/generalList.dart';
import 'package:berita_flutter/detail.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'api/model/ListBerita.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Data> listBerita = [];
  List<Articles> listBeritaGeneral = [];

  @override
  void initState() {
    getListBerita();
    getBeritaGeneral();
    super.initState();
  }

  getListBerita() {
    Api.getListBerita().then((value) {
      setState(() {
        listBerita = value.data!;
      });
    }).catchError((error) {
      print("kesalahan :" + error);
    });
  }

  getBeritaGeneral() {
    Api.getBeritaGeneral().then((value) {
      setState(() {
        listBeritaGeneral = value.articles!;
      });
    }).catchError((error) {
      print("kesalahan :" + error);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Berita Popular",
                  style: GoogleFonts.poppins(
                      fontSize: 24, fontWeight: FontWeight.w600),
                ),
                CarouselSlider(
                  options: CarouselOptions(
                      height: 230,
                      autoPlay: true,
                      autoPlayAnimationDuration: Duration(milliseconds: 500),
                      autoPlayInterval: Duration(seconds: 3),
                      enlargeCenterPage: true,
                      viewportFraction: 1.0),
                  items: listBerita.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            child: Stack(
                              children: [
                                Image.network(
                                  i.fotoNews!,
                                  width: double.infinity,
                                  height: double.infinity,
                                  fit: BoxFit.cover,
                                  alignment: Alignment.center,
                                ),
                                Positioned(
                                    child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.5),
                                    ),
                                    child: ListTile(
                                      title: Text(
                                        i.jdlNews!,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      subtitle: Text(
                                        i.postOn!,
                                        style: TextStyle(color: Colors.white70),
                                      ),
                                    ),
                                  ),
                                ))
                              ],
                            ));
                      },
                    );
                  }).toList(),
                ),
                SizedBox(height: 20), // Add space between sections
                Text(
                  "Berita Terbaru",
                  style: GoogleFonts.poppins(
                      fontSize: 24, fontWeight: FontWeight.w600),
                ),
                Container(
                  height: 230,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: listBerita.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Detail(id: listBerita[index].id!)));
                        },
                        child: Card(
                          color: Colors.white,
                          child: ListTile(
                            leading: Image.network(
                              listBerita[index].fotoNews!,
                              fit: BoxFit.cover,
                              width: 100,
                            ),
                            title: Text(
                              listBerita[index].jdlNews!,
                              style: GoogleFonts.poppins(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            subtitle: Text(
                              listBerita[index].postOn!,
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "General News",
                  style: GoogleFonts.poppins(
                      fontSize: 24, fontWeight: FontWeight.w600),
                ),
                Container(
                  height: 208,
                  child: ListView.builder(
                    itemCount: listBeritaGeneral.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 300,
                        child: Card(
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(6),
                                child: Image.network(
                                  listBeritaGeneral[index].urlToImage!,
                                  width: 300,
                                  height: 150,
                                  fit: BoxFit.cover,
                                  alignment: Alignment.center,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                child: Text(
                                  listBeritaGeneral[index].title!,
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                  ),
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
