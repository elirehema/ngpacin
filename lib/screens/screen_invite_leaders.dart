import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttercontactpicker/fluttercontactpicker.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:mobile/screens/index.dart';
import 'package:mobile/utils/colors.dart';


class ScreenInviteLeaders extends StatefulWidget {

  @override
  _ScreenInviteLeadersState createState() => _ScreenInviteLeadersState();
}

class _ScreenInviteLeadersState extends State<ScreenInviteLeaders> {

  final secretary = TextEditingController();
  final treasurer = TextEditingController();

  @override
  void dispose() {
  secretary.dispose();
  treasurer.dispose();
  super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: colorAccent,
      appBar: AppBar(

        title: Text('Invite leaders'),
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
              resizeToAvoidBottomInset: false,
              body: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          'Who do you want to invite to be the group secretary and treasurer ?',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24.0,
                              color: Colors.black)),
                      SizedBox(
                        height: 30.0,
                      ),
                      Text('Enter secretary number '),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            flex: 4,
                            child: TextField(
                              controller: secretary,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Secretary number'),
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.only(bottom: 0.0),
                              child: GestureDetector(
                                onTap: () async {
                                  var secretaryNumber = await openContactBook();
                                  secretary.text = secretaryNumber.toString();
                                  print(
                                      ' Contact number ${secretaryNumber.toString()}');
                                },
                                child: Card(
                                    color: colorPrimary,
                                    shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                          color: colorPrimary,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(4.0)),
                                    elevation: 0.8,
                                    child: Padding(
                                      padding: EdgeInsets.all(14.0),
                                      child: Center(
                                        child: Icon(
                                          MdiIcons.accountOutline,
                                          color: Colors.white,
                                        ),
                                      ),
                                    )),
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text('Enter treasurer number '),
                      Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: TextField(
                              controller: treasurer,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Treasurer number'),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 0.0),
                            child: GestureDetector(
                                onTap: () async {
                                  var treasurerNumber = await openContactBook();
                                  treasurer.text = treasurerNumber.toString();
                                  print(
                                      ' Contact number ${treasurerNumber.toString()}');
                                },
                                child: Card(
                                  color: colorPrimary,
                                  shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        color: colorPrimary,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(4.0)),
                                  elevation: 0.8,
                                  child: Padding(
                                    padding: EdgeInsets.all(14.0),
                                    child: Center(
                                      child: Icon(
                                        MdiIcons.accountOutline,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                )),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      Text(
                        'Note',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Text(
                          'Secretary and treasurer roles can only be assigned to Vodacom users')
                    ],
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
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) =>ScreenInvitationConfirmed()));
                          },
                          child: Text(
                            'Add leaders',
                          ),
                        ),
                      ],
                    )),
                elevation: 0,
              ),
            )),
      ),
    );
  }

  Future<String> openContactBook() async {
    final PhoneContact contact = await FlutterContactPicker.pickPhoneContact();
    var phoneNumber = contact.phoneNumber!.number
        .toString()
        .replaceAll(new RegExp(r"\s+"), "");
    return phoneNumber;
  }
}
