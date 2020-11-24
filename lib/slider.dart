import 'package:flutter/material.dart';
import 'package:lamesia/datapersonal.dart';
import 'package:lamesia/loginpage.dart';
import 'color.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/avd.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SliderPage extends StatelessWidget {
  final String title;
  final String title1;
  final String image;

  SliderPage({this.title, this.title1, this.image});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.only(top: 5),
      color: white,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(right: 20),
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
                  fontSize: 15,
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
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  title1,
                  style: GoogleFonts.roboto(
                    fontSize: 40,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: height * 0.03,
          ),
          SvgPicture.asset(
            image,
            height: height * 0.5,
            width: width * 0.4,
          )
        ],
      ),
    );
  }
}
