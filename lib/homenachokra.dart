
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'TipForm.dart';

class HomeFirstChild extends StatefulWidget {
  @override
  _HomeFirstChildState createState() => _HomeFirstChildState();
}

class _HomeFirstChildState extends State<HomeFirstChild> {
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
              )
            ],
          ),
        )
    );
  }
}
