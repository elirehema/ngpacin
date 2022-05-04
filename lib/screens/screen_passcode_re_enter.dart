import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/utils/Constants.dart';
import 'package:mobile/utils/index.dart';
import 'package:mobile/utils/util.dart';
import 'package:passcode_screen/passcode_screen.dart';

class ScreenReEnterPasscode extends StatefulWidget {
  var passcode;

  ScreenReEnterPasscode(this.passcode);

  @override
  _ScreenReEnterPasscodeState createState() => _ScreenReEnterPasscodeState();
}

class _ScreenReEnterPasscodeState extends State<ScreenReEnterPasscode> {
  @override
  void dispose() {
    _verificationNotifier.close();
    super.dispose();
  }

  _updatePasscode(var passcode) async {
    var sp = SharedPreference.getInstance();
    await sp.setStringToSF(securityEnum.PASSCODE.toString(), passcode);
    await sp.setBooleanToSF(enumKey.IS_LOGGED_IN.toString(), true);
    Navigator.of(context).pushReplacementNamed('/welcome');
  }

  final StreamController<bool> _verificationNotifier =
      StreamController<bool>.broadcast();

  _onPasscodeEntered(String enteredPasscode) {
    print(enteredPasscode);
    bool isValid = widget.passcode == enteredPasscode;
    _verificationNotifier.add(isValid);
    if (isValid) {
      _updatePasscode(enteredPasscode);
    }
  }

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);
    return Expanded(
        child: PasscodeScreen(
      circleUIConfig: Utils.circleUiConfig(),
      keyboardUIConfig: Utils.keyboardUIConfig(context),
      backgroundColor:  _theme.appBarTheme.backgroundColor,
      title: Text('Confirm your passcode', style: _theme.textTheme.headline2,),
      passwordDigits: 4,
      passwordEnteredCallback: _onPasscodeEntered,
      cancelButton: Text('Cancel', style: _theme.textTheme.headline3,),
      deleteButton: Text('Delete', style: _theme.textTheme.headline3,),
      shouldTriggerVerification: _verificationNotifier.stream,
    ));
  }
}
