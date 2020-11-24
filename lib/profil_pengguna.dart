import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lamesia/daftarpage.dart';
import 'package:lamesia/datapersonal.dart';
import 'package:lamesia/gantipassword.dart';
import 'package:lamesia/gantipassword.dart';
import 'color.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'config.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_easyloading/flutter_easyloading.dart';

class ProfilPengguna extends StatefulWidget {
  ProfilPengguna({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ProfilPenggunaState createState() => _ProfilPenggunaState();
}

class _ProfilPenggunaState extends State<ProfilPengguna> {
  bool _homeprofil = true;
  bool _ubahakun = false;
  final _nama = TextEditingController();
  final _email = TextEditingController();
  final _sandi = TextEditingController();

  Map users = {
    '_id': 0,
    'name': '',
    'email': '',
    'sandi': '',
  };

  @override
  void initState() {
    super.initState();

    _nama.text = '';
    _email.text = '';
    _sandi.text = '';
    getUser();
  }

  void getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final datauser = prefs.getString('users');
    print(datauser);
    setState(() {
      users = json.decode(datauser);
    });
  }

  void updateuser() async {
    print('akses api');

    Map data = {
      '_id': users['_id'],
      'name': _nama.text,
      'email': _email.text,
      'password': _sandi.text,
    };
    //encode Map to JSON
    var body = json.encode(data);
    print(body);
    var url = apiurl + 'update_user';

    // Await the http get response, then decode the json-formatted response.
    var response = await http.put(url,
        headers: {"Content-Type": "application/json"}, body: body);
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      var responses = Responses(jsonResponse);

      if (responses.success == "true") {
        print('users: ' + json.encode(responses.data));
        setState(() {
          _ubahakun = false;
          _homeprofil = true;
        });
        getUser();
      } else {
        _alert('Gagal', 'Silahkan Coba Lagi!');
      }
    } else {
      //print('Request failed with status: ${response.statusCode}.');
      _alert('Gagal', 'Silahkan Coba Lagi');
    }
  }

  Future<void> _alert(title, message) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(message),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
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
                color: grey,
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
        padding: EdgeInsets.only(top: 20),
        height: MediaQuery.of(context).size.height * 0.95,
        width: MediaQuery.of(context).size.width * 0.9,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: MediaQuery.of(context).size.height * 0.07,
                child: Text('Profil',
                    style: GoogleFonts.poppins(
                        fontSize: 30,
                        color: white,
                        fontWeight: FontWeight.bold))),
            Container(
              height: MediaQuery.of(context).size.height * 0.8,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: Offset(0, 2), // changes position of shadow
                    ),
                  ]),
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
                                Text(users['name'],
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
                                _nama.text = users['name'];
                                _email.text = users['email'];
                                _sandi.text = users['password'];
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
                                  height: 40,
                                  child: TextField(
                                    controller: _nama,
                                    decoration: InputDecoration(
                                        contentPadding:
                                            EdgeInsets.only(left: 15),
                                        suffixIcon: Icon(
                                          Icons.people,
                                          size: 30,
                                          color: black,
                                        ),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(width: 1),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5))),
                                        hintText: 'Nama'),
                                  ),
                                )
                                // Container(
                                //     padding:
                                //         EdgeInsets.only(left: 20, right: 10),
                                //     alignment: Alignment.centerLeft,
                                //     width: MediaQuery.of(context).size.width,
                                //     height: MediaQuery.of(context).size.height *
                                //         0.05,
                                //     decoration: BoxDecoration(
                                //         border: Border.all(width: 1),
                                //         borderRadius: BorderRadius.all(
                                //             Radius.circular(5))),
                                //     child: Text('Nama',
                                //         style: GoogleFonts.poppins(
                                //           fontSize: 15,
                                //           color: grey2,
                                //         )))
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
                                  height: 40,
                                  child: TextField(
                                    controller: _email,
                                    decoration: InputDecoration(
                                        contentPadding:
                                            EdgeInsets.only(left: 15),
                                        suffixIcon: Icon(
                                          Icons.message,
                                          size: 30,
                                          color: black,
                                        ),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(width: 1),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5))),
                                        hintText: 'Email'),
                                  ),
                                )
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
                                  height: 40,
                                  child: TextField(
                                    controller: _sandi,
                                    decoration: InputDecoration(
                                        contentPadding:
                                            EdgeInsets.only(left: 15),
                                        suffixIcon: Icon(
                                          Icons.vpn_lock,
                                          size: 30,
                                          color: black,
                                        ),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(width: 1),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5))),
                                        hintText: 'Password'),
                                  ),
                                )
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
                                updateuser();
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
    return SingleChildScrollView(
      child: Container(
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
      ),
    );
  }
}

class Responses {
  String success;
  String message;
  String data;
  Responses(Map<String, dynamic> item) {
    success = item['success'];
    message = item['message'];
    data = item['data'];
  }
}
