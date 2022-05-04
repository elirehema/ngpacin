import 'package:flutter/cupertino.dart';
import 'dart:io' as io;

import 'package:flutter/material.dart';
class MatCapSwitch extends StatefulWidget{
  final bool value;
  final GestureTapCallback tapCallback;
  MatCapSwitch({required this.value, required this.tapCallback});

  @override
  _MatCapSwitchState createState() => new _MatCapSwitchState();
}

class _MatCapSwitchState extends State<MatCapSwitch>{
  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);
    return io.Platform.isAndroid ?
    Switch(
      value: widget.value,
      overlayColor: MaterialStateProperty.all(Colors.green),
      activeTrackColor: Colors.green,
      activeColor: Colors.white,
      inactiveThumbColor: Colors.white,
        onChanged: (value){
          widget.tapCallback();
        }
    ) :
    CupertinoSwitch(
        value: widget.value,
        onChanged: (value){
          widget.tapCallback();
        },
      activeColor: Colors.green,
      trackColor: Colors.red,
      thumbColor: Colors.white,
    );
  }

}