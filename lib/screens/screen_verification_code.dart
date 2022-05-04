import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:mobile/data/post_api_service.dart';
import 'package:mobile/model/index.dart';
import 'package:mobile/utils/Constants.dart';
import 'package:mobile/utils/colors.dart';
import 'package:mobile/utils/sharedpreference.dart';
import 'package:mobile/utils/util.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:provider/provider.dart';

class ScreenVerificationCodeDialog extends StatefulWidget {
  final String _lastChar;
  ScreenVerificationCodeDialog(this._lastChar);
  @override
  _ScreenVerificationCodeDialogState createState() =>
      _ScreenVerificationCodeDialogState();
}

class _ScreenVerificationCodeDialogState
    extends State<ScreenVerificationCodeDialog> {
  String _token = '';
  var controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: scaffoldBackgroundColor,
        body: Center(
          child: Card(
            color: colorPrimary,
            shape: Utils.cardShapeRound(),
            margin: EdgeInsets.all(20.0),
            child: Padding(
              padding: EdgeInsets.all(30.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 20.0,),
                  Center(child: Text('Verification Code', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20.0),),),
                  SizedBox(height: 30.0,),
                  Text('Please enter the verification code we sent to the number ********${widget._lastChar.substring(widget._lastChar.length - 2)}',style: TextStyle(fontWeight: FontWeight.w100, height: 2.0,fontSize: 16.0, color: Colors.white,)),
                  SizedBox(height: 30.0,),
                  TextFormField(
                    controller: controller,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.85),
                        focusedBorder:OutlineInputBorder(
                          borderSide:  BorderSide(color: colorPrimary, width: 0.0),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0),)
                    ),
                    style: TextStyle(letterSpacing: 25.0, fontSize: 24.0, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                    inputFormatters: [
                      new LengthLimitingTextInputFormatter(4),
                    ],
                    autofocus: true,
                    keyboardType: TextInputType.number,
                    onChanged: (val){
                      if(val.length==4){
                        Token _token = Token.from(widget._lastChar, val);
                        _verifyToken(context, _token);
                      }
                    },
                  ),
                  SizedBox(height: 30.0,),
                  ListTile(title: Text('RESEND CODE', style: TextStyle(color: Constants.clr_blue),),
                  onTap: () async{
                    controller.clear();
                    Token _token = Token.resend(widget._lastChar);
                   var response = await Provider.of<PostApiService>(context,listen: false).resendToken(_token);
                   if(response.statusCode == 200){
                     Changes? _change = response.body;
                     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                       backgroundColor: Constants.clr_blue,
                       content: Text(" ${_change?.description}"),
                     ));
                   }
                  },)

                ],
              ),
            )
          ),
        ));
  }
}

Future<void> _verifyToken(BuildContext context,Token body) async {
  ProgressDialog pr = new ProgressDialog(context, isDismissible: true);
  var sp = SharedPreference.getInstance();
  pr.update(
    progress: 50.0,
    message: "Please wait . . . ",

    progressWidget: Container(
        padding: EdgeInsets.all(8.0), child: CircularProgressIndicator()),
    maxProgress: 100.0,
    progressTextStyle: TextStyle(color: Constants.clr_blue, fontSize: 13.0,),
    messageTextStyle: TextStyle(color: Constants.clr_blue, fontSize: 19.0,),
  );
  pr.show();
  final response = await Provider.of<PostApiService>(context,listen: false).validateToken(body);

  final int statusCode = response.statusCode;
  print("Status code: $statusCode");
  if (statusCode == 200) {
    Changes? changes = response.body;
    pr.hide();
    await sp.setBooleanToSF(enumKey.TOKEN_REQUIRED.toString(), false);
    if(changes?.code == '0') {
      Navigator.pushNamed(context, '/login');
    }else{
      showDialog(
          context: context,
          builder: (_) => new CupertinoAlertDialog(
            title: new Text('dialog.msg.notification'.tr()),
            content: new Text('${changes?.description}'),
            actions: <Widget>[
              TextButton(
                child: Text('dialog.btn.close'.tr()),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          ));
    }
  }  else {
    pr.hide();
    await sp.setBooleanToSF(enumKey.TOKEN_REQUIRED.toString(), true);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.redAccent,
      content: Text("Invalid username or password. Try again ..."),
    ));
  }
}