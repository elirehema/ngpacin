import 'dart:ui';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:mobile/screens/index.dart';
import 'package:mobile/utils/colors.dart';

var actionButtons = Row(
  mainAxisSize: MainAxisSize.min,
  mainAxisAlignment: MainAxisAlignment.start,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: <Widget>[
    Expanded(
      child: Column(
        children: [
          GestureDetector(
            child: new CircleAvatar(
              radius: 30,
              backgroundColor: Colors.blueAccent.withOpacity(0.8),
              child: new Icon(
                MdiIcons.camera,
                color: Colors.white,
              ),
            ),
            onTap: null,
          ),
          SizedBox(
            height: 10.0,
          ),
          Text('Camera'),
        ],
      ),
    ),
    Expanded(
      child: Column(
        children: [
          new CircleAvatar(
            radius: 30,
            backgroundColor: Colors.blueAccent.withOpacity(0.8),
            child: new Icon(
              MdiIcons.folder,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text('Files'),
        ],
      ),
    ),
  ],
);

class ScreenMembersInvitationConfirmed extends StatefulWidget {
  @override
  _ScreenMembersInvitationConfirmedState createState() =>
      _ScreenMembersInvitationConfirmedState();
}

class _ScreenMembersInvitationConfirmedState
    extends State<ScreenMembersInvitationConfirmed> {
  late File _image;


  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: colorAccent,
      appBar: AppBar(

        title: Text('Invitation confirmed'),
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
                                'Your invitation have being successfully sent',
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 24.0),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          )
                       
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
                            showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text('Select picture from'),
                                        SizedBox(
                                          height: 20.0,
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            GestureDetector(
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    left: 10.0, right: 20.0),
                                                child: Expanded(
                                                  child: Column(
                                                    children: [
                                                      new CircleAvatar(
                                                        radius: 30,
                                                        backgroundColor: Colors
                                                            .blueAccent
                                                            .withOpacity(0.8),
                                                        child: new Icon(
                                                          MdiIcons.camera,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10.0,
                                                      ),
                                                      Text('Camera'),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              onTap: () {
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                            GestureDetector(
                                              child: Padding(
                                                padding: EdgeInsets.all(5.0),
                                                child: Expanded(
                                                  child: Column(
                                                    children: [
                                                      new CircleAvatar(
                                                        radius: 30,
                                                        backgroundColor: Colors
                                                            .blueAccent
                                                            .withOpacity(0.8),
                                                        child: new Icon(
                                                          MdiIcons.folder,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10.0,
                                                      ),
                                                      Text('Files'),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              onTap: () {
                                                Navigator.of(context).pop();
                                              },
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 100.0,
                                        ),
                                        Positioned(
                                          child: new Align(
                                            alignment:
                                                FractionalOffset.bottomRight,
                                            child: TextButton(
                                              child: Text(
                                                'CANCEL',
                                                style: TextStyle(
                                                    color: Colors.red),
                                              ),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  // if you need this
                                  side: BorderSide(
                                    color: Colors.white,
                                    width: 2,
                                  ),
                                ));
                          },
                          child: Text('Add group picture',
                              style: TextStyle(color: Colors.white)),
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.black)),
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
