import 'package:crime_app/HomePage.dart';
import 'package:crime_app/TermAndConditions.dart';
import 'package:crime_app/sidevaduPage.dart';
import 'package:dot_pagination_swiper/dot_pagination_swiper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'dart:math';
import 'package:crime_app/Explanations.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(EasyLocalization(path: "assets/resources",
  saveLocale: true,
  supportedLocales: [
    Locale('en', 'US'),
    Locale('gu', 'IN'),
    Locale('hi', 'IN'),

  ],
  child: MyApp()));
}



class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
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

  String appInfoUpernuEnglish = "first".tr().toString();
  String appInfoNichenuEnglish = "second".tr().toString();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    alertView();
    setState(() {
      getGujarati();
      getLanguage();
    });
  }

  changeLanguage() async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('boolValue', true);
  }

  getLanguage() async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return bool
    gujarati = prefs.getBool('boolValue') ;
  }

  getGujarati() async
  {
    if(gujarati == true)
    {
      uper = appInfoUpernuGujrati;
      niche = appInfoNichenuGujrati;
    }
    else
    {
      uper = appInfoUpernuEnglish;
      niche = appInfoNichenuEnglish;
    }
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

                        });
                        Navigator.pop(context);
                      }, child: Text("English")),
                      FlatButton(onPressed: (){
                        setState(() {
                          changeLanguage();
                          getLanguage();
                          getGujarati();
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
