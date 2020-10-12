import 'package:crime_app/TermAndConditions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main.dart';

class Explanation extends StatefulWidget {

  final Color colour;
  final bool button;
  final String animationURL;
  final String uperNuText;
  final String nicheNuText;




  Explanation({this.colour, this.button, this.animationURL, this.uperNuText, this.nicheNuText});

  @override
  _ExplanationState createState() => _ExplanationState();
}

class _ExplanationState extends State<Explanation> {

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
                          // gujarati = true;
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
  void initState() {
    // TODO: implement initState
    super.initState();

    getSharedPref();
    language();
    // alertView();
    setState(() {

      uper = widget.uperNuText;
      niche = widget.nicheNuText;
      uper = appInfoUpernuEnglish;
      niche = appInfoNichenuEnglish;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.colour,
      child: SafeArea(
        child: Stack(
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: alertView,
                      child: Icon(
                        Icons.language,
                        size: 25.0,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        Container(
                            height: 100,
                            width: double.infinity,
                            decoration: ShapeDecoration(
                              color: Colors.white, shape: TooltipShapeBorder(arrowArc: 0.1,arrowHeight: 15),
                              shadows: [
                                BoxShadow(
                                    color: Colors.black, blurRadius: 4.0, offset:Offset(1,1)
                                )
                              ]

                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  uper,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400
                                  ),
                                ),
                              ),
                            )
                        ),
                        SizedBox(height: 30,),
                        Lottie.asset(widget.animationURL,height: 200, width: double.infinity),
                        SizedBox(height: 10,),
                        Container(
                          child: RotatedBox(
                            quarterTurns: 2,
                            child: Container(
                                height: 100,
                                width: double.infinity,
                                decoration: ShapeDecoration(
                                  color: Colors.white, shape: TooltipShapeBorder(arrowArc: 0.1,arrowHeight: 15),
                                  shadows: [
                                    BoxShadow(
                                        color: Colors.black, blurRadius: 4.0, offset:Offset(1,1)
                                    )
                                  ]
                                ),
                                child: Center(
                                  child: RotatedBox(
                                    quarterTurns: 2,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        niche,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                            ),
                          ),
                        ),
                      ],
                    )
                ),
              ),
            ),
            Visibility(
              visible: widget.button,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Center(
                        child: FlatButton(
                            onPressed: (){Navigator.push(context, MaterialPageRoute(builder:(context){return TermAndConditionPage();}),);},
                            color: Colors.green[200],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                // side: BorderSide(color: Colors.black)
                            ),
                            child: Text("Register Now >>")),
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
