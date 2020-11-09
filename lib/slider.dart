import 'package:flutter/material.dart';
import 'package:lamesia/datapersonal.dart';
import 'package:lamesia/loginpage.dart';
import 'color.dart';
import 'package:google_fonts/google_fonts.dart';

class SliderPage extends StatelessWidget {
  final String title;
  final String title1;
  final String image;

  SliderPage({this.title, this.title1, this.image});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.only(top: 30),
      color: white,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(right: 30),
            alignment: Alignment.centerRight,
            height: 100,
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: Text(
                'Lewati',
                style: GoogleFonts.roboto(
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 40),
            alignment: Alignment.centerLeft,
            height: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.roboto(
                    color: textred,
                    fontSize: 30,
                  ),
                ),
                Text(
                  title1,
                  style: GoogleFonts.roboto(
                    fontSize: 30,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 100,
          ),
          Image.asset(
            image,
            width: width * 0.5,
          )
        ],
      ),
    );
  }
}
