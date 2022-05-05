import 'dart:async';

import 'package:mobile/utils/colors.dart';
import 'package:mobile/utils/index.dart';
import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void>  navigationPage() async{
      SharedPreference sharedPref = SharedPreference.getInstance();
      bool isLoggedIn = await sharedPref.getBoolValuesSF(enumKey.IS_LOGGED_IN.toString()) ?? false;
      bool hasPasscode = await sharedPref.contain(securityEnum.PASSCODE.toString());
      print(isLoggedIn && hasPasscode);
      if(isLoggedIn && hasPasscode){
        print('Logged In');
        Navigator.of(context).pushReplacementNamed('/scanner');
      }else{
        print('Not Logged In');
        Navigator.of(context).pushReplacementNamed('/scanner');
      }
 
    
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: colorPrimary,
      body: new Center(
        child: new Image.asset(
          'images/icon.png',
          width: 44.0,
          height: 44.0,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    navigationPage();
  }
}
