import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lamesia/daftarpage.dart';
import 'package:lamesia/datapersonal.dart';
import 'package:lamesia/gantipassword.dart';
import 'package:lamesia/gantipassword.dart';
import 'color.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class ProfilDoctor extends StatefulWidget {
  ProfilDoctor({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ProfilDoctorState createState() => _ProfilDoctorState();
}

class _ProfilDoctorState extends State<ProfilDoctor> {
  @override
  void initState() {
    super.initState();
  }

  Widget photoprofil() {
    return Container(
      padding: EdgeInsets.only(top: 20),
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Column(
              children: [
                SizedBox(height: 30),
                ClipOval(
                  child: Container(
                    color: Colors.red[50],
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.4,
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
            height: 40,
          ),
          Container(
            padding: EdgeInsets.only(top: 10, left: 10),
            alignment: Alignment.centerRight,
            child: Container(
              padding: EdgeInsets.only(left: 20, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
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
                  Container(
                    child: Row(
                      children: [
                        Icon(
                          Icons.star,
                          size: 30,
                          color: red,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Unfavorite',
                            style: GoogleFonts.poppins(
                                fontSize: 12, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  Widget dokumenvalidasi() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.08,
      color: white,
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
              decoration:
                  BoxDecoration(border: Border(left: BorderSide(width: 1))),
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
                color: grey2,
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
      color: white,
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
              decoration:
                  BoxDecoration(border: Border(left: BorderSide(width: 1))),
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
                color: grey2,
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
      color: white,
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
              decoration:
                  BoxDecoration(border: Border(left: BorderSide(width: 1))),
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
                color: grey2,
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
      color: white,
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
              decoration:
                  BoxDecoration(border: Border(left: BorderSide(width: 1))),
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
                color: grey2,
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
      backgroundColor: grey3,
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
