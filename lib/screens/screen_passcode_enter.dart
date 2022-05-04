import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/screens/index.dart';
import 'package:mobile/utils/utils.dart';
import 'package:passcode_screen/passcode_screen.dart';

class ScreenEnterPasscode extends StatefulWidget {

  @override
  _ScreenEnterPasscodeState createState() => _ScreenEnterPasscodeState();
}
class _ScreenEnterPasscodeState extends State<ScreenEnterPasscode>{

  @override
  void dispose() {
    _verificationNotifier.close();
    super.dispose();
  }

  final StreamController<bool> _verificationNotifier = StreamController<bool>.broadcast();

  _onPasscodeEntered(String enteredPasscode) {
    print(enteredPasscode);
    Navigator.pushReplacement(context,    MaterialPageRoute(builder: (context) => new ScreenReEnterPasscode(enteredPasscode)));

  }


  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);
   return  Scaffold(
     backgroundColor: _theme.appBarTheme.backgroundColor,
     resizeToAvoidBottomInset: false,
     body: PasscodeScreen(
       circleUIConfig: Utils.circleUiConfig(),
       keyboardUIConfig: Utils.keyboardUIConfig(context),
       backgroundColor: _theme.appBarTheme.backgroundColor,
       title: Text('Enter passcode', style: _theme.textTheme.headline3,),
       passwordDigits: 4,
       passwordEnteredCallback: _onPasscodeEntered,
       cancelButton: Text('Cancel', style: _theme.textTheme.headline3,),
       deleteButton: Text('Delete', style: _theme.textTheme.headline3,),
       shouldTriggerVerification: _verificationNotifier.stream,
     ),
   );
  }

}