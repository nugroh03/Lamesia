import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'color.dart';

class DatapersonalPage extends StatefulWidget {
  DatapersonalPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DatapersonalPageState createState() => _DatapersonalPageState();
}

class _DatapersonalPageState extends State<DatapersonalPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: Container(
            alignment: Alignment.centerLeft,
            height: 100,
            padding: EdgeInsets.only(
              top: 30,
              left: 30,
            ),
            child: Text(
              'Data Personal',
              style: GoogleFonts.poppins(
                color: black,
                fontSize: 25,
              ),
            ),
          ),
          preferredSize: Size.fromHeight(100)),
      body: Container(
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: PreferredSize(
                child: TabBar(
                    labelColor: Colors.black,
                    indicatorColor: red,
                    tabs: [
                      Tab(
                        text: 'INFO PERSONAL',
                      ),
                      Tab(text: 'INFO KESEHATAN')
                    ]),
                preferredSize: Size.fromHeight(40)),
            body: TabBarView(children: [
              Container(
                padding: EdgeInsets.all(5),
                child: Column(
                  children: [
                    Container(
                      height: 200,
                      child: Column(
                        children: [
                          Container(
                              child: Text(
                                  'Tolong lengkapi profil Anda. Info ini mungkin berguna sebagai informasi tindakan',
                                  style: GoogleFonts.poppins(fontSize: 15))),
                          Container(
                            child: Row(
                              children: [
                                Container(
                                  color: Colors.red,
                                ),
                                Container(
                                  color: Colors.blue,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('NAMA LENGKAP',
                              style: GoogleFonts.poppins(fontSize: 15)),
                          Container(
                            padding: EdgeInsets.only(top: 5),
                            height: 50,
                            child: TextField(
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(5),
                                hintText: 'Nama Lengkap',
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
                          Text('TANGGAL LAHIR',
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                              )),
                          Container(
                            padding: EdgeInsets.only(top: 5),
                            height: 50,
                            child: TextField(
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(5),
                                hintText: 'Tanggal Lahir',
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
                          Text('KOTA',
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                              )),
                          Container(
                            padding: EdgeInsets.only(top: 5),
                            height: 50,
                            child: TextField(
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(5),
                                hintText: 'Kota',
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
                          Text('ALAMAT',
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                              )),
                          Container(
                            padding: EdgeInsets.only(top: 5),
                            height: 50,
                            child: TextField(
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(5),
                                hintText: 'Alamat',
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
                      height: 50,
                    ),
                    FlatButton(
                        color: red,
                        onPressed: () {},
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            'BERIKUT',
                            style: GoogleFonts.poppins(
                                fontSize: 20, color: textwhite),
                          ),
                        )),
                  ],
                ),
              ),
              Container(
                  height: MediaQuery.of(context).size.height,
                  padding: EdgeInsets.only(left: 15, right: 15),
                  alignment: Alignment.topCenter,
                  child: ListView(
                    children: [
                      SizedBox(
                        height: 50,
                      )
                    ],
                  ))
            ]),
          ),
        ),
      ),
    );

    /*Scaffold(
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
                      style: GoogleFonts.poppins(
                          fontSize: 30,
                          color: textblack,
                          fontWeight: FontWeight.bold)),
                  Text('Masukkan data anda dengan benar',
                      style: GoogleFonts.poppins(fontSize: 15, color: textred)),
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
                          Text('NAMA', style: GoogleFonts.poppins(fontSize: 15)),
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
                              style: GoogleFonts.poppins(
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
                              style: GoogleFonts.poppins(
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
                              style: GoogleFonts.poppins(
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
                            style: GoogleFonts.poppins(
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
    );*/
  }
}
