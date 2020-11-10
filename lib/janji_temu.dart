import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lamesia/menu_page.dart';
import 'package:lamesia/profil_doctor.dart';

import 'color.dart';
import 'package:group_radio_button/group_radio_button.dart';

class JanjiTemu extends StatefulWidget {
  JanjiTemu({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _JanjiTemuState createState() => _JanjiTemuState();
}

class _JanjiTemuState extends State<JanjiTemu>
    with SingleTickerProviderStateMixin {
  int _tabIndex = 0;
  TabController _tabController;
  TabController _tabdetails;
  bool _jtvisible = true;
  bool _detailvisible = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  void _toggleTab() {
    _tabIndex = _tabController.index + 1;
    _tabController.animateTo(_tabIndex);
  }

  Widget menu(
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
            padding: EdgeInsets.only(top: 10, left: 20),
            alignment: Alignment.centerRight,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.2,
              child: Row(
                children: [
                  Icon(
                    Icons.lock_clock,
                    size: 20,
                    color: grey2,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('1 jam',
                      style: GoogleFonts.poppins(fontSize: 15, color: grey2)),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration:
                BoxDecoration(border: Border(top: BorderSide(width: 1))),
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
                      style: GoogleFonts.poppins(fontSize: 15, color: grey2)),
                ),
                Container(
                  child: FlatButton(
                    color: Colors.green[50],
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      setState(() {
                        _jtvisible = false;
                        _detailvisible = true;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      child: Text('DETAIL',
                          style: GoogleFonts.poppins(
                              fontSize: 17, color: Colors.green)),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget janjiTemu() {
    return Visibility(
      visible: _jtvisible,
      child: Scaffold(
        appBar: PreferredSize(
            child: Container(
              alignment: Alignment.centerLeft,
              height: 100,
              padding: EdgeInsets.only(top: 30, left: 30, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Data Personal',
                    style: GoogleFonts.poppins(
                      color: black,
                      fontSize: 25,
                    ),
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.notifications_none,
                        size: 35,
                      ),
                      onPressed: () {})
                ],
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
                          child: Text(
                            'YANG AKAN',
                            style: GoogleFonts.poppins(
                              color: black,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'YANG LALU',
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
                      padding: EdgeInsets.all(20),
                      child: ListView(
                        children: [
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

  Widget menudetail2() {
    return Container(
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
                Text('Kessimpulan Pemeriksaan',
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
              padding: EdgeInsets.all(10),
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
                    style:
                        GoogleFonts.poppins(fontSize: 25, color: Colors.red)),
              ))
        ],
      ),
    );
  }

  Widget details() {
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
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [janjiTemu(), details()],
      ),
    );
  }
}
