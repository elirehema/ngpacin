import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile/data/post_api_service.dart';
import 'package:mobile/model/changes.dart';
import 'package:mobile/model/index.dart';
import 'package:mobile/utils/Constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mobile/utils/index.dart';
import 'package:mobile/utils/util.dart';
import 'package:provider/provider.dart';

class ScreenForgotPassword extends StatefulWidget {


  _ScreenForgotPasswordState createState() => _ScreenForgotPasswordState();
}
class _ScreenForgotPasswordState extends State<ScreenForgotPassword>{
  final phone = TextEditingController();
  final password = new TextEditingController();
  final token = new TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final focus = FocusNode();
  bool tokenReceived = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Constants.clr_red),
        elevation: 0.0,
      ),
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Form(
            key: _formKey,
            child: tokenReceived ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Center(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(50.0),
                        child: Container(
                            padding: EdgeInsets.all(3.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Image.asset(

                              'images/passcode.png', height: 200.0,color: colorPrimary,
                            ))),
                  ),
                  Padding(
                    padding: EdgeInsets.all(0.0),
                    child: ListTile(
                      title: Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.0),
                        child: Text(
                          'title.change_password'.tr() ,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: colorPrimary,
                              fontWeight: FontWeight.bold,
                              fontSize: 25.0),
                        ),
                      ),
                      subtitle: Text(
                        'Enter your new password and token you have received via SMS',
                        textAlign: TextAlign.center,
                        style:
                        TextStyle(wordSpacing: 1.0, color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  TextFormField(
                    controller: phone,
                    keyboardType: TextInputType.phone,
                    style: TextStyle(fontWeight: FontWeight.bold),
                    decoration: new InputDecoration(
                        prefixIcon: Icon(Icons.phone_android, color: Constants.clr_blue),
                        contentPadding: EdgeInsets.symmetric(vertical: 25.0),
                        filled: true,
                        hintStyle: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.w100),
                        errorStyle: TextStyle(
                            color: Colors.white, fontStyle: FontStyle.italic),
                        hintText: "e.g 255 *** *** ***",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),

                        ),
                        fillColor: Colors.grey[200]),
                    textInputAction: TextInputAction.done,
                    autofocus: false,
                    readOnly: true,
                    obscureText: false,
                    onFieldSubmitted: (v) {
                      FocusScope.of(context).requestFocus(focus);
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Previous password can not be empty';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: password,
                    style: TextStyle(fontWeight: FontWeight.bold),
                    decoration: new InputDecoration(
                        prefixIcon: Icon(Icons.lock_outlined, color: Constants.clr_blue),
                        contentPadding: EdgeInsets.symmetric(vertical: 25.0),
                        filled: true,
                        hintStyle: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.w100),
                        errorStyle: TextStyle(
                            color: Colors.white, fontStyle: FontStyle.italic),
                        hintText: "e.g ***********",
                        labelText: 'New password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),

                        ),
                        fillColor: Colors.grey[200]),
                    textInputAction: TextInputAction.next,
                    autofocus: false,
                    obscureText: true,
                    onFieldSubmitted: (v) {
                      FocusScope.of(context).requestFocus(focus);
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Previous password can not be empty';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: token,
                    style: TextStyle(fontSize: 21.0),
                    maxLength: 4,
                    decoration: new InputDecoration(
                        prefixIcon: Icon(Icons.vpn_key_outlined, color: Constants.clr_blue),
                        contentPadding: EdgeInsets.symmetric(vertical: 25.0),
                        filled: true,
                        hintStyle: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.w100),
                        errorStyle: TextStyle(
                            color: Colors.white, fontStyle: FontStyle.italic),
                        labelStyle: TextStyle(fontSize: 16.0),
                        hintText: "e.g  1234",
                        labelText: 'SMS Token',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),

                        ),
                        fillColor: Colors.grey[200]),
                    textInputAction: TextInputAction.done,
                    autofocus: false,
                    obscureText: false,
                    onFieldSubmitted: (v) {
                      FocusScope.of(context).requestFocus(focus);
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Previous password can not be empty';
                      }
                      return null;
                    },
                  ),

                  Spacer(),
                  ElevatedButton(
                    style: Utils.buttonStyle(),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        var body = Password.confirmforgotpassword(phone.text.toString(), password.text.toString(), token.text.toString());
                        _requestPasswordReset(context,'confirmforgotpassword', body);

                      }
                    },
                    child: Text('button.change_password'.tr(),
                        style: TextStyle(color: Colors.white)),
                  ),
                  SizedBox(height: 10.0,)
                ]): Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Center(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(50.0),
                        child: Container(
                            padding: EdgeInsets.all(3.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Image.asset(
                              'images/password.png',
                            ))),
                  ),
                  Padding(
                    padding: EdgeInsets.all(0.0),
                    child: ListTile(
                      title: Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.0),
                        child: Text(
                          'title.forgot_password'.tr() + ' ?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Constants.clr_red,
                              fontWeight: FontWeight.bold,
                              fontSize: 25.0),
                        ),
                      ),
                      subtitle: Text(
                        'Enter your phone number for verification',
                        textAlign: TextAlign.center,
                        style:
                        TextStyle(wordSpacing: 1.0, color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  TextFormField(
                    controller: phone,
                    keyboardType: TextInputType.phone,
                    decoration: new InputDecoration(
                        prefixIcon: Icon(Icons.phone_android, color: Constants.clr_red),
                        contentPadding: EdgeInsets.symmetric(vertical: 25.0),
                        filled: true,
                        hintStyle: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.w100),
                        errorStyle: TextStyle(
                            color: Colors.white, fontStyle: FontStyle.italic),
                        hintText: "e.g 255 *** *** ***",
                        labelText: 'Phone Number',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),

                        ),
                        fillColor: Colors.grey[200]),
                    textInputAction: TextInputAction.done,
                    autofocus: false,
                    obscureText: false,
                    onFieldSubmitted: (v) {
                      FocusScope.of(context).requestFocus(focus);
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Previous password can not be empty';
                      }
                      return null;
                    },
                  ),

                  Spacer(),
                  ElevatedButton(
                    style: Utils.buttonStyle(),
                    onPressed: () async {
                      var sp = SharedPreference.getInstance();
                      if (_formKey.currentState!.validate()) {
                        var body = Password.forgotpassword(phone.text.toString());
                        sp.setStringToSF(tokenEnum.TOKEN_MSISDN.toString(), phone.text);
                        _requestPasswordReset(context,'forgotpassword', body);

                      }
                    },
                    child: Text('button.request_token'.tr(),
                        style: TextStyle(color: Colors.white)),
                  ),
                  SizedBox(height: 10.0,)
                ]),
          )),
    );
  }

  Future<void> _requestPasswordReset(BuildContext context,String endpoint, Password body) async {
    var  response = await Provider.of<PostApiService>(context,listen: false).password(endpoint, body);
    Changes? changes = response.body!;
    var sp = SharedPreference.getInstance();
    final int statusCode = response.statusCode;
    if (statusCode == 200) {

        showDialog(
            context: context,
            builder: (_) =>
            new CupertinoAlertDialog(
              title: new Text('dialog.msg.notification'.tr()),
              content: new Text('${changes.description}'),
              actions: <Widget>[

                Visibility(
                    visible: endpoint != 'confirmforgotpassword',
                    child: TextButton(
                      child: Text('dialog.btn.resend_token'.tr()),
                      style: ButtonStyle(textStyle: MaterialStateProperty.all(
                          TextStyle(color: Constants.clr_blue))),
                      onPressed: () async {
                        var response = await Provider.of<PostApiService>(
                            context, listen: false).password(
                            'resendforgotpasswordtoken', body);
                        final int statusCode = response.statusCode;
                        if (statusCode == 200) {
                          var navigator = Navigator.of(context);
                          navigator.pop();
                          navigator.pop();
                          setState(() {
                            tokenReceived = true;
                          });
                        }
                      },
                    )
                ),
                TextButton(
                  child: Text(endpoint != 'confirmforgotpassword' ? 'dialog.btn.verify_token'.tr():'dialog.btn.close'.tr()),
                  onPressed: () {
                    var navigator = Navigator.of(context);
                    navigator.pop();
                    if (changes.code == "0") {
                      if (endpoint != 'confirmforgotpassword') {
                        setState(() {
                          tokenReceived = true;
                        });
                      } else {
                        sp.clearSF();
                      }
                    }
                  },
                )
              ],
            ));
    }
  }
}