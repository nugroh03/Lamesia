import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lamesia/daftarpage.dart';
import 'package:lamesia/datapersonal.dart';
import 'package:lamesia/gantipassword.dart';
import 'package:lamesia/gantipassword.dart';
import 'color.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class ProfilPengguna extends StatefulWidget {
  ProfilPengguna({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ProfilPenggunaState createState() => _ProfilPenggunaState();
}

class _ProfilPenggunaState extends State<ProfilPengguna> {
  bool _homeprofil = true;
  bool _ubahakun = false;

  @override
  void initState() {
    super.initState();
  }

  Widget menuprofil(
    icon,
    name,
  ) {
    return Container(
      decoration: BoxDecoration(
          border: Border(top: BorderSide(width: 1, color: gray3))),
      height: MediaQuery.of(context).size.height * 0.08,
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Icon(
                icon,
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
              width: MediaQuery.of(context).size.width,
              child: Text(
                name,
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

  Widget homeprofil() {
    return Visibility(
      visible: _homeprofil,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.85,
        width: MediaQuery.of(context).size.width * 0.9,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: 40,
                child: Text('Profil',
                    style: GoogleFonts.poppins(
                        fontSize: 30,
                        color: white,
                        fontWeight: FontWeight.bold))),
            Container(
              height: MediaQuery.of(context).size.height * 0.80,
              decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Column(
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.15,
                            width: MediaQuery.of(context).size.width * 0.15,
                            child: CircleAvatar(
                              maxRadius: 60,
                              backgroundColor: red,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Nama Pengguna',
                                    style: GoogleFonts.poppins(fontSize: 20)),
                                Text('20 Tahun',
                                    style: GoogleFonts.poppins(
                                        fontSize: 15, color: grey2)),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.only(left: 50, right: 50),
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            child: Column(
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  child: CircleAvatar(
                                    maxRadius: 60,
                                    backgroundColor: Colors.purple,
                                  ),
                                ),
                                Text('Dokter',
                                    style: GoogleFonts.poppins(
                                        fontSize: 15, color: grey2)),
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  child: CircleAvatar(
                                    maxRadius: 60,
                                    backgroundColor: green,
                                  ),
                                ),
                                Text('Catatan',
                                    style: GoogleFonts.poppins(
                                        fontSize: 15, color: grey2)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 3,
                    child: Container(
                      child: Column(
                        children: [
                          InkWell(
                            child: menuprofil(Icons.people, 'Ubah Akun'),
                            onTap: () {
                              setState(() {
                                _homeprofil = false;
                                _ubahakun = true;
                              });
                            },
                          ),
                          menuprofil(Icons.star, 'Beri Rating'),
                          menuprofil(Icons.question_answer, 'Bantuan'),
                          menuprofil(Icons.save, 'Kebijakan Privasi'),
                          menuprofil(Icons.file_copy, 'Ketentuan Layanan'),
                          menuprofil(Icons.exit_to_app, 'Exit'),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget ubahakun() {
    return Visibility(
      visible: _ubahakun,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.85,
        width: MediaQuery.of(context).size.width * 0.9,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: 40,
                width: MediaQuery.of(context).size.width,
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
                              color: white,
                              size: 30,
                            ),
                            onPressed: () {
                              setState(() {
                                _homeprofil = true;
                                _ubahakun = false;
                              });
                            }),
                      ),
                    ),
                    Flexible(
                      flex: 5,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Text('Rubah Akun',
                            style: GoogleFonts.poppins(
                                fontSize: 30,
                                color: white,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                )),
            Container(
              height: MediaQuery.of(context).size.height * 0.80,
              decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Column(
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.18,
                            width: MediaQuery.of(context).size.width * 0.25,
                            child: CircleAvatar(
                              backgroundColor: red,
                            ),
                          ),
                          FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                side: BorderSide(color: grey2)),
                            onPressed: () {},
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.camera_alt,
                                    color: grey2,
                                    size: 25,
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.03,
                                  ),
                                  Text('CHANGE PHOTO',
                                      style: GoogleFonts.poppins(
                                          fontSize: 15, color: grey2)),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(top: BorderSide(width: 1, color: grey2)),
                      ),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('NAMA',
                                    style: GoogleFonts.poppins(fontSize: 15)),
                                Container(
                                    padding:
                                        EdgeInsets.only(left: 20, right: 10),
                                    alignment: Alignment.centerLeft,
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    decoration: BoxDecoration(
                                        border: Border.all(width: 1),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))),
                                    child: Text('Nama',
                                        style: GoogleFonts.poppins(
                                          fontSize: 15,
                                          color: grey2,
                                        )))
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('E-MAIL',
                                    style: GoogleFonts.poppins(fontSize: 15)),
                                Container(
                                  padding: EdgeInsets.only(left: 20, right: 10),
                                  alignment: Alignment.centerLeft,
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  decoration: BoxDecoration(
                                      border: Border.all(width: 1),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5))),
                                  child: Text('namaemail@gmail.com',
                                      style: GoogleFonts.poppins(
                                        fontSize: 15,
                                        color: grey2,
                                      )),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(10),
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('PASSWORD',
                                    style: GoogleFonts.poppins(fontSize: 15)),
                                Container(
                                    padding:
                                        EdgeInsets.only(left: 20, right: 10),
                                    alignment: Alignment.centerLeft,
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    decoration: BoxDecoration(
                                        border: Border.all(width: 1),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('*****************',
                                            style: GoogleFonts.poppins(
                                              fontSize: 15,
                                              color: grey2,
                                            )),
                                        Icon(
                                          Icons.vpn_key,
                                          size: 25,
                                        )
                                      ],
                                    ))
                              ],
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                side: BorderSide(color: grey2)),
                            onPressed: () {},
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.camera_alt,
                                    color: grey2,
                                    size: 25,
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.03,
                                  ),
                                  Text('CHANGE PASSWORD',
                                      style: GoogleFonts.poppins(
                                          fontSize: 15, color: grey2)),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.08,
                          ),
                          FlatButton(
                              color: red,
                              textColor: white,
                              minWidth: MediaQuery.of(context).size.width * 0.8,
                              onPressed: () {
                                setState(() {
                                  _ubahakun = false;
                                  _homeprofil = true;
                                });
                              },
                              child: Text('OK'))
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Positioned(
              child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Flexible(
                  flex: 2,
                  child: Container(
                    color: red,
                  ),
                ),
                Flexible(
                  flex: 3,
                  child: Container(
                    color: white,
                  ),
                ),
              ],
            ),
          )),
          Center(child: homeprofil()),
          Center(child: ubahakun())
        ],
      ),
    );
  }
}
