import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:folding_cell/folding_cell.dart';

class MyComplaints extends StatefulWidget {
  @override
  _MyComplaintsState createState() => _MyComplaintsState();
}

class _MyComplaintsState extends State<MyComplaints> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: FoldingCellListViewDemo(),
    );
  }
}

class FoldingCellListViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Color(0xFF2e282a),
      color: Colors.white,
      child: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return SimpleFoldingCell(
                frontWidget: _buildFrontWidget(index),
                innerTopWidget: _buildInnerTopWidget(index),
                innerBottomWidget: _buildInnerBottomWidget(index),
                cellSize: Size(MediaQuery.of(context).size.width, 75),
                padding: EdgeInsets.all(7),
                animationDuration: Duration(milliseconds: 300),
                borderRadius: 10,
                onOpen: () => print('$index cell opened'),
                onClose: () => print('$index cell closed'));
          }),
    );
  }

  Widget _buildFrontWidget(int index) {
    return Builder(
      builder: (BuildContext context) {
        return GestureDetector(
          onTap: () {
            SimpleFoldingCellState foldingCellState =
            context.findAncestorStateOfType();
            foldingCellState?.toggleFold();
          },
          child: Container(
            width: double.infinity,
            // color: Color(0xFFffcd3c),
            //   color: Colors.red[100],
              color: Colors.blue[200],
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Complaint - $index",
                      style: TextStyle(
                          color: Color(0xFF2e282a),
                          fontFamily: 'OpenSans',
                          fontSize: 20.0,
                          fontWeight: FontWeight.w800)),
                  // FlatButton(
                  //   onPressed: () {
                  //     // SimpleFoldingCellState foldingCellState =
                  //     // context.findAncestorStateOfType();
                  //     // foldingCellState?.toggleFold();
                  //   },
                  //   child: Text(
                  //     "Open",
                  //   ),
                  //   textColor: Colors.white,
                  //   color: Colors.indigoAccent,
                  //   splashColor: Colors.white.withOpacity(0.5),
                  // )
                ],
              )),
        );
      },
    );
  }

  Widget _buildInnerTopWidget(int index) {
    return Builder(builder: (context){
      return GestureDetector(
        onTap: (){
          SimpleFoldingCellState foldingCellState = context.
          findAncestorStateOfType();
          foldingCellState?.toggleFold();

        },
        child: Container(
          // color: Color(0xFFff9234),

            color: Colors.orange[100],

            alignment: Alignment.center,
            child: Text("TITLE - $index",
                style: TextStyle(
                    color: Color(0xFF2e282a),
                    fontFamily: 'OpenSans',
                    fontSize: 20.0,
                    fontWeight: FontWeight.w800))),
      );
    });
  }

  Widget _buildInnerBottomWidget(int index) {
    return Builder(builder: (context) {
      return GestureDetector(
        onTap: (){
          SimpleFoldingCellState foldingCellState = context.
          findAncestorStateOfType();
          foldingCellState?.toggleFold();
        },
        child: Container(
          // color: Color(0xFFecf2f9),
          color: Colors.orange[100],
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: FlatButton(
              onPressed: () {
                SimpleFoldingCellState foldingCellState = context.
                findAncestorStateOfType();
                foldingCellState?.toggleFold();
              },
              // child: Text(
              //   "Close",
              // ),
              // textColor: Colors.white,
              // color: Colors.indigoAccent,
              // splashColor: Colors.white.withOpacity(0.5),
            ),
          ),
        ),
      );
    });
  }
}