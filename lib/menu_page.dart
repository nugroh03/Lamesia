import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lamesia/chat_page.dart';
import 'package:lamesia/daftarpage.dart';
import 'package:lamesia/datapersonal.dart';
import 'dokter_page.dart';
import 'package:lamesia/gantipassword.dart';
import 'package:lamesia/gantipassword.dart';
import 'package:lamesia/home_page.dart';
import 'package:lamesia/janji_temu.dart';
import 'package:lamesia/profil_pengguna.dart';
import 'color.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class MenuPage extends StatefulWidget {
  MenuPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  int _pageIndex = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  final HomePage _homePage = HomePage();
  final ChatPage _chatPage = ChatPage();
  final MyDokterPage _myDokterPage = MyDokterPage();
  final JanjiTemu _janjiTemu = JanjiTemu();
  final ProfilPengguna _profilPengguna = ProfilPengguna();

  Widget _showpage = HomePage();

  Widget _pagecouser(int page) {
    switch (page) {
      case 0:
        return _homePage;
        break;
      case 1:
        return _chatPage;
        break;
      case 2:
        return _myDokterPage;
        break;
      case 3:
        return _janjiTemu;
        break;
      case 4:
        return _profilPengguna;
        break;
      default:
        return new Container(
          child: Center(
            child: Text('No page found by page couser'),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: grey3,
      body: Container(
        child: _showpage,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: _pageIndex,
        color: Colors.white,
        backgroundColor: red,
        buttonBackgroundColor: white,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        height: 45,
        items: <Widget>[
          SvgPicture.asset(
            'assets/Icon.svg',
            height: 25,
            color: red,
          ),
          SvgPicture.asset(
            'assets/Icon-2.svg',
            height: 25,
            color: red,
          ),
          SvgPicture.asset(
            'assets/Icon-4.svg',
            height: 25,
            color: red,
          ),
          SvgPicture.asset(
            'assets/Icon-6.svg',
            height: 25,
            color: red,
          ),
          SvgPicture.asset(
            'assets/Icon-8.svg',
            height: 25,
            color: red,
          ),
        ],
        onTap: (int tappedIndex) {
          setState(() {
            _showpage = _pagecouser(tappedIndex);
          });
        },
      ),
    );
  }
}
