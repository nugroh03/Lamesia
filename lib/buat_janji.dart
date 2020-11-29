import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lamesia/menu_page.dart';
import 'color.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:table_calendar/table_calendar.dart';

class BuatJanji extends StatefulWidget {
  BuatJanji({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _BuatJanjiState createState() => _BuatJanjiState();
}

class _BuatJanjiState extends State<BuatJanji>
    with SingleTickerProviderStateMixin {
  String kelamin = 'Laki-laki';
  String alergi = 'Ya';
  String riwayatpenyakit = 'Ya';
  int _tabIndex = 0;
  TabController _tabController;
  CalendarController _controller;
  bool _blockvisible = false;
  bool _detailjanji = false;

  final isiklinik = new TextEditingController();
  final isidokter = new TextEditingController();
  final isitanggal = new TextEditingController();
  final isijam = new TextEditingController();

  final List<String> timejanji = [
    '07:00',
    '09:00',
    '14:00',
    '16:00',
    '19:00',
    '20:00',
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
    _controller = CalendarController();
  }

  void _toggleTab() {
    _tabIndex = _tabController.index + 1;
    _tabController.animateTo(_tabIndex);
  }

  Widget _block() {
    return Visibility(
      visible: _blockvisible,
      child: Material(
        color: Color.fromRGBO(0, 0, 0, 0.20),
        child: InkWell(
            onTap: () {
              this.setState(() {
                _blockvisible = false;
                _detailjanji = false;
              });
            },
            child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Color.fromRGBO(0, 0, 0, 0.20),
                child: Text(""))),
      ),
    );
  }

  Widget details() {
    return Container(
      padding: EdgeInsets.only(top: 10, right: 15, left: 15, bottom: 10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text('Photo Pasien',
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        )),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 5),
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
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.1,
                        ),
                        Flexible(
                          flex: 2,
                          child: FlatButton(
                            padding: EdgeInsets.only(left: 10, right: 10),
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
                            child: FittedBox(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: Icon(
                                      Icons.upload_file,
                                      color: Colors.red,
                                    ),
                                  ),
                                  Container(
                                    child: AutoSizeText(
                                      'UPLOAD PHOTO',
                                      maxLines: 2,
                                      maxFontSize: double.infinity,
                                      minFontSize: 5,
                                      style:
                                          GoogleFonts.poppins(color: textred),
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
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Nama Pasien',
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      )),
                  Container(
                    padding: EdgeInsets.only(top: 5),
                    height: MediaQuery.of(context).size.height * 0.07,
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
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Jenis Kelamin',
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      )),
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
                  Text('Tanggal Lahir',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      )),
                  Container(
                    padding: EdgeInsets.only(top: 5),
                    height: MediaQuery.of(context).size.height * 0.07,
                    child: TextField(
                      decoration: InputDecoration(
                        suffixIcon: Container(
                          padding: EdgeInsets.symmetric(vertical: 7),
                          child: SvgPicture.asset(
                            'assets/Icon-6.svg',
                            color: grey,
                            height: 10,
                            width: 10,
                          ),
                        ),
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
                  Text('Tuliskan Keluhan yang anda rasakan !',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      )),
                  Container(
                    padding: EdgeInsets.only(top: 5),
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(5),
                        hintText: 'Keluhan',
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
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Unggah File EHR / Hasil Lab, jika anda ingin',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      )),
                  SizedBox(
                    height: 5,
                  ),
                  Text('File ini hanya akan tersedia untuk dokter Anda',
                      style: GoogleFonts.poppins(
                          fontSize: 10, fontWeight: FontWeight.w500)),
                  SizedBox(
                    height: 5,
                  ),
                  FlatButton(
                    padding: EdgeInsets.only(left: 10, right: 10),
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
                    child: FittedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Icon(
                              Icons.upload_file,
                              color: Colors.red,
                            ),
                          ),
                          Container(
                            child: AutoSizeText(
                              'UPLOAD ',
                              maxLines: 2,
                              maxFontSize: double.infinity,
                              minFontSize: 5,
                              style: GoogleFonts.poppins(color: textred),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Pernahkan Anda mengunjungi dokter ini sebelumnya',
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: RadioGroup<String>.builder(
                      groupValue: kelamin,
                      onChanged: (value) => setState(() {
                        kelamin = value;
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

  Widget detailjanji() {
    return Visibility(
        visible: _detailjanji,
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
                    size: 60,
                  )),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Flexible(
                flex: 7,
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
                                child: AutoSizeText(
                                  'Sukses Membuat Janji',
                                  style: GoogleFonts.poppins(
                                      decoration: TextDecoration.none,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Flexible(
                                flex: 3,
                                child: AutoSizeText(
                                  'Anda berhasil membuat janji, pengingat disetel secara otomatis',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                    color: grey,
                                    decoration: TextDecoration.none,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 3,
                        child: Material(
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
                                      _detailjanji = false;
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

  Widget selesai() {
    return Container(
      padding: EdgeInsets.only(top: 10, right: 15, left: 15, bottom: 10),
      child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.7,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: SvgPicture.asset(
                  'assets/Icon-6.svg',
                  height: 70,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
              ),
              Container(
                child: Text(
                  'Sukses Membuat Janji',
                  style: GoogleFonts.poppins(
                      color: black, fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.005,
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  'Anda berhasil membuat janji, pengingat disetel secara otomatis',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    color: grey,
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              FlatButton(
                onPressed: () {
                  setState(() {
                    isiklinik.text = 'Nama Klinik';
                    isidokter.text = 'Nama Dokter';
                    isitanggal.text = '9 September 2020';
                    isijam.text = '14:00';
                    _blockvisible = true;
                    _detailjanji = true;
                  });
                },
                child: Container(
                  child: Text(
                    'View Detail',
                    style: GoogleFonts.poppins(
                        color: red, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget waktu() {
    return Container(
      padding: EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Container(
              decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: Offset(0, 2), // changes position of shadow
                    ),
                  ]),
              child: TableCalendar(
                  calendarStyle: CalendarStyle(selectedColor: red),
                  calendarController: _controller)),
          Container(
            alignment: Alignment.centerLeft,
            height: 50,
            child: Text(
              'Waktu Tersedia',
              style: GoogleFonts.poppins(color: black, fontSize: 16),
            ),
          ),
          Flexible(
            child: Container(
                alignment: Alignment.center,
                child: GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  childAspectRatio: 16 / 7,
                  crossAxisCount: 5,
                  children: timejanji
                      .map<Widget>((item) => Card(
                            shadowColor: grey,
                            color: white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(item),

                              /*child: FlatButton(
                                child: Container(
                                  padding: EdgeInsets.all(20),
                                  child: Image.asset(item),
                                ),
                                onPressed: () {
                                  setState(() {
                                    _blockvisible = true;
                                    _ceklist = true;
                                  });
                                },
                              ),*/
                            ),
                          ))
                      .toList(),
                )),
          ),
          Container(
            child: FlatButton(
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
          ),
        ],
      ),
    );
  }

  Widget home() {
    return Container(
      child: Scaffold(
        backgroundColor: white,
        appBar: PreferredSize(
            child: Container(
              alignment: Alignment.centerLeft,
              height: 100,
              padding: EdgeInsets.only(
                top: 30,
                left: 10,
              ),
              child: Row(
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
                          onPressed: () {}),
                    ),
                  ),
                  Flexible(
                    flex: 5,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        'Buat Janji',
                        style: GoogleFonts.poppins(
                          color: black,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            preferredSize: Size.fromHeight(100)),
        body: DefaultTabController(
          length: 3,
          child: Scaffold(
            backgroundColor: white,
            appBar: PreferredSize(
                child: TabBar(
                    controller: _tabController,
                    labelColor: Colors.black,
                    indicatorColor: red,
                    tabs: [
                      Tab(text: '1. WAKTU'),
                      Tab(text: '2. DETAILS'),
                      Tab(text: '3. SELESAI')
                    ]),
                preferredSize: Size.fromHeight(40)),
            body: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                controller: _tabController,
                children: [waktu(), details(), selesai()]),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Positioned(child: home()),
          Positioned(child: _block()),
          Center(child: detailjanji())
        ],
      ),
    );
  }
}
