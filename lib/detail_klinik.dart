import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lamesia/buat_janji.dart';
import 'package:lamesia/klinikpage.dart';
import 'package:lamesia/menu_page.dart';
import 'package:lamesia/prof_doctor_klinik.dart';
import 'package:lamesia/profil_doctor.dart';

import 'color.dart';
import 'package:group_radio_button/group_radio_button.dart';

class DetailKlinik extends StatefulWidget {
  DetailKlinik({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DetailKlinikState createState() => _DetailKlinikState();
}

class _DetailKlinikState extends State<DetailKlinik>
    with SingleTickerProviderStateMixin {
  int _tabIndex = 0;
  TabController _tabController;
  TabController _tabdetails;
  bool _jtvisible = true;
  bool _detailvisible = false;
  bool _profildoctor = false;
  bool _blockvisible = false;
  bool _notifdetailklinik = false;
  final isiklinik = new TextEditingController();
  final isidokter = new TextEditingController();
  final isitanggal = new TextEditingController();
  final isijam = new TextEditingController();

  @override
  void initState() {
    super.initState();
    isiklinik.text = 'Nama Klinik';
    _tabController = TabController(vsync: this, length: 2);
  }

  void _toggleTab() {
    _tabIndex = _tabController.index + 1;
    _tabController.animateTo(_tabIndex);
  }

  Widget _block() {
    return Visibility(
      visible: _blockvisible,
      child: InkWell(
          onTap: () {
            this.setState(() {
              _blockvisible = false;
              _notifdetailklinik = false;
            });
          },
          child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Color.fromRGBO(0, 0, 0, 0.20),
              child: Text(""))),
    );
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
      padding: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 0),
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
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
            height: 15,
          ),
          Container(
            padding: EdgeInsets.only(
              top: 20,
              left: 20,
            ),
            alignment: Alignment.bottomRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Flexible(
                  flex: 1,
                  child: FlatButton(
                    height: 20,
                    padding: EdgeInsets.all(5),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: BorderSide(color: Colors.red)),
                    color: Colors.red[50],
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfilDoctorKlinik()));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Flexible(
                            flex: 1,
                            child: Container(
                              child: Icon(
                                Icons.person,
                                size: 20,
                                color: red,
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: Container(
                              alignment: Alignment.centerLeft,
                              child: Text('Profil',
                                  style: GoogleFonts.poppins(
                                      fontSize: 12, color: red)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.05,
                ),
                Flexible(
                  flex: 1,
                  child: FlatButton(
                    height: 20,
                    padding: EdgeInsets.all(5),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: BorderSide(color: Colors.red)),
                    color: Colors.red[50],
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => BuatJanji()));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.25,
                      height: 20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Flexible(
                            flex: 1,
                            child: Container(
                              alignment: Alignment.centerLeft,
                              child: SvgPicture.asset(
                                'assets/Icon-6.svg',
                                height: 20,
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 2,
                            child: Container(
                              alignment: Alignment.centerLeft,
                              child: AutoSizeText('Buat janji ',
                                  style: GoogleFonts.poppins(
                                      fontSize: 12, color: red)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget notifdetailklinik() {
    return Visibility(
        visible: _notifdetailklinik,
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          height: MediaQuery.of(context).size.height * 0.75,
          width: MediaQuery.of(context).size.width * 0.9,
          child: Column(
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  alignment: Alignment.center,
                  child: Container(
                      child: Icon(
                    Icons.calendar_today,
                    color: Colors.red,
                    size: 80,
                  )),
                ),
              ),
              Flexible(
                flex: 4,
                child: Container(
                  child: Column(
                    children: [
                      Flexible(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(left: 10, right: 10),
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: [
                              Flexible(
                                flex: 1,
                                child: Text(
                                  'Janji Temu Anda',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Flexible(
                                flex: 3,
                                child: Text(
                                  'Segera untuk menemui dokter anda tepat sesuai dengan waktu yang telah anda tentukan',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              TextField(
                                controller: isiklinik,
                                decoration: InputDecoration(
                                    suffixIcon: Icon(
                                      Icons.local_hospital,
                                      size: 30,
                                    ),
                                    labelStyle: TextStyle(
                                      fontSize: 20,
                                    ),
                                    labelText: 'Klinik',
                                    hintStyle: TextStyle(color: grey3),
                                    hintText: 'Nama Klinik'),
                              ),
                              TextField(
                                controller: isidokter,
                                decoration: InputDecoration(
                                  suffixIcon: Icon(
                                    Icons.people,
                                    size: 30,
                                  ),
                                  labelStyle: TextStyle(
                                    fontSize: 20,
                                  ),
                                  labelText: 'Dokter',
                                ),
                              ),
                              TextField(
                                controller: isitanggal,
                                decoration: InputDecoration(
                                  suffixIcon: Icon(
                                    Icons.calendar_today,
                                    size: 30,
                                  ),
                                  labelStyle: TextStyle(
                                    fontSize: 20,
                                  ),
                                  labelText: 'Tanggal',
                                ),
                              ),
                              TextField(
                                controller: isijam,
                                decoration: InputDecoration(
                                  suffixIcon: Icon(
                                    Icons.lock_clock,
                                    size: 30,
                                  ),
                                  labelStyle: TextStyle(
                                    fontSize: 20,
                                  ),
                                  labelText: 'Jam',
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              FlatButton(
                                  color: red,
                                  textColor: white,
                                  minWidth:
                                      MediaQuery.of(context).size.width * 0.4,
                                  onPressed: () {
                                    setState(() {
                                      _blockvisible = false;
                                      _notifdetailklinik = false;
                                      _jtvisible = true;
                                    });
                                  },
                                  child: Text('OK'))
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }

  Widget detailKlinik() {
    return Visibility(
      visible: _jtvisible,
      child: Scaffold(
        backgroundColor: white,
        appBar: PreferredSize(
            child: Container(
              alignment: Alignment.centerLeft,
              height: 100,
              padding: EdgeInsets.only(top: 30, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      width: MediaQuery.of(context).size.width,
                      child: IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            size: 30,
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => KlinikPage()));
                          }),
                    ),
                  ),
                  Flexible(
                    flex: 6,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        'Nama Klinik',
                        style: GoogleFonts.poppins(
                            color: black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            preferredSize: Size.fromHeight(100)),
        body: Container(
          child: DefaultTabController(
            length: 2,
            child: Scaffold(
              backgroundColor: white,
              appBar: PreferredSize(
                  child: TabBar(
                      controller: _tabController,
                      labelColor: Colors.black,
                      indicatorColor: red,
                      tabs: [
                        Tab(
                          child: Text(
                            'DOKTER',
                            style: GoogleFonts.poppins(
                              color: black,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'FASILITAS',
                            style: GoogleFonts.poppins(
                              color: black,
                              fontSize: 18,
                            ),
                          ),
                        )
                      ]),
                  preferredSize: Size.fromHeight(40)),
              body: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: _tabController,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                      child: ListView(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            height: 50,
                            child: Text('Daftar Dokter',
                                style: GoogleFonts.poppins(
                                    fontSize: 20, color: grey2)),
                          ),
                          menu(
                            Icons.emoji_people,
                            'Nama Dokter',
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: ListView(children: [
                        menu(
                          Icons.emoji_people,
                          'Nama Dokter',
                        ),
                      ]),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }

// DETAILS

  Widget menudetail(
    image,
    title,
  ) {
    return Container(
      padding: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      color: white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
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
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                border: Border(top: BorderSide(width: 1, color: grey3))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Text('0 hari',
                      style: GoogleFonts.poppins(fontSize: 15, color: grey2)),
                ),
                Container(
                  child: Text('9 September, 14:00 ',
                      style: GoogleFonts.poppins(fontSize: 15, color: black)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  /*Widget menudetail2() {
    return Container(
      padding: EdgeInsets.all(10),
      color: white,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(width: 1, color: grey3))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Keluhan',
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                    )),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 9,
                        child: Container(
                          child: Text(
                              'merasa pusing, mual, susah tidur dan badan terasa lemas'),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Container(
                          child: Icon(Icons.arrow_downward),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(width: 1, color: grey3))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Kesimpulan Pemeriksaan',
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                    )),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 9,
                        child: Container(
                          child: Text(
                              'merasa pusing, mual, susah tidur dan badan terasa lemas'),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Container(
                          child: Icon(Icons.arrow_downward),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(width: 1, color: grey3))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Diagnosa',
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                    )),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 9,
                        child: Container(
                          child: Text('Detail diagnosa'),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Container(
                          child: Icon(Icons.arrow_downward),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
          Container(
              child: Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.red[50],
                border: Border.all(width: 1, color: Colors.red),
                borderRadius: BorderRadius.all(Radius.circular(4))),
            child: Text('Migrane',
                style: GoogleFonts.poppins(fontSize: 25, color: Colors.red)),
          ))
        ],
      ),
    );
  }*/

  /*Widget details() {
    return Visibility(
      visible: _detailvisible,
      child: Scaffold(
        appBar: PreferredSize(
            child: Container(
              alignment: Alignment.centerLeft,
              height: 100,
              padding: EdgeInsets.only(top: 30, left: 10, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        size: 35,
                      ),
                      onPressed: () {
                        setState(() {
                          _jtvisible = true;
                          _detailvisible = false;
                        });
                      }),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'Details',
                    style: GoogleFonts.poppins(
                      color: black,
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
            ),
            preferredSize: Size.fromHeight(100)),
        body: Scaffold(
          appBar: PreferredSize(
              child: menudetail(
                Icons.emoji_people,
                'Nama Dokter',
              ),
              preferredSize: Size.fromHeight(150)),
          body: Container(
            child: DefaultTabController(
              length: 2,
              child: Scaffold(
                appBar: PreferredSize(
                    child: Container(
                      color: white,
                      child: TabBar(
                          unselectedLabelColor: black,
                          controller: _tabdetails,
                          labelColor: Colors.red,
                          indicatorColor: red,
                          tabs: [
                            Tab(
                              child: Text(
                                'DETAIL',
                                style: GoogleFonts.poppins(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Tab(
                              child: Text(
                                'PEMBAYARAN',
                                style: GoogleFonts.poppins(
                                  fontSize: 18,
                                ),
                              ),
                            )
                          ]),
                    ),
                    preferredSize: Size.fromHeight(40)),
                body: TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    controller: _tabdetails,
                    children: [
                      Container(
                        color: white,
                        child: menudetail2(),
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        child: ListView(children: [
                          menu(
                            Icons.emoji_people,
                            'Nama Dokter',
                          ),
                        ]),
                      ),
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }*/

  @override
  Widget build(BuildContext context) {
    return Container(
      color: white,
      child: Stack(
        children: [
          Positioned(child: detailKlinik()),
          Positioned(child: _block()),
          Center(child: notifdetailklinik())
        ],
      ),
    );
  }
}
