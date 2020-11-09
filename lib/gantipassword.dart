import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lamesia/daftarpage.dart';
import 'package:lamesia/loginpage.dart';
import 'color.dart';

class GantipassPage extends StatefulWidget {
  GantipassPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _GantipassPageState createState() => _GantipassPageState();
}

class _GantipassPageState extends State<GantipassPage> {
  bool gantipassvisible = true;
  bool kodevisible = false;
  bool newpassvisible = false;

  @override
  void initState() {
    super.initState();
  }

  Widget gantipass() {
    return Visibility(
      visible: gantipassvisible,
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
                Text('Ganti Password',
                    style: GoogleFonts.roboto(
                        fontSize: 30,
                        color: textblack,
                        fontWeight: FontWeight.bold)),
                Text('Masukkan Nomor Whatsapp anda. kode verifikasi',
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
                              hintText: 'Nomor',
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
                    height: 50,
                  ),
                  FlatButton(
                      color: red,
                      onPressed: () {
                        setState(() {
                          gantipassvisible = false;
                          kodevisible = true;
                          newpassvisible = false;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          'LANJUT',
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
    );
  }

  Widget kode() {
    return Visibility(
      visible: kodevisible,
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
                Text('Masukkan Kode',
                    style: GoogleFonts.roboto(
                        fontSize: 30,
                        color: textblack,
                        fontWeight: FontWeight.bold)),
                Text('Kode telah dikirim ke email anda',
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
                        Text('KODE', style: GoogleFonts.roboto(fontSize: 15)),
                        Container(
                          padding: EdgeInsets.only(top: 5),
                          height: 50,
                          child: TextField(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(5),
                              hintText: 'Masukkan kode',
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
                    height: 50,
                  ),
                  FlatButton(
                      color: red,
                      onPressed: () {
                        setState(() {
                          gantipassvisible = false;
                          kodevisible = false;
                          newpassvisible = true;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          'LANJUT',
                          style: GoogleFonts.roboto(
                              fontSize: 20,
                              color: textwhite,
                              fontWeight: FontWeight.w500),
                        ),
                      )),
                  FlatButton(
                      shape: Border(
                        top: BorderSide(width: 1, color: red),
                        left: BorderSide(width: 1, color: red),
                        right: BorderSide(width: 1, color: red),
                        bottom: BorderSide(width: 1, color: red),
                      ),
                      color: Colors.red.withOpacity(0.2),
                      onPressed: () {
                        setState(() {
                          gantipassvisible = true;
                          kodevisible = false;
                          newpassvisible = false;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        child: Text('KIRIM ULANG',
                            style: GoogleFonts.poppins(
                                fontSize: 20,
                                color: textred,
                                fontWeight: FontWeight.w500)),
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget newpass() {
    return Visibility(
      visible: newpassvisible,
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
                Text('Password Baru',
                    style: GoogleFonts.roboto(
                        fontSize: 30,
                        color: textblack,
                        fontWeight: FontWeight.bold)),
                Text('Buat password baru',
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
                        Text('PASSWORD BARU',
                            style: GoogleFonts.roboto(fontSize: 15)),
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
                        Text('ULANG PASSWORD',
                            style: GoogleFonts.roboto(fontSize: 15)),
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
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  FlatButton(
                      color: red,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          'LANJUT',
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Stack(
        children: [
          Positioned(child: gantipass()),
          Positioned(child: kode()),
          Positioned(child: newpass()),
        ],
      )),
    );
  }
}
