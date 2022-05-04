import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/model/current_user.dart';
import 'package:mobile/utils/Constants.dart';
import 'package:mobile/utils/colors.dart';
import 'package:mobile/utils/util.dart';

import 'package:mobile/data/post_api_service.dart';
import 'package:mobile/model/auth2_response.dart';
import 'package:mobile/model/auth_post.dart';
import 'package:mobile/utils/sharedpreference.dart';

import 'package:passcode_screen/passcode_screen.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:provider/provider.dart';

import '../routes.dart';

class ScreenPasscodeVerify extends StatefulWidget{

  @override
  _ScreenPasscodeVerifyState createState() => _ScreenPasscodeVerifyState();
}
class _ScreenPasscodeVerifyState extends State<ScreenPasscodeVerify>{
  @override
  void dispose() {
    _verificationNotifier.close();
    super.dispose();
  }

  final StreamController<bool> _verificationNotifier = StreamController<bool>.broadcast();

  _onPasscodeEntered(String enteredPasscode) async{
    var sp = SharedPreference.getInstance();
    String _pass_code = await sp.getStringValuesSF(securityEnum.PASSCODE.toString());
    String _username = await sp.getStringValuesSF(securityEnum.USERNAME.toString());
    String _password = await sp.getStringValuesSF(securityEnum.PASSWORD.toString());
    bool isValid = _pass_code == enteredPasscode;
    _verificationNotifier.add(isValid);
    if(isValid){
      AuthPost _body = AuthPost.from(_username, _password);
      _verifyForLogin(context, _body);

    }

  }

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);
    return Scaffold(
      backgroundColor: _theme.appBarTheme.backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor:_theme.appBarTheme.backgroundColor,
        actions: [
           Center(child: Padding(child: GestureDetector(
             child: Text('Forgot passcode ?', style: _theme.textTheme.headline3,),
             onTap: ()async{
               var sp = SharedPreference.getInstance();
               sp.clearSF();
             },
           ), padding: EdgeInsets.only(right: 10.0),),)
        ],
      ),
      body: PasscodeScreen(
        circleUIConfig: Utils.circleUiConfig(),
        keyboardUIConfig: Utils.keyboardUIConfig(context),
        backgroundColor: _theme.appBarTheme.backgroundColor,
        title: Text('Enter passcode', style: _theme.textTheme.headline2,),
        passwordDigits: 4,
        passwordEnteredCallback: _onPasscodeEntered,
        cancelButton: Text('Cancel', style: _theme.textTheme.headline3,),
        deleteButton: Text('Delete', style: _theme.textTheme.headline3,),
        shouldTriggerVerification: _verificationNotifier.stream,
      ),
    );
  }

}

Future<void> _verifyForLogin(BuildContext context, AuthPost newPost) async {

  ProgressDialog pr = new ProgressDialog(context,
      type: ProgressDialogType.Normal,
      isDismissible: true,
      showLogs: false);


  pr.update(
    progress: 100.0,
    message: "Please wait...",
    progressWidget: Container(
        padding: EdgeInsets.all(8.0), child: CircularProgressIndicator()),
    maxProgress: 100.0,
    progressTextStyle: TextStyle(
        color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
    messageTextStyle: TextStyle(
        color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600),
  );
  pr.show();
  final response = await Provider.of<PostApiService>(context,listen: false).postForLogin(newPost.username!, newPost.password!);
  print(response.body);
  Auth2Response? authResponse = response.body;

  final int statusCode = response.statusCode;
  print("Status code: $statusCode");
  if (statusCode == 200) {
    pr.hide();
    _confirmContribution(context);
    var sp = SharedPreference.getInstance();
    await sp.setStringToSF(enumKey.BASE_64_EncodedAuthenticationKey.toString(), authResponse!.accessToken);
    await sp.setBooleanToSF(enumKey.IS_LOGGED_IN.toString(), true);
    await sp.setStringToSF(securityEnum.USERNAME.toString(), newPost.username!);
    await sp.setStringToSF(securityEnum.PASSWORD.toString(), newPost.password!);
    Navigator.of(context).pushReplacementNamed('/welcome');
  }  else {
    pr.hide();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.redAccent,
      content: Text("Invalid username or password. Try again ..."),
    ));
  }

}

Future<void> _confirmContribution(BuildContext context) async {
  final response = await Provider.of<PostApiService>(context,listen: false).getLoggedInUser();
  CurrentUser _currentUser = response.body!;
  final int statusCode = response.statusCode;
  if (statusCode == 200) {
    SharedPreference sp = SharedPreference.getInstance();
    await sp.setStringToSF(currentUserEnum.LANGUAGE.toString(), _currentUser.language!);
    await sp.setStringToSF(currentUserEnum.NETWORK.toString(), _currentUser.network!);
    await sp.setStringToSF(currentUserEnum.M_SSD_IN.toString(), _currentUser.username!);
    String ln = await sp.getStringValuesSF(currentUserEnum.LANGUAGE.toString());
    if(ln=='SWA'){
      Locale locale = new Locale('sw');
      print(locale);
      MyApp.setLanguage(context, locale);
    }
  }
}