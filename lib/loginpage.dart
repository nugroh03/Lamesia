import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lamesia/daftarpage.dart';
import 'package:lamesia/datapersonal.dart';
import 'package:lamesia/gantipassword.dart';
import 'package:lamesia/gantipassword.dart';
import 'color.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                  Text('Masuk',
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
                          Text('NO. WHATSAPP',
                              style: GoogleFonts.roboto(fontSize: 15)),
                          Container(
                            padding: EdgeInsets.only(top: 5),
                            height: 50,
                            child: TextField(
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
                      height: 100,
                    ),
                    FlatButton(
                        color: red,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DatapersonalPage()));
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
                      height: 100,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
