import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lamesia/daftarpage.dart';
import 'package:lamesia/datapersonal.dart';
import 'package:lamesia/gantipassword.dart';
import 'package:lamesia/gantipassword.dart';
import 'profil_doctor.dart';
import 'color.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class MyDokterPage extends StatefulWidget {
  MyDokterPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyDokterPageState createState() => _MyDokterPageState();
}

class _MyDokterPageState extends State<MyDokterPage> {
  @override
  void initState() {
    super.initState();
  }

  Widget menu(
    image,
    title,
  ) {
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
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 3,
              blurRadius: 5,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ]),
      padding: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
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
                      image,
                      size: 40,
                      color: red,
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title,
                          style: GoogleFonts.poppins(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        child: Text('Dokter Umum',
                            style: GoogleFonts.poppins(
                                fontSize: 12, color: grey2)),
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
            padding: EdgeInsets.only(top: 10, left: 20),
            alignment: Alignment.centerRight,
            child: FlatButton(
              color: Colors.red[50],
              padding: EdgeInsets.zero,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfilDoctor()));
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.2,
                child: Row(
                  children: [
                    Icon(
                      Icons.person,
                      size: 20,
                      color: red,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Profil',
                        style: GoogleFonts.poppins(fontSize: 15, color: red)),
                  ],
                ),
              ),
            ),
          )
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
            padding: EdgeInsets.only(left: 20, right: 20, top: 30),
            height: height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Flexible(
                  flex: 3,
                  child: Container(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Dokter Ku',
                        style: GoogleFonts.poppins(
                            color: black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          preferredSize:
              Size.fromHeight(MediaQuery.of(context).size.height * 0.08)),
      body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Text('Daftar Dokter',
                    style: GoogleFonts.poppins(
                        fontSize: 20, fontWeight: FontWeight.bold)),
              ),
              SizedBox(
                height: 10,
              ),
              menu(
                Icons.emoji_people,
                'Nama Dokter',
              ),
            ],
          )),
    );
  }
}
