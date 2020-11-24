import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/avd.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lamesia/daftarpage.dart';
import 'package:lamesia/datapersonal.dart';
import 'package:lamesia/gantipassword.dart';
import 'package:lamesia/gantipassword.dart';
import 'package:lamesia/klinikpage.dart';
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

  Widget menu(image, title, ket, onpres) {
    return FlatButton(
      padding: EdgeInsets.zero,
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3,
                blurRadius: 3,
                offset: Offset(0, 2), // changes position of shadow
              ),
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 80,
              height: 80,
              child: CircleAvatar(
                  backgroundColor: Colors.red[50],
                  child: SvgPicture.asset(
                    image,
                    height: 55,
                    width: 55,
                  )),
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
      ),
      onPressed: onpres,
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      child: Scaffold(
        backgroundColor: white,
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
          padding: EdgeInsets.only(top: 20),
          color: white,
          height: height,
          child: Column(
            children: [
              Flexible(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, right: 20, left: 20),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: Offset(0, 2), // changes position of shadow
                          ),
                        ]),
                    padding: EdgeInsets.all(5),
                    child: Row(
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Container(
                                height: 60,
                                width: 60,
                                child: CircleAvatar(
                                  backgroundColor: Colors.red[50],
                                  child: SvgPicture.asset(
                                    'assets/noun_Ambulance_1908521.svg',
                                    height: 40,
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
                        Icon(
                          Icons.arrow_forward_ios_sharp,
                          color: red,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Flexible(
                flex: 8,
                child: Container(
                  color: white,
                  alignment: Alignment.center,
                  child: GridView.count(
                      padding: EdgeInsets.only(
                          top: 10, right: 20, left: 20, bottom: 20),
                      physics: NeverScrollableScrollPhysics(),
                      childAspectRatio: 1.4 / 1.2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      crossAxisCount: 2,
                      children: [
                        menu('assets/Group 84.svg', 'Dokter', 'Cari dokter',
                            () {}),
                        menu('assets/Group 85.svg', 'Klinik',
                            'Daftar klinik terdekat', () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => KlinikPage()));
                        }),
                        menu('assets/Path 6572.svg', 'Perawat', 'Cari Perawat',
                            () {}),
                        menu('assets/noun_Pharmacy_2080745.svg', 'Apotek',
                            'Beli Obat', () {}),
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
