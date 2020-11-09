import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lamesia/daftarpage.dart';
import 'package:lamesia/datapersonal.dart';
import 'package:lamesia/gantipassword.dart';
import 'package:lamesia/gantipassword.dart';
import 'color.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class KlinikPage extends StatefulWidget {
  KlinikPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _KlinikPageState createState() => _KlinikPageState();
}

class _KlinikPageState extends State<KlinikPage> {
  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  Widget menu(
    image,
    title,
  ) {
    return Container(
      padding: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
                        child: Row(
                          children: [
                            Icon(
                              Icons.send,
                              color: grey2,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text('2 Km',
                                style: GoogleFonts.poppins(
                                    fontSize: 12, color: grey)),
                          ],
                        ),
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
            decoration: BoxDecoration(
                border: Border(top: BorderSide(width: 1, color: grey3))),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: grey3,
                      border: Border.all(
                        width: 1,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(4))),
                  child: Icon(
                    Icons.location_on,
                    size: 20,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text('Alamat',
                    style: GoogleFonts.poppins(fontSize: 12, color: grey)),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: grey3,
      appBar: PreferredSize(
          child: Container(
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(width: 1, color: red))),
            padding: EdgeInsets.only(left: 20, right: 20, top: 10),
            height: height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  flex: 3,
                  child: Container(
                    alignment: Alignment.bottomLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                            alignment: Alignment.centerLeft,
                            child: InkWell(
                                child: Icon(Icons.arrow_back), onTap: () {})),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text('Klinik',
                              style: GoogleFonts.poppins(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(4))),
                      height: 40,
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(
                            flex: 1,
                            child: TextField(
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(5),
                                  hintText: 'Cari klinik . . . . . .',
                                  hintStyle: GoogleFonts.poppins(fontSize: 20),
                                  border: InputBorder.none),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: Icon(
                              Icons.search,
                              color: red,
                              size: 30,
                            ),
                          )
                        ],
                      )),
                )
              ],
            ),
          ),
          preferredSize:
              Size.fromHeight(MediaQuery.of(context).size.height * 0.15)),
      body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              menu(
                Icons.emoji_people,
                'Nama Klinik',
              ),
            ],
          )),
    );
  }
}
