import 'package:crime_app/TermAndConditions.dart';
import 'package:dot_pagination_swiper/dot_pagination_swiper.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'dart:math';
import 'package:crime_app/Explanations.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeApp()
    );
  }
}

class HomeApp extends StatefulWidget {








  @override
  _HomeAppState createState() => _HomeAppState();
}


class _HomeAppState extends State<HomeApp> {

  String uper;
  String niche;
  bool gujarati;

  String appInfoUpernuGujrati = "આપણામાંના દરેકમાં રાષ્ટ્રને બચાવવાની શક્તિ છે";
  String appInfoNichenuGujrati = "શું તમે ગુના દરને અટકાવવા અને દેશ માટે સલામત પર્યાવરણ બનાવવા માંગો છો ??";

  String appInfoUpernuEnglish = "Each one of us has the power to save nation !!";
  String appInfoNichenuEnglish = "Would you like to prevent the crime rates and to make safe enviroument for nation ??";

  getSharedPref() async
  {
    SharedPreferences pref = await SharedPreferences.getInstance();
    gujarati = pref.getBool('Gujarati');
    print(gujarati);
  }

  setGujarati() async
  {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool('Gujarati', true);
  }

  language()
  {
    if (gujarati == true)
    {
      uper = appInfoUpernuGujrati;
      niche = appInfoNichenuGujrati;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSharedPref();
    language();
    alertView();
    setState(() {

    });
  }




  alertView() async {
    await Future.delayed(Duration(milliseconds: 100));
    showGeneralDialog(
        barrierColor: Colors.black.withOpacity(0.5),
        transitionBuilder: (context, a1, a2, widget) {
          return Transform.scale(
            scale: a1.value,
            child: Opacity(
              opacity: a1.value,
              child: AlertDialog(
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0)),
                title: Text('Select Language',textAlign: TextAlign.center,),
                content: Container(
                  height: 150,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      FlatButton(onPressed: (){
                        setState(() {
                          uper = appInfoUpernuEnglish;
                          niche = appInfoNichenuEnglish;
                        });
                        Navigator.pop(context);
                      }, child: Text("English")),
                      FlatButton(onPressed: (){
                        setState(() {
                          uper = appInfoUpernuGujrati;
                          niche = appInfoNichenuGujrati;
                          setGujarati();
                        });
                        Navigator.pop(context);
                      }, child: Text("Gujarati")),
                      FlatButton(onPressed: (){}, child: Text("Hindi")),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        transitionDuration: Duration(milliseconds: 200),
        barrierDismissible: true,
        barrierLabel: '',
        context: context,
        pageBuilder: (context, animation1, animation2) {});
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: DotPaginationSwiper(
        children: [
          Explanation(
            colour: Colors.green[50],
            button: false,
            animationURL: "assets/animations/complaints.json",
            uperNuText: uper,
            nicheNuText: niche,
          ),
          Explanation(colour: Colors.blue[50],button: false,animationURL: "assets/animations/giveatip.json",),
          Explanation(colour: Colors.purple[50],button: false,animationURL: "assets/animations/location-search.json",),
          Explanation(colour: Colors.red[50],button: false,animationURL: "assets/animations/info.json",),
          Explanation(colour: Colors.yellow[50],button: true,animationURL: "assets/animations/register.json",),
        ],
      )
    );
  }
}

class TooltipShapeBorder extends ShapeBorder {
  final double arrowWidth;
  final double arrowHeight;
  final double arrowArc;
  final double radius;

  TooltipShapeBorder({
    this.radius = 20.0,
    this.arrowWidth = 20.0,
    this.arrowHeight = 10.0,
    this.arrowArc = 0.0,
  }) : assert(arrowArc <= 1.0 && arrowArc >= 0.0);

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.only(bottom: arrowHeight);

  @override
  Path getInnerPath(Rect rect, {TextDirection textDirection}) => null;

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
    rect = Rect.fromPoints(rect.topLeft, rect.bottomRight - Offset(0, arrowHeight));
    double x = arrowWidth, y = arrowHeight, r = 1 - arrowArc;
    return Path()
      ..addRRect(RRect.fromRectAndRadius(rect, Radius.circular(radius)))
      ..moveTo(rect.bottomCenter.dx + 100, rect.bottomCenter.dy)
      ..relativeLineTo(-x / 2 * r, y * r)
      ..relativeQuadraticBezierTo(-x / 2 * (1 - r), y * (1 - r), -x * (1 - r), 0)
      ..relativeLineTo(-x / 2 * r, -y * r);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {}

  @override
  ShapeBorder scale(double t) => this;
}
