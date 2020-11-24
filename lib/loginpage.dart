import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lamesia/daftarpage.dart';
import 'package:lamesia/datapersonal.dart';
import 'package:lamesia/gantipassword.dart';
import 'package:lamesia/gantipassword.dart';
import 'package:lamesia/menu_page.dart';
import 'dart:convert';
import 'config.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'color.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final phone = new TextEditingController();
  final password = new TextEditingController();

  @override
  void initState() {
    super.initState();

    phone.text = '';
    password.text = '';
  }

  void login() async {
    print('onchange');

    Map data = {'phone': phone.text, 'password': password.text};
    //encode Map to JSON
    var body = json.encode(data);
    var url = apiurl + 'login_user';

    // Await the http get response, then decode the json-formatted response.
    var response = await http.post(url,
        headers: {"Content-Type": "application/json"}, body: body);
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);

      if (jsonResponse['success']) {
        print('users: ' + json.encode(jsonResponse));

        final SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('users', json.encode(jsonResponse['data']));

        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MenuPage()));
      } else {
        EasyLoading.dismiss();
        _alert('Info', 'Login gagal!');
      }
    } else {
      EasyLoading.dismiss();
      //print('Request failed with status: ${response.statusCode}.');
      _alert('Info', 'Login gagal!');
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.only(top: 50, left: 20, right: 20),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  alignment: Alignment.centerLeft,
                  height: 100,
                  width: 300,
                  child: Image.asset(
                    'assets/Logo Lamesia.png',
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Masuk',
                          style: GoogleFonts.roboto(
                              fontSize: 30,
                              color: textblack,
                              fontWeight: FontWeight.bold)),
                      Text('Masukkan data anda dengan benar',
                          style:
                              GoogleFonts.roboto(fontSize: 15, color: textred)),
                    ],
                  ),
                ),
              ),
              Flexible(
                  flex: 3,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('NO. WHATSAPP',
                                  style: GoogleFonts.roboto(fontSize: 15)),
                              Container(
                                padding: EdgeInsets.only(top: 5),
                                height: 50,
                                child: TextField(
                                  controller: phone,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(5),
                                    hintText: 'Nomer Whatsapp',
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
                              SizedBox(
                                height: 15,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => GantipassPage()),
                                  );
                                },
                                child: Container(
                                    alignment: Alignment.center,
                                    child: Text('Lupa Password ?',
                                        style: GoogleFonts.roboto(
                                            fontSize: 17, color: textred))),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.2,
                        ),
                        FlatButton(
                            color: red,
                            onPressed: () {
                              // login();

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MenuPage()));
                            },
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                'MASUK',
                                style: GoogleFonts.roboto(
                                    fontSize: 20, color: textwhite),
                              ),
                            )),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('Belum memiliki Akun?',
                                  style: GoogleFonts.roboto(
                                    fontSize: 17,
                                  )),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DaftarPage()));
                                },
                                child: Text(' Daftar',
                                    style: GoogleFonts.roboto(
                                        fontSize: 17, color: textred)),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
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
