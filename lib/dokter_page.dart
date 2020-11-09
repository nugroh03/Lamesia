import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lamesia/daftarpage.dart';
import 'package:lamesia/datapersonal.dart';
import 'package:lamesia/gantipassword.dart';
import 'package:lamesia/gantipassword.dart';
import 'package:lamesia/profil_doctor.dart';
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
    return FlatButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ProfilDoctor()));
      },
      child: Container(
        padding: EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
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
                onPressed: () {},
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
                        width: 20,
                      ),
                      Text('Profil',
                          style: GoogleFonts.poppins(fontSize: 12, color: red)),
                    ],
                  ),
                ),
              ),
            )
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
                          child: Text('Dokter Ku',
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
