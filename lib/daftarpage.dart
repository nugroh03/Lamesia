import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lamesia/datapersonal.dart';
import 'package:lamesia/menu_page.dart';
import 'color.dart';
import 'dart:convert';
import 'config.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class DaftarPage extends StatefulWidget {
  DaftarPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DaftarPageState createState() => _DaftarPageState();
}

class _DaftarPageState extends State<DaftarPage> {
  final nama = TextEditingController();
  final email = TextEditingController();
  final phone = TextEditingController();
  final password = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  void createuser() async {
    print('akses api');

    Map data = {
      'name': nama.text,
      'email': email.text,
      'phone': phone.text,
      'password': password.text,
    };
    //encode Map to JSON
    var body = json.encode(data);
    print(body);
    var url = apiurl + 'create_user';

    // Await the http get response, then decode the json-formatted response.
    var response = await http.post(url,
        headers: {"Content-Type": "application/json"}, body: body);
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      var responses = Responses(jsonResponse);

      if (responses.success == "true") {
        print('create_user: ' + json.encode(responses.data));

        Navigator.push(context,
            MaterialPageRoute(builder: (context) => DatapersonalPage()));
      } else {}
    } else {}
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
                height: 30,
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
                height: 30,
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
                              controller: nama,
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
                              controller: email,
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
                              controller: phone,
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
                              controller: password,
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
                        onPressed: () {
                          createuser();

                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => DatapersonalPage()));
                        },
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
