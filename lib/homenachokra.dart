
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:lottie/lottie.dart';
import 'package:simple_timer/simple_timer.dart';

import 'TipForm.dart';

class HomeFirstChild extends StatefulWidget {
  @override
  _HomeFirstChildState createState() => _HomeFirstChildState();
}

class _HomeFirstChildState extends State<HomeFirstChild> with SingleTickerProviderStateMixin{


  Duration _duration = new Duration();
  Duration _position = new Duration();
  AudioPlayer advancedPlayer;
  AudioCache audioCache;
  // declaration
  TimerController _timerController;

  AnimationController controller;
  Animation animation;
  double beginAnim = 0.0 ;
  double endAnim = 1.0 ;

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
                content: Container(
                  height: 400,
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Image.asset("assets/images/animation_500_kg3jlhtq.gif",height: 150,width: 200,),
                      // Container(
                      //     padding: EdgeInsets.all(20.0),
                      //     child: LinearProgressIndicator(
                      //       value: animation.value,
                      //     )),
                      Container(
                          child: SimpleTimer(
                            status: TimerStatus.start,
                            onEnd: (){
                              advancedPlayer.stop();
                              Navigator.pop(context);
                              confirmAlert();
                            },
                            onStart: (){
                              audioCache.play("voice.mp3");
                            },
                            controller: _timerController,
                            duration: Duration(seconds: 10),
                          )
                      ),
                      Spacer(),
                      Text("We are sending your Location",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      Spacer(),
                      Text("Police will arrive in 10 Minutes, if you have pressed by mistake cancel it right now !",
                        textAlign: TextAlign.center,
                      ),
                      Spacer(),
                      Container(
                        child: FlatButton(
                          color: Colors.green[300],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                // side: BorderSide(color: Colors.red)
                            ),
                            onPressed: (){
                              advancedPlayer.stop();
                              Navigator.pop(context);
                            },
                            child: Text("Cancel")),
                      ),

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
  confirmAlert() async {
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
                content: Container(
                  height: 350,
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Image.asset("assets/animations/animation_500_kg7l3pxu.gif",height: 200,width: 200,),
                      Text("Your location has been sent successfully, Police is on the way !",textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Spacer(),
                      Container(
                        child: FlatButton(
                            color: Colors.green[300],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              // side: BorderSide(color: Colors.red)
                            ),
                            onPressed: (){
                              Navigator.pop(context);
                            },
                            child: Text("OK")),
                      ),

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
    initPlayer();
    controller = AnimationController(
        duration: const Duration(seconds: 10), vsync: this);
    animation = Tween(begin: beginAnim, end: endAnim).animate(controller)
      ..addListener(() {
        setState(() {
          // Change here any Animation object value.
        });
      });

  }
  @override
  void dispose() {
    controller.stop();
    super.dispose();
  }

  startProgress(){

    controller.forward();
  }

  stopProgress(){

    controller.stop();
  }

  resetProgress(){

    controller.reset();
  }

  void initPlayer() {
    advancedPlayer = new AudioPlayer();
    audioCache = new AudioCache(fixedPlayer: advancedPlayer);

    advancedPlayer.durationHandler = (d) => setState(() {
      _duration = d;
    });

    advancedPlayer.positionHandler = (p) => setState(() {
      _position = p;
    });
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder:(context){return TpForm();}),);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.orange[100],
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Column(
                        children: [
                          Lottie.asset("assets/animations/tip.json",height: 200, width: double.infinity),
                          Text("GIVE A TIP",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: (){
                      alertView();

                      // audioCache.play('voice.mp3');
                      // showDialog(context: context,builder: (_) => AssetGiffyDialog(
                      //   image: Image.asset("assets/images/animation_500_kg3jlhtq.gif"),
                      //   title: Text("Your Tip is send \nsuccessfully.",textAlign: TextAlign.center,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      //   description:Text('This is a granny eating chocolate dialog box',textAlign: TextAlign.center,),
                      //   entryAnimation: EntryAnimation.BOTTOM,
                      //   onCancelButtonPressed: (){
                      //     advancedPlayer.stop();
                      //     Navigator.pop(context);
                      //
                      //   },
                      //   onlyCancelButton: true,
                      //
                      // ));

                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue[100],
                        // borderRadius: BorderRadius.circular(30),
                          borderRadius: BorderRadius.circular(30.0),
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.1),
                                offset: Offset(6, 2),
                                blurRadius: 10.0,
                                spreadRadius: 3.0
                            ),
                            BoxShadow(
                                color: Color.fromRGBO(255, 255, 255, 0.9),
                                offset: Offset(6, 2),
                                blurRadius: 10.0,
                                spreadRadius: 3.0
                            )
                          ]
                      ),
                      child: Column(
                        children: [
                          Lottie.asset("assets/animations/needhelp.json",height: 200, width: double.infinity),
                          Text("NEED A HELP",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        )
    );
  }
}
