import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/utils/colors.dart';

class ScreenServerError extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          actions: [
            Padding(
                padding: EdgeInsets.only(right: 5.0),
                child: IconButton(
                  icon: Icon(Icons.close_rounded, color: colorPrimary, size: 30.0,),
                  tooltip: 'Close',
                  onPressed:()=> exit(0),
                )),
          ],
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.grey),
          elevation: 0.0,
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(height: 140.0, image: AssetImage('images/warning_icon.png'), fit: BoxFit.fill,),
                SizedBox(height: 26.0,),
                Text('Something wrong happened', textAlign: TextAlign.center, style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold, color: Colors.red),),
                SizedBox(height: 25.0,),
                Text('Server not found',
                  style: TextStyle(fontSize: 19.0),
                  textAlign: TextAlign.center,),
              ],
            ),
          )
        ),

    );
  }
}