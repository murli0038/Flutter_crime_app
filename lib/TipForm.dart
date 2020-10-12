import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:giffy_dialog/giffy_dialog.dart';

class TpForm extends StatefulWidget {
  @override
  _TpFormState createState() => _TpFormState();
}

class _TpFormState extends State<TpForm> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: Colors.orange[100],
        body:SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text("GIVE A TIP",textAlign: TextAlign.center,style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.w900),),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Text("Current Location"),
                        // SizedBox(height: 5,),
                        TextFormField(
                          cursorColor: Theme.of(context).cursorColor,
                          initialValue: 'Gandhinagar',
                          maxLength: 20,
                          decoration: InputDecoration(
                            border: new OutlineInputBorder(
                              // borderRadius: BorderRadius.circular(20),
                                borderSide: new BorderSide(color: Colors.grey),
                            ),
                            filled: true,
                            fillColor: Colors.grey[50],
                            icon: Icon(Icons.add_location_sharp),
                            labelText: 'Current Location',
                            labelStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 20
                            ),
                            helperText: '*this text is automatically fill from \nyour current location',
                            // errorText: "Please enter detail with 20 characters.",
                            // suffixIcon: Icon(
                            //   Icons.check_circle,
                            // ),
                            disabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                          ),
                          onChanged: (value){

                          },
                        ),
                        SizedBox(height: 20,),
                        TextFormField(
                          cursorColor: Theme.of(context).cursorColor,
                          initialValue: 'Gandhinagar',
                          maxLength: 20,
                          decoration: InputDecoration(
                            border: new OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.grey)),
                            filled: true,
                            fillColor: Colors.grey[50],
                            // icon: Icon(Icons.add_location_sharp),
                            labelText: 'District',
                            labelStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 20
                            ),
                            helperText: '*this text is automatically fill from \nyour current location',
                            // suffixIcon: Icon(
                            //   Icons.check_circle,
                            // ),
                            disabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                          ),
                          onChanged: (value){

                          },
                        ),
                        SizedBox(height: 20,),
                        TextFormField(
                          cursorColor: Theme.of(context).cursorColor,
                          initialValue: 'Gandhinagar',
                          maxLength: 20,
                          decoration: InputDecoration(
                            border: new OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.grey)),
                            filled: true,
                            fillColor: Colors.grey[50],
                            // icon: Icon(Icons.add_location_sharp),
                            labelText: 'Taluka',
                            labelStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 20
                            ),
                            helperText: '*this text is automatically fill from \nyour current location',
                            // suffixIcon: Icon(
                            //   Icons.check_circle,
                            // ),
                            disabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                          ),
                          onChanged: (value){

                          },
                        ),
                        Divider(
                          color: Colors.grey,
                          height: 30,
                          thickness: 1,
                          // indent: 20,
                          // endIndent: 0,
                        ),

                        SizedBox(height: 10,),
                        TextFormField(
                          cursorColor: Theme.of(context).cursorColor,
                          // initialValue: 'Gandhinagar',
                          maxLength: 20,
                          decoration: InputDecoration(
                            hintText: "Enter your Name...",
                            border: new OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.grey)),
                            filled: true,
                            fillColor: Colors.grey[50],
                            icon: Icon(Icons.person),
                            labelText: 'Your Name',
                            labelStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 15
                            ),
                            helperText: '*this text is optional',
                            // suffixIcon: Icon(
                            //   Icons.check_circle,
                            // ),
                            disabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                          ),
                          onChanged: (value){

                          },
                        ),

                        SizedBox(height: 20,),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          cursorColor: Theme.of(context).cursorColor,
                          // initialValue: 'Gandhinagar',
                          maxLength: 10,
                          decoration: InputDecoration(
                            hintText: "Enter your Mobile Number...",
                            border: new OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.grey)),
                            filled: true,
                            fillColor: Colors.grey[50],
                            // icon: Icon(Icons.add_location_sharp),
                            labelText: 'Your Mobile Number',
                            labelStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 15
                            ),
                            helperText: '*this text is optional',
                            // suffixIcon: Icon(
                            //   Icons.check_circle,
                            // ),
                            disabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                          ),
                          onChanged: (value){

                          },
                        ),

                        Divider(
                          color: Colors.grey,
                          height: 30,
                          thickness: 1,
                          // indent: 20,
                          // endIndent: 0,
                        ),

                        SizedBox(height: 10,),
                        TextFormField(
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          autocorrect: true,
                          cursorColor: Theme.of(context).cursorColor,
                          maxLength: 150,
                          decoration: InputDecoration(
                            hintText: "Describe crime in your simple words ....",
                            border: new OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.grey)),
                            filled: true,
                            fillColor: Colors.grey[50],
                            icon: Icon(Icons.warning_sharp),
                            labelText: 'Crime',
                            labelStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 15
                            ),
                            helperText: '*this text is compulsory',
                            // suffixIcon: Icon(
                            //   Icons.check_circle,
                            // ),
                            disabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                          ),
                          onChanged: (value){

                          },
                        ),
                        SizedBox(height: 20,),
                        TextFormField(
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          autocorrect: true,
                          cursorColor: Theme.of(context).cursorColor,
                          maxLength: 150,
                          decoration: InputDecoration(
                            hintText: "Describe crime spot...",
                            border: new OutlineInputBorder(
                              // borderRadius: BorderRadius.circular(20),
                              borderSide: new BorderSide(color: Colors.grey),
                            ),
                            filled: true,
                            fillColor: Colors.grey[50],
                            // icon: Icon(Icons.add_location_sharp),
                            labelText: 'Crime Location',
                            labelStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 15
                            ),
                            helperText: '*this text is compulsory',
                            // suffixIcon: Icon(
                            //   Icons.check_circle,
                            // ),
                            disabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                          ),
                          onChanged: (value){

                          },
                        ),
                        SizedBox(height: 20,),
                        TextFormField(
                          cursorColor: Theme.of(context).cursorColor,
                          maxLength: 20,
                          decoration: InputDecoration(
                            hintText: "Enter witness name or contact...",
                            border: new OutlineInputBorder(
                              // borderRadius: BorderRadius.circular(20),
                              borderSide: new BorderSide(color: Colors.grey),
                            ),
                            filled: true,
                            fillColor: Colors.grey[50],
                            // icon: Icon(Icons.add_location_sharp),
                            labelText: 'Witness',
                            labelStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 15
                            ),
                            helperText: '*this text is compulsory',
                            // suffixIcon: Icon(
                            //   Icons.check_circle,
                            // ),
                            disabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                          ),
                          onChanged: (value){

                          },
                        ),
                        Divider(
                          color: Colors.grey,
                          height: 30,
                          thickness: 1,
                          // indent: 20,
                          // endIndent: 0,
                        ),
                        SizedBox(height: 20,),
                        Center(
                          child: SizedBox(
                            width: 200,
                            child: RaisedButton(
                              color: Colors.blue[200],
                              child: Text("Give a Tip",style: TextStyle(fontSize: 18),),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  // side: BorderSide(color: Colors.red)
                              ),
                              onPressed: (){
                                showDialog(context: context,builder: (_) => AssetGiffyDialog(
                                  image: Image.asset("assets/images/animation_500_kg3jlhtq.gif"),
                                  title: Text("Your Tip is send \nsuccessfully.",textAlign: TextAlign.center,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                  description:Text('This is a granny eating chocolate dialog box',textAlign: TextAlign.center,),
                                  entryAnimation: EntryAnimation.BOTTOM,
                                  onOkButtonPressed: (){
                                    Navigator.pop(context);
                                  },

                                ));
                              },
                            ),
                          ),
                        )

                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

