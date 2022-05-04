import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:mobile/screens/index.dart';
import 'package:mobile/utils/colors.dart';

class ScreenGroupPictureAddedConfirmed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: colorAccent,
      appBar: AppBar(

        title: Text('Group picture added'),
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
                        Icon(
                          MdiIcons.check,
                          size: 50.0,
                          color: colorPrimary,
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        Text(
                          'Your group picture was successfully added',
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 24.0),
                          textAlign: TextAlign.center,
                        ),
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

                          },
                          child: Text('See group',
                              style: TextStyle(color: Colors.white)),
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
