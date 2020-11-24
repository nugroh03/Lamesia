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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.centerRight,
              child: Column(
                children: [
                  Icon(
                    Icons.star,
                    size: 30,
                    color: red,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text('Unfavorite',
                      style: GoogleFonts.poppins(
                          fontSize: 12, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  ClipOval(
                    child: Container(
                      color: Colors.red[50],
                      height: MediaQuery.of(context).size.height * 0.15,
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Icon(
                        Icons.emoji_people,
                        size: 100,
                        color: red,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Nama Dokter',
                            style: GoogleFonts.poppins(
                                fontSize: 25, fontWeight: FontWeight.bold)),
                        Container(
                          child: Text('Dokter Umum',
                              style: GoogleFonts.poppins(
                                  fontSize: 18, color: grey2)),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.only(top: 10, left: 10),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
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
            SizedBox(
              height: 10,
            ),
            FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                color: red,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => BuatJanji()));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.3,
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
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  Widget dokumenvalidasi() {
    return Container(
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
                Icons.backpack,
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
                'Dokumen Validasi',
                style: GoogleFonts.poppins(fontSize: 20, color: black),
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
    );
  }

  Widget kualifikasi_dan_pengalman() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.08,
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
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Icon(
                Icons.backpack,
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
                'Kualifikasi dan Pengalaman',
                style: GoogleFonts.poppins(fontSize: 20, color: black),
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
    );
  }

  Widget personalInformation() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.08,
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
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Icon(
                Icons.backpack,
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
                'Personal Information',
                style: GoogleFonts.poppins(fontSize: 20, color: black),
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
    );
  }

  Widget reviews() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.08,
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
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Icon(
                Icons.backpack,
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
                'Reviews',
                style: GoogleFonts.poppins(fontSize: 20, color: black),
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
          color: white,
          child: Column(
            children: [
              photoprofil(),
              Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    dokumenvalidasi(),
                    SizedBox(
                      height: 10,
                    ),
                    kualifikasi_dan_pengalman(),
                    SizedBox(
                      height: 10,
                    ),
                    personalInformation(),
                    SizedBox(
                      height: 10,
                    ),
                    reviews(),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
