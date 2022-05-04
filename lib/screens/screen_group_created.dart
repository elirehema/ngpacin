import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:mobile/screens/index.dart';
import 'package:mobile/utils/colors.dart';

class ScreenGroupCreated extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: colorAccent,
      appBar: AppBar(

        title: Text('Group created'),
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
              body:   Padding(
                padding: EdgeInsets.all(10.0),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(MdiIcons.check, size: 50.0, color: colorPrimary,),

                      SizedBox(
                        height: 40.0,
                      ),
                      Text('Your group was successfully created',style: TextStyle(fontWeight: FontWeight.w300)),
                      SizedBox(
                        height: 30.0,
                      ),
                      Text('To get the most out of M-Koba, invite a secretary and a treasurer to join the group.', textAlign: TextAlign.center,)

                    ],
                  ),
                )
              ),
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

                        onPressed: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) =>ScreenInviteLeaders()));
                        },
                        child:
                        Text('Invite leaders', style: TextStyle(color:  Colors.white)),
                      ),
                      ElevatedButton(
                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black)),
                        onPressed: (){
                        },
                        child:
                        Text('See group', style: TextStyle(color:  Colors.white)),
                      ),
                    ],
                  )
                ),
                elevation: 0,
              ),
            )),
      ),
    );
  }
}
