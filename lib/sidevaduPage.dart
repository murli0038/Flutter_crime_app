import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class drawerScreen extends StatefulWidget {
  @override
  _drawerScreenState createState() => _drawerScreenState();
}

class _drawerScreenState extends State<drawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff416d6d),
      padding: EdgeInsets.only(top: 50,bottom: 70,left: 30,),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(),
              SizedBox(width: 10,),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('email',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                  Text('name',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                ],
              )
            ],
          ),
          Column(
            //  mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: GestureDetector(
                  onTap: (){},
                  child: Row(
                    children: [
                      Icon(Icons.account_circle,color: Colors.white,size: 30,),
                      SizedBox(width: 10,),
                      Text('Personal',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: GestureDetector(
                  onTap: (){},
                  child: Row(
                    children: [
                      Icon(Icons.mail,color: Colors.white,size: 30,),
                      SizedBox(width: 10,),
                      Text('Company',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: GestureDetector(
                  onTap: (){},
                  child: Row(
                    children: [
                      Icon(Icons.ad_units_rounded,color: Colors.white,size: 30,),
                      SizedBox(width: 10,),
                      Text('Application',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
              ),
              // Icon(Icons.settings,color: Colors.white,size: 30,),
              // Text('Persona',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
              // Icon(Icons.settings,color: Colors.white,size: 30,),
              // Text('Persona',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
            ],
          ),
          Row(
            children: [
              Icon(Icons.settings,color: Colors.white,),
              SizedBox(width: 10,),
              Text('Settings',style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
              SizedBox(width: 10,),
              Container(width: 2,height: 20,color: Colors.white,),
              SizedBox(width: 10,),
              Text('Log out',style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)

            ],
          )
        ],
      ),
    );
  }
}