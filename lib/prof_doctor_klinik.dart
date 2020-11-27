import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lamesia/buat_janji.dart';
import 'package:lamesia/daftarpage.dart';
import 'package:lamesia/datapersonal.dart';
import 'package:lamesia/gantipassword.dart';
import 'package:lamesia/gantipassword.dart';
import 'color.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class ProfilDoctorKlinik extends StatefulWidget {
  ProfilDoctorKlinik({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ProfilDoctorKlinikState createState() => _ProfilDoctorKlinikState();
}

class _ProfilDoctorKlinikState extends State<ProfilDoctorKlinik> {
  @override
  void initState() {
    super.initState();
  }

  Widget photoprofil() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.45,
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
                blurRadius: 5,
                offset: Offset(0, 2), // changes position of shadow
              ),
            ]),
        padding: EdgeInsets.only(top: 10, left: 10, right: 10),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Flexible(
              flex: 1,
              child: Container(
                alignment: Alignment.centerRight,
                child: Column(
                  children: [
                    Icon(
                      Icons.star,
                      size: 20,
                      color: red,
                    ),
                    Text('Unfavorite',
                        style: GoogleFonts.poppins(
                            fontSize: 10, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 3,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child: ClipOval(
                        child: Container(
                          color: Colors.red[50],
                          height: MediaQuery.of(context).size.height * 0.1,
                          width: MediaQuery.of(context).size.width * 0.2,
                          child: Icon(
                            Icons.emoji_people,
                            size: 50,
                            color: red,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          AutoSizeText('Nama Dokter',
                              style: GoogleFonts.poppins(
                                  fontSize: 15, fontWeight: FontWeight.bold)),
                          AutoSizeText('Dokter Umum',
                              style: GoogleFonts.poppins(
                                  fontSize: 12, color: grey2)),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Flexible(
              flex: 2,
              child: Container(
                padding: EdgeInsets.only(top: 10, left: 10),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Container(
                        height: 60,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: Border(
                                right: BorderSide(width: 1, color: grey3),
                                bottom: BorderSide(width: 1, color: grey3))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.pin_drop_rounded,
                              size: 30,
                              color: red,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Lokasi Kerja',
                                      style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold)),
                                  Text('Klinik Praktek',
                                      style: GoogleFonts.poppins(
                                          fontSize: 12, color: grey2)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(width: 1, color: grey3))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.flash_on,
                              size: 30,
                              color: red,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('2 Tahun',
                                      style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold)),
                                  Text('Pengalaman',
                                      style: GoogleFonts.poppins(
                                          fontSize: 12, color: grey2)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Flexible(
              flex: 1,
              child: Container(
                height: 28,
                child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    color: red,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => BuatJanji()));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.28,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            child: SvgPicture.asset(
                              'assets/Icon-6.svg',
                              color: white,
                              height: 20,
                            ),
                          ),
                          Container(
                            child: Text('BUAT JANJI',
                                style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    color: white,
                                    fontWeight: FontWeight.bold)),
                          )
                        ],
                      ),
                    )),
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  Widget menuprofil(icon, title) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
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
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3,
                blurRadius: 5,
                offset: Offset(0, 2), // changes position of shadow
              ),
            ]),
        height: MediaQuery.of(context).size.height * 0.08,
        child: Row(
          children: [
            Flexible(
              flex: 1,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Icon(
                  icon,
                  color: red,
                  size: 40,
                ),
              ),
            ),
            Flexible(
              flex: 5,
              child: Container(
                alignment: Alignment.centerLeft,
                height: MediaQuery.of(context).size.height * 0.08,
                padding: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                    border: Border(left: BorderSide(width: 1, color: gray))),
                width: MediaQuery.of(context).size.width,
                child: Text(
                  title,
                  style: GoogleFonts.poppins(fontSize: 18, color: black),
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: gray,
                  size: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: white,
      appBar: PreferredSize(
          child: Container(
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(width: 1, color: red))),
            padding: EdgeInsets.only(left: 20, right: 20, top: 5),
            height: height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  flex: 3,
                  child: Container(
                    padding: EdgeInsets.only(top: 20),
                    alignment: Alignment.bottomLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                            alignment: Alignment.centerLeft,
                            child: InkWell(
                                child: Icon(Icons.arrow_back), onTap: () {})),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text('Profil Doctor',
                              style: GoogleFonts.poppins(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          preferredSize:
              Size.fromHeight(MediaQuery.of(context).size.height * 0.08)),
      body: Container(
          height: MediaQuery.of(context).size.height,
          color: white,
          child: Column(
            children: [
              photoprofil(),
              Flexible(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      menuprofil(Icons.message, 'Dokumen Validasi'),
                      menuprofil(Icons.message, 'Kualifikasi dan Pengalaman'),
                      menuprofil(Icons.message, 'Personal Information'),
                      menuprofil(Icons.message, 'Reviews'),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
