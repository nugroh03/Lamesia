import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'color.dart';

class DaftarPage extends StatefulWidget {
  DaftarPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DaftarPageState createState() => _DaftarPageState();
}

class _DaftarPageState extends State<DaftarPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 50, left: 20, right: 20),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                height: 100,
                width: 300,
                child: Image.asset(
                  'assets/Logo Lamesia.png',
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Daftar',
                      style: GoogleFonts.roboto(
                          fontSize: 30,
                          color: textblack,
                          fontWeight: FontWeight.bold)),
                  Text('Masukkan data anda dengan benar',
                      style: GoogleFonts.roboto(fontSize: 15, color: textred)),
                ],
              )),
              SizedBox(
                height: 50,
              ),
              Container(
                child: Column(
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('NAMA', style: GoogleFonts.roboto(fontSize: 15)),
                          Container(
                            padding: EdgeInsets.only(top: 5),
                            height: 50,
                            child: TextField(
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(5),
                                hintText: 'Nama',
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 1)),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('EMAIL',
                              style: GoogleFonts.roboto(
                                fontSize: 15,
                              )),
                          Container(
                            padding: EdgeInsets.only(top: 5),
                            height: 50,
                            child: TextField(
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(5),
                                hintText: 'Email',
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 1)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('NOMOR HANDPHONE',
                              style: GoogleFonts.roboto(
                                fontSize: 15,
                              )),
                          Container(
                            padding: EdgeInsets.only(top: 5),
                            height: 50,
                            child: TextField(
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(5),
                                hintText: 'Nomor Hanphone',
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 1)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('PASSWORD',
                              style: GoogleFonts.roboto(
                                fontSize: 15,
                              )),
                          Container(
                            padding: EdgeInsets.only(top: 5),
                            height: 50,
                            child: TextField(
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(5),
                                hintText: 'Password',
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 1)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 80,
                    ),
                    FlatButton(
                        color: red,
                        onPressed: () {},
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            'DAFTAR',
                            style: GoogleFonts.roboto(
                                fontSize: 20, color: textwhite),
                          ),
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
