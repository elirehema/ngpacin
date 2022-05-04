import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:chopper/chopper.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:mobile/data/post_api_service.dart';
import 'package:passcode_screen/circle.dart';
import 'package:passcode_screen/keyboard.dart';
import 'package:provider/provider.dart';

import 'Constants.dart';
import 'colors.dart';

class Utils {
  static Future<bool> checkConnection() async {
    ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());
    if ((connectivityResult == ConnectivityResult.mobile) ||
        (connectivityResult == ConnectivityResult.wifi)) {
      return true;
    } else {
      return false;
    }
  }

  static bool? isAndroidPlatform() {
    if (Platform.isAndroid) {
      return true;
      // Android-specific code
    } else if (Platform.isIOS) {
      // iOS-specific code
      return false;
    }
  }

  static void getOutOfApp() {
    if (Platform.isIOS) {
      try {
        exit(0);
      } catch (e) {
        SystemNavigator
            .pop(); // for IOS, not true this, you can make comment this :)
      }
    } else {
      try {
        SystemNavigator.pop(); // sometimes it cant exit app
      } catch (e) {
        exit(0); // so i am giving crash to app ... sad :(
      }
    }
  }

  static void showAlert(BuildContext context, String title, String text,
      VoidCallback onPressed, bool cancelable) {
    var alert = CupertinoAlertDialog(
      title: Text(
        title,
        overflow: TextOverflow.ellipsis,
      ),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text(text),
          ],
        ),
      ),
      actions: <Widget>[
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
            Colors.black87,
          )),
          child: Text('OK', style: TextStyle(color: Colors.white)),
        ),
      ],
    );

    showDialog(
        context: context,
        barrierDismissible: cancelable,
        builder: (_) {
          return alert;
        });
  }

  static void showOkCancelAlert(
      BuildContext context, String title, String text, VoidCallback onPressed) {
    var alert = AlertDialog(
      title: Text(title),
      content: Container(
        child: Row(
          children: <Widget>[Text(text)],
        ),
      ),
      actions: <Widget>[
        ElevatedButton(
            onPressed: onPressed,
            child: Text(
              "OK",
              style: TextStyle(color: Colors.black87),
            )),
        ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "Cancel",
              style: TextStyle(color: Constants.clr_blue),
            ))
      ],
    );

    showDialog(
        context: context,
        builder: (_) {
          return alert;
        });
  }

  static int getColorHexFromStr(String colorStr) {
    colorStr = "FF" + colorStr;
    colorStr = colorStr.replaceAll("#", "");
    int val = 0;
    int len = colorStr.length;
    for (int i = 0; i < len; i++) {
      int hexDigit = colorStr.codeUnitAt(i);
      if (hexDigit >= 48 && hexDigit <= 57) {
        val += (hexDigit - 48) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 65 && hexDigit <= 70) {
        // A..F
        val += (hexDigit - 55) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 97 && hexDigit <= 102) {
        // a..f
        val += (hexDigit - 87) * (1 << (4 * (len - 1 - i)));
      } else {
        throw new FormatException("An error occurred when converting a color");
      }
    }
    return val;
  }

  static ButtonStyle buttonStyle() {
    return ButtonStyle(
        padding:
            MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 10.0)),
        minimumSize: MaterialStateProperty.all(Size(double.infinity, 30)),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(7.5)),
            side: BorderSide(color: colorPrimary))),
        textStyle: MaterialStateProperty.all(TextStyle(
            fontSize: 20.0, fontWeight: FontWeight.w300, letterSpacing: 0.5)),
        elevation: MaterialStateProperty.all(0.0));
  }

  static ButtonStyle coloredButtonStyle(Color color) {
    return ButtonStyle(
        padding:
            MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 15.0)),
        minimumSize: MaterialStateProperty.all(Size(double.infinity, 30)),
        backgroundColor: MaterialStateProperty.all(color),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(7.5)),
            side: BorderSide(color: color))),
        elevation: MaterialStateProperty.all(0.0));
  }
  static ButtonStyle coloredButtonStyleWithWidth(Color color, double width, {elevetion}) {
    return ButtonStyle(
        padding:
        MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 15.0)),
        minimumSize: MaterialStateProperty.all(Size(width, 30)),
        backgroundColor: MaterialStateProperty.all(color),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(7.5)),
            side: BorderSide(color: color))),
        elevation: MaterialStateProperty.all(elevetion !='null' ? elevetion : 0.0));
  }

  static CircleUIConfig circleUiConfig() {
    return CircleUIConfig(
        borderColor: Colors.white, fillColor: Colors.white);
  }

  static KeyboardUIConfig keyboardUIConfig(BuildContext context) {
    ThemeData _theme = Theme.of(context);
    return KeyboardUIConfig(
        primaryColor: Colors.white,
        digitFillColor: _theme.appBarTheme.backgroundColor!,
        digitTextStyle:  _theme.textTheme.headline3!,);
  }

  static RoundedRectangleBorder cardShapeRound() {
    return RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0));
  }

  static Builder backArrow() {
    return Builder(
      builder: (BuildContext context) {
        ThemeData _theme = Theme.of(context);
        return IconButton(
          icon:  Icon(Icons.west, color: Colors.white,),
          onPressed: () {
            Navigator.of(context).pop();
          },
          tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        );
      },
    );
  }

  static Color getRoleColor(String role){
    final colors = [Colors.redAccent, Colors.blueGrey, Colors.blueAccent];
    Color color = Colors.black;
    switch(role){
      case 'CHAIRPERSON':
        color = colors[0];
        break;
      case 'SECRETARY':
        color = colors[1];
        break;
      case 'TREASURER':
        color = colors[2];
        break;
    }
    return color;
  }

  static FutureBuilder<Response<String>> buildGroupImage(BuildContext context,String groupType, int groupId, double size) {
    ThemeData _theme = Theme.of(context);
    return FutureBuilder<Response<String>>(
      future: Provider.of<PostApiService>(context).getGroupImage('groups',groupId.toString()),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          String? _imageString = snapshot.data?.body;
          if (_imageString == 'No image uploaded') {
            return Image.asset(groupType == '1'?'images/family.png':'images/peoples.png', fit: BoxFit.cover,width: 20.0,);
          } else if (snapshot.hasError) {
            return Image.asset(groupType == '1'?'images/family.png':'images/peoples.png', fit: BoxFit.cover, width: 20.0,);
          } else {
            final  String? _imageString = snapshot.data?.body;
            Uint8List _imageBytes = base64Decode(_imageString!);
            return ClipRRect(
                borderRadius: BorderRadius.circular(50.0),
                child: Container(
                    padding: EdgeInsets.all(0.0),
                    decoration: BoxDecoration(color: colorAccent,),
                    child: Image.memory(_imageBytes, fit: BoxFit.cover,height: size, width: size,)
                ));
          }
        } else {
          return Center(
            child: Image.asset(groupType == '1'?'images/family.png':'images/peoples.png', fit: BoxFit.cover, width:50.0, height: 55.0,),
          );
        }
      },
    );
  }
}
