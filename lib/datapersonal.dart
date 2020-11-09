import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lamesia/menu_page.dart';

import 'color.dart';
import 'package:group_radio_button/group_radio_button.dart';

class DatapersonalPage extends StatefulWidget {
  DatapersonalPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DatapersonalPageState createState() => _DatapersonalPageState();
}

class _DatapersonalPageState extends State<DatapersonalPage>
    with SingleTickerProviderStateMixin {
  String kelamin = 'Laki-laki';
  String alergi = 'Ya';
  String riwayatpenyakit = 'Ya';
  int _tabIndex = 0;
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  void _toggleTab() {
    _tabIndex = _tabController.index + 1;
    _tabController.animateTo(_tabIndex);
  }

  Widget infoPersonal() {
    return Container(
      padding: EdgeInsets.only(top: 10, right: 15, left: 15, bottom: 10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 180,
              child: Column(
                children: [
                  Container(
                      child: Text(
                          'Tolong lengkapi profil Anda. Info ini mungkin berguna sebagai informasi tindakan',
                          style: GoogleFonts.poppins(fontSize: 15))),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Flexible(
                          flex: 1,
                          child: ClipOval(
                            child: Container(
                              color: grey3,
                              height: 80,
                              width: 80,
                              child: Icon(
                                Icons.camera_alt,
                                size: 40,
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child: Container(
                            padding: EdgeInsets.only(left: 20),
                            child: FlatButton(
                              color: Colors.red[50],
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      color: Colors.red,
                                      width: 1,
                                      style: BorderStyle.solid),
                                  borderRadius: BorderRadius.circular(
                                    6,
                                  )),
                              onPressed: () {},
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Icon(
                                      Icons.upload_file,
                                      color: Colors.red,
                                    ),
                                    Text(
                                      'UPLOAD PHOTO',
                                      style:
                                          GoogleFonts.poppins(color: textred),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
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
                            borderSide:
                                BorderSide(color: Colors.white, width: 1)),
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
                  Text('JENIS KELAMIN',
                      style: GoogleFonts.poppins(fontSize: 15)),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: RadioGroup<String>.builder(
                      groupValue: kelamin,
                      onChanged: (value) => setState(() {
                        kelamin = value;
                      }),
                      items: ['Laki-laki', 'Perempuan'],
                      itemBuilder: (item) => RadioButtonBuilder(
                        item,
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
                            borderSide:
                                BorderSide(color: Colors.white, width: 1)),
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
                            borderSide:
                                BorderSide(color: Colors.white, width: 1)),
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
                            borderSide:
                                BorderSide(color: Colors.white, width: 1)),
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
                onPressed: () {
                  _toggleTab();
                },
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    'BERIKUT',
                    style: GoogleFonts.poppins(fontSize: 20, color: textwhite),
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Widget infoKesehatan() {
    return Container(
      padding: EdgeInsets.only(top: 10, right: 15, left: 15, bottom: 10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('BERAT BADAN', style: GoogleFonts.poppins(fontSize: 15)),
                  Container(
                    padding: EdgeInsets.only(top: 5),
                    height: 50,
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(5),
                        hintText: 'Berat badan',
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 1)),
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
                  Text('TINGGI BADAN',
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                      )),
                  Container(
                    padding: EdgeInsets.only(top: 5),
                    height: 50,
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(5),
                        hintText: 'Tinggi badan',
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 1)),
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
                  Text('GOLONGAN DARAH',
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                      )),
                  Container(
                    padding: EdgeInsets.only(top: 5),
                    height: 50,
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(5),
                        hintText: 'Golongan darah',
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 1)),
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
                  Text('REAKSI ALERGI',
                      style: GoogleFonts.poppins(fontSize: 15)),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: RadioGroup<String>.builder(
                      groupValue: alergi,
                      onChanged: (value) => setState(() {
                        alergi = value;
                      }),
                      items: ['Ya', 'Tidak'],
                      itemBuilder: (item) => RadioButtonBuilder(
                        item,
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
                  Text('MEMILIKI RIWAYAT PENYAKIT',
                      style: GoogleFonts.poppins(fontSize: 15)),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: RadioGroup<String>.builder(
                      groupValue: riwayatpenyakit,
                      onChanged: (value) => setState(() {
                        riwayatpenyakit = value;
                      }),
                      items: ['Ya', 'Tidak'],
                      itemBuilder: (item) => RadioButtonBuilder(
                        item,
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
                onPressed: () {
                  setState(() {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MenuPage()));
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    'BUAT AKUN',
                    style: GoogleFonts.poppins(fontSize: 20, color: textwhite),
                  ),
                )),
          ],
        ),
      ),
    );
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
                    controller: _tabController,
                    labelColor: Colors.black,
                    indicatorColor: red,
                    tabs: [
                      Tab(
                        text: 'INFO PERSONAL',
                      ),
                      Tab(text: 'INFO KESEHATAN')
                    ]),
                preferredSize: Size.fromHeight(40)),
            body: TabBarView(
                controller: _tabController,
                children: [infoPersonal(), infoKesehatan()]),
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
