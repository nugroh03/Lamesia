import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lamesia/loginpage.dart';
import 'color.dart';
import 'slider.dart';

class ScreenOpening extends StatefulWidget {
  ScreenOpening({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _ScreenOpeningState createState() => _ScreenOpeningState();
}

class _ScreenOpeningState extends State<ScreenOpening> {
  int _currentPage = 0;
  PageController _controller = PageController();

  List<Widget> _pages = [
    SliderPage(
      title: 'Tenaga Medis ',
      title1: 'Professional',
      image: 'assets/contoh.jpg',
    ),
    SliderPage(
      title: 'Kemudahan',
      title1: 'Membuat Janji',
      image: 'assets/contoh.jpg',
    ),
    SliderPage(
      title: 'Hadir ',
      title1: 'Kerumah Anda',
      image: 'assets/contoh.jpg',
    ),
  ];

  @override
  void initState() {
    super.initState();
  }

  _onChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
              scrollDirection: Axis.horizontal,
              controller: _controller,
              itemCount: _pages.length,
              onPageChanged: _onChanged,
              itemBuilder: (context, int index) {
                return _pages[index];
              }),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.only(right: 20, left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.bottomLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children:
                            List<Widget>.generate(_pages.length, (int index) {
                          return AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            height: 10,
                            width: (index == _currentPage) ? 30 : 10,
                            margin: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 30),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: (index == _currentPage)
                                    ? Colors.red
                                    : Colors.red.withOpacity(0.5)),
                          );
                        }),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topCenter,
                      child: FlatButton(
                          color: red,
                          onPressed: () {
                            print(_currentPage);
                            _controller.nextPage(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.easeInOutQuint);

                            if (_currentPage == 2) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()),
                              );
                            }
                          },
                          child: Container(
                            child: Row(
                              children: [
                                Text(
                                  'BERIKUT',
                                  style: GoogleFonts.roboto(
                                      fontSize: 20, color: textwhite),
                                ),
                                Icon(
                                  Icons.forward,
                                  color: textwhite,
                                )
                              ],
                            ),
                          )),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
