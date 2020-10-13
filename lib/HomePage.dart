import 'package:crime_app/MyComplaints.dart';
import 'package:crime_app/homenachokra.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>  with SingleTickerProviderStateMixin {

  // TabController to control and switch tabs
  TabController _tabController;

  // Current Index of tab
  int _currentIndex = 0;
  PageController _pageController;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController =
    new TabController(vsync: this, length: 2, initialIndex: _currentIndex);
    _pageController = PageController();

  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          drawer: DrawerApp(),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            backgroundColor: Colors.white,
            actions: <Widget>[
              Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: GestureDetector(
                    onTap: () {
                      DrawerApp();
                    },
                    child: Icon(
                      Icons.settings,
                      size: 26.0,
                      color: Colors.black,
                    ),
                  )
              ),
            ],


            title: Text("Reduce Crime App",style: TextStyle(color: Colors.black),),
            elevation: 0,
            bottom: TabBar(
                unselectedLabelColor: Colors.redAccent,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.orange[100],Colors.blue[500]]),
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.redAccent),
                tabs: [
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("HOME",style: TextStyle(fontSize: 15,color: Colors.black),),
                    ),
                  ),
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("MY\nCOMPLAINTS",textAlign: TextAlign.center,style: TextStyle(fontSize: 12),),
                    ),
                  ),
                  // Tab(
                  //   child: Align(
                  //     alignment: Alignment.center,
                  //     child: Text("Setting",style: TextStyle(fontSize: 15),),
                  //   ),
                  // ),
                ]),
          ),
          body: TabBarView(children: [
            HomeFirstChild(),
            MyComplaints(),
            // Icon(Icons.games),
          ]),
        )
    );


    // return Scaffold(
    //   body: SafeArea(
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.stretch,
    //       children: [
    //
    //         new Container(
    //
    //           child: new Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //             // mainAxisSize: MainAxisSize.min,
    //             children: <Widget>[
    //               // Sign In Button
    //               new FlatButton(
    //                 shape: RoundedRectangleBorder(
    //                     borderRadius: BorderRadius.circular(18.0),
    //                     side: BorderSide(color: Colors.red[100])),
    //                 color: _currentIndex == 0 ? Colors.red[100] : Colors.white,
    //                 onPressed: () {
    //                   _tabController.animateTo(0);
    //                   setState(() {
    //                     _currentIndex = 0;
    //                   });
    //                 },
    //                 child: new Text("Home"),
    //               ),
    //               // Sign Up Button
    //               new FlatButton(
    //                 shape: RoundedRectangleBorder(
    //                     borderRadius: BorderRadius.circular(18.0),
    //                     side: BorderSide(color: Colors.red[100])),
    //                 color: _currentIndex == 1 ? Colors.red[100] : Colors.white,
    //                 onPressed: () {
    //                   _tabController.animateTo(1);
    //                   setState(() {
    //                     _currentIndex = 1;
    //                   });
    //                 },
    //                 child: new Text("My Comolaints"),
    //               )
    //             ],
    //           ),
    //         ),
    //         Expanded(
    //           child: TabBarView(
    //             controller: _tabController,
    //             physics: const NeverScrollableScrollPhysics(),
    //             children: [
    //               ClipPath(
    //                 clipper: MyClipper(),
    //                 child: Container(
    //                   padding: EdgeInsets.only(left: 40, top: 50, right: 20),
    //                   height: 100,
    //                   width: double.infinity,
    //                   decoration: BoxDecoration(
    //
    //                   ),
    //                 ),
    //               ),
    //               Center(
    //                 child: Text("2nd"),
    //               ),
    //
    //             ],
    //           ),
    //         )
    //
    //       ],
    //     ),
    //   ),
    //
    // );
  }
}


class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
    // Path path = Path();
    // path.lineTo(0, size.height);
    // path.quadraticBezierTo(size.width/4, size.height - 40, size.width/2, size.height-20);
    // path.quadraticBezierTo(3/4*size.width, size.height, size.width, size.height-30);
    // path.lineTo(size.width, 0);
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class DrawerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: const <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Drawer Header',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.message),
            title: Text('Messages'),
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Profile'),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
          ),
        ],
      ),
    );
  }
}
