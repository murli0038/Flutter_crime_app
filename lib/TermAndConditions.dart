import 'dart:ffi';

import 'package:crime_app/HomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_avoider/keyboard_avoider.dart';
import 'package:substring_highlight/substring_highlight.dart';

class TermAndConditionPage extends StatefulWidget {
  @override
  _TermAndConditionPageState createState() => _TermAndConditionPageState();
}

class _TermAndConditionPageState extends State<TermAndConditionPage> {

  String mobileNumber;
  var otp;
  Text terms =  Text("Terms of Service",style: TextStyle(color: Colors.blue),);


  @override
  Widget build(BuildContext context) {
    final Shader linearGradient = LinearGradient(
      colors: <Color>[Colors.orange,Colors.green],
    ).createShader(Rect.fromLTWH(0.0, 0.0, 400.0, 700.0));
    bool keyboardIsOpened = MediaQuery.of(context).viewInsets.bottom != 0.0;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Text(
          "App Permissions",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Stack(
        children: [
          Container(
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        height: 175,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [Colors.orange,Colors.white, Colors.green]),
                            // color: Colors.orange[400],
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              new BoxShadow(
                                color: Colors.black,
                                blurRadius: 0.1,
                              ),
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 50,
                                  width: 50,
                                child: Image.asset("assets/images/indialogo.png",),
                              ),
                              Text("Terms of Services & Privacy",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w700
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text("We understand the nature and sensitivity of this topic and have taken strong measure to ensure that your data is not compromised.",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Device Location",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 18
                            ),
                          ),
                          SizedBox(height: 10,),
                          Text("It is recommended that you set your location sharing to 'Always'.You can change this anytime later.",
                            style: TextStyle(
                              fontWeight: FontWeight.w400
                            ),
                          ),
                          SizedBox(height: 20,),
                          Text("Data Sharing",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 18
                            ),
                          ),
                          SizedBox(height: 10,),
                          Text("Your Data will be shared only with Government of India.\nThe App does not allow your name and number to be disclosed to the public at large at any time.",
                            style: TextStyle(
                                fontWeight: FontWeight.w400
                            ),
                          ),
                          SizedBox(height: 20,),
                         SubstringHighlight(

                           term: "Terms of Service",
                           textStyleHighlight: TextStyle(color: Colors.blue[600],decoration: TextDecoration.underline,fontWeight: FontWeight.bold),
                           text: "If you would you like to contribute to a safer India please indicate your acceptance of the Terms of Service  and the Privacy Policy by clicking on the button below:",
                           // child: Text("If you would you like to contribute to a safer India please indicate your acceptance of the Terms of Service  and the Privacy Policy by clicking on the button below:",
                           // style: TextStyle(
                           // color: Colors.black,
                           //     fontWeight: FontWeight.w400
                           // ),
                           // ),
                         )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: RaisedButton(
                    onPressed: () {
                      showModalBottomSheet(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
                          backgroundColor: Colors.white,
                          context: context,
                          isScrollControlled: true,
                          builder: (context) => FractionallySizedBox(
                            heightFactor: 0.7,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal:20 ),
                              child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// mainAxisSize: MainAxisSize.min,

                                children: <Widget>[
                                  SizedBox(
                                    height: 15.0,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconButton(
                                          icon: Icon(
                                            Icons.close,size: 30,
                                          ),
                                          onPressed: (){
                                            Navigator.pop(context);
                                          }),

                                      Text('Enter Mobile Number',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 17
                                        ),
                                      ),

                                      IconButton(
                                          icon: Icon(
                                            Icons.info,
                                            size: 30,
                                            color: Colors.blue,
                                          ),
                                          onPressed: (){
                                            showModalBottomSheet(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
                                                backgroundColor: Colors.white,
                                                context: context,
                                                isScrollControlled: true,
                                                builder: (context) => FractionallySizedBox(
                                                  heightFactor: 0.7,
                                                  child: Padding(
                                                    padding: const EdgeInsets.symmetric(horizontal:20 ),
                                                    child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// mainAxisSize: MainAxisSize.min,
                                                      children: <Widget>[
                                                      SizedBox(height: 20,),
                                                      Text("Your mobile number is required for your contact tracing.",
                                                        style: TextStyle(
                                                            fontSize: 25,
                                                          fontWeight: FontWeight.bold
                                                        ),
                                                      ),
                                                        SizedBox(height: 20,),
                                                        Text("Say, you are in trouble you need urgent help of police , with help button on one tap police will be there to help you.",
                                                          style: TextStyle(
                                                            fontWeight: FontWeight.w400,
                                                            fontSize: 15
                                                          ),
                                                        ),
                                                        SizedBox(height: 10,),
                                                        Text("The government of india will trace you through your mobile number to reach you in minimum time.",
                                                          style: TextStyle(
                                                              fontWeight: FontWeight.w400,
                                                              fontSize: 15
                                                          ),
                                                        ),
                                                        SizedBox(height: 10,),
                                                        Text("A notification will then be sent to all such officer who are in charge.",
                                                          style: TextStyle(
                                                              fontWeight: FontWeight.w400,
                                                              fontSize: 15
                                                          ),
                                                        ),
                                                        Spacer(),
                                                        Image.asset("assets/images/indialogo.png",height: 100,),
                                                        Text("Govt. Of India",
                                                          style: TextStyle(
                                                            fontWeight: FontWeight.bold,
                                                            fontSize: 25,
                                                            foreground: Paint()..shader = linearGradient)
                                                          ),
                                                        SizedBox(height: 10,)
                                                      ],
                                                    ),
                                                  ),
                                                ));
                                          }),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  TextField(
                                    maxLength: 10,
                                    keyboardType: TextInputType.phone,
                                    onChanged: (value){
                                      mobileNumber = value;
                                    },
                                    decoration: InputDecoration(
                                      prefix: Text("+91 "),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(5),
                                          borderSide: BorderSide(
                                              color: Colors.blue,
                                              width: 2.0
                                          )
                                      ),
                                      labelText: "Mobile number",
                                    ),
                                    autofocus: true,
// controller: _newMediaLinkAddressController,
                                  ),
// SizedBox(height: 20,),
                                  Padding(
                                    padding: const EdgeInsets.all(30.0),
                                    child: RaisedButton(
                                      textColor: Colors.white,
                                      color: Colors.blue,
                                      child: Text("Submit"),
                                      onPressed: () {
                                        showModalBottomSheet(
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
                                            backgroundColor: Colors.white,
                                            context: context,
                                            isScrollControlled: true,
                                            builder: (context) => FractionallySizedBox(
                                              heightFactor: 0.7,
                                              child: Padding(
                                                padding: const EdgeInsets.symmetric(horizontal:20 ),
                                                child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// mainAxisSize: MainAxisSize.min,
                                                  children: <Widget>[
                                                    SizedBox(
                                                      height: 15.0,
                                                    ),
                                                    Row(
                                                      children: [
                                                        IconButton(
                                                            icon: Icon(
                                                              Icons.arrow_back,size: 30,
                                                            ),
                                                            onPressed: (){
                                                              Navigator.pop(context);
                                                            }),
                                                        SizedBox(width: 50,),
                                                        Text('Enter OTP',
                                                          textAlign: TextAlign.center,
                                                          style: TextStyle(
                                                              fontWeight: FontWeight.w600,
                                                              fontSize: 17
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 20.0,
                                                    ),
                                                    TextField(
                                                      maxLength: 4,
                                                      keyboardType: TextInputType.phone,
                                                      onChanged: (value){
                                                        otp = value;
                                                      },
                                                      decoration: InputDecoration(
                                                        border: OutlineInputBorder(
                                                            borderRadius: BorderRadius.circular(5),
                                                            borderSide: BorderSide(
                                                                color: Colors.blue,
                                                                width: 2.0
                                                            )
                                                        ),
                                                        labelText: "OTP",
                                                      ),
                                                      autofocus: true,
// controller: _newMediaLinkAddressController,
                                                    ),
                                                    Text("we send the OTP to your mobile number",style: TextStyle(color: Colors.grey),),
                                                    Padding(
                                                      padding: const EdgeInsets.all(30.0),
                                                      child: RaisedButton(
                                                        onPressed: (){
                                                          Navigator.push(context, MaterialPageRoute(builder:(context){return HomePage();}),);
                                                        },
                                                        textColor: Colors.white,
                                                        color: Colors.blue,
                                                        shape: new RoundedRectangleBorder(
                                                          borderRadius: new BorderRadius.circular(30.0),
                                                        ),
                                                        child: Text("Submit"),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ));

                                      },
                                      shape: new RoundedRectangleBorder(
                                        borderRadius: new BorderRadius.circular(30.0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                      );
                    },
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                    padding: const EdgeInsets.all(0.0),
                    child: Ink(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Colors.orange,Colors.white, Colors.green]),
                        borderRadius: BorderRadius.all(Radius.circular(80.0)),
                      ),
                      child: Container(
                        constraints: const BoxConstraints(minWidth: 88.0, minHeight: 36.0), // min sizes for Material buttons
                        alignment: Alignment.center,
                        child: const Text(
                          'I Agree',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  )
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

// ignore: missing_return
Widget terms()
{
  return Text("Terms of Service",
    style: TextStyle(
      color: Colors.blue,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.underline
    ),
  );
}



