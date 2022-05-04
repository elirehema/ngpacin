import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile/utils/colors.dart';

class ScreenRequestConfirmed extends StatelessWidget {
  final String action;
  ScreenRequestConfirmed(this.action);
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: colorAccent,
      appBar: AppBar(

        title: Text('Request confirmed'),
        backgroundColor: colorPrimary,
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0.0,
      ),
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        padding: EdgeInsets.all(10.0),
        child: Card(
            elevation: 1,
            child: Scaffold(
              resizeToAvoidBottomInset: true,
              body: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image(height: 80.0,  image: AssetImage('images/tick.png')),
                        SizedBox(
                          height: 40.0,
                        ),
                        Text(
                          'Your request has being $action',
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 24.0),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text('You\'ll receive more detail via SMS shortly')
                      ],
                    ),
                  )),
              bottomNavigationBar: BottomAppBar(
                color: Colors.transparent,
                child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            //Navigator.of(context).pop();
                            final nav = Navigator.of(context);
                            nav.pop();
                            nav.pop();
                            nav.pop();
                          },
                          child: Text('Done', style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    )),
                elevation: 0,
              ),
            )),
      ),
    );
  }
}
