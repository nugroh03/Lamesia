import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lamesia/daftarpage.dart';
import 'package:lamesia/datapersonal.dart';
import 'package:lamesia/gantipassword.dart';
import 'package:lamesia/gantipassword.dart';
import 'color.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  Widget menu(image, title, ket) {
    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipOval(
            child: Container(
              color: Colors.red[50],
              height: 60,
              width: 60,
              child: Icon(
                image,
                size: 40,
                color: red,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(title,
              style: GoogleFonts.roboto(
                  fontSize: 15, fontWeight: FontWeight.bold)),
          SizedBox(
            height: 5,
          ),
          Text(ket, style: GoogleFonts.roboto(fontSize: 12, color: grey)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      child: Scaffold(
        backgroundColor: grey3,
        appBar: PreferredSize(
            child: Container(
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(width: 1, color: red))),
              padding: EdgeInsets.only(
                left: 20,
              ),
              height: height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 2,
                    child: Container(
                      alignment: Alignment.bottomLeft,
                      height: height,
                      child: Image.asset(
                        'assets/Logo Lamesia.png',
                        width: 200,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                      child: Row(
                        children: [
                          Flexible(
                            flex: 1,
                            child: Container(
                                alignment: Alignment.centerLeft,
                                width: width,
                                child: Icon(
                                  Icons.location_on,
                                  color: red,
                                )),
                          ),
                          Flexible(
                            flex: 9,
                            child: Container(
                              width: width,
                              child: Text('Lokasi Konsumen',
                                  style: GoogleFonts.roboto(
                                      fontSize: 15, color: textred)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            preferredSize:
                Size.fromHeight(MediaQuery.of(context).size.height * 0.15)),
        body: Container(
          height: height,
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.all(5),
                  color: white,
                  child: Row(
                    children: [
                      Container(
                        child: Row(
                          children: [
                            ClipOval(
                              child: Container(
                                color: Colors.red[50],
                                height: 60,
                                width: 60,
                                child: Icon(
                                  Icons.medical_services_rounded,
                                  size: 40,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                            SizedBox(width: 20),
                            Container(
                              alignment: Alignment.bottomLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Ambulan',
                                      style: GoogleFonts.roboto(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                  Text('Panggil Ambulan',
                                      style: GoogleFonts.roboto(
                                        fontSize: 12,
                                      )),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios_sharp)
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Flexible(
                flex: 6,
                child: Container(
                  height: height,
                  child: GridView.count(
                      physics: NeverScrollableScrollPhysics(),
                      childAspectRatio: 1.4 / 1.2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      crossAxisCount: 2,
                      children: [
                        menu(Icons.emoji_people, 'Dokter', 'Cari dokter'),
                        menu(Icons.local_hospital, 'Klinik',
                            'Daftar klinik terdekat'),
                        menu(Icons.nature_people, 'Perawat', 'Cari Perawat'),
                        menu(Icons.emoji_food_beverage, 'Apotek', 'Beli Obat'),
                      ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
