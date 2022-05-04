import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile/data/post_api_service.dart';
import 'package:mobile/model/changes.dart';
import 'package:mobile/model/password.dart';
import 'package:mobile/utils/Constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mobile/utils/index.dart';
import 'package:mobile/utils/util.dart';
import 'package:provider/provider.dart';

class ScreenChangePassword extends StatelessWidget {
  final password = TextEditingController();
  final rePassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final focus = FocusNode();

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);
    return Scaffold(
      backgroundColor: _theme.appBarTheme.backgroundColor,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: _theme.appBarTheme.backgroundColor,
        iconTheme: IconThemeData(color: Constants.clr_red),
        elevation: 0.0,
      ),
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Form(
            key: _formKey,
            child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(50.0),
                        child: Container(
                            padding: EdgeInsets.all(3.0),
                            decoration: BoxDecoration(
                              color: _theme.appBarTheme.backgroundColor
                            ),
                            child: Image.asset(
                              'images/password.png',
                            ))),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: ListTile(
                      title: Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.0),
                        child: Text(
                          'title.change_password'.tr() + ' ?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Constants.clr_red,
                              fontWeight: FontWeight.bold,
                              fontSize: 25.0),
                        ),
                      ),
                      subtitle: Text(
                        'Enter previous password associated with your account and new password. After successful update of your password you will be requested '
                            'to re-login with your new password',
                        textAlign: TextAlign.center,
                        style: _theme.textTheme.headline3,
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                  TextFormField(
                    controller: password,
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                    decoration: new InputDecoration(
                        prefixIcon: Icon(Icons.lock, color: Constants.clr_red),
                        contentPadding: EdgeInsets.symmetric(vertical: 25.0),
                        filled: true,
                        hintStyle: TextStyle(
                            color: Colors.black54, fontWeight: FontWeight.w100),
                        errorStyle: TextStyle(
                            color: Colors.white, fontStyle: FontStyle.italic),
                        hintText: "************",
                        labelText: 'Old-password',
                        labelStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold) ,
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
                    obscureText: true,
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                    decoration: new InputDecoration(
                        prefixIcon: Icon(Icons.lock_outline_rounded, color: Constants.clr_red),
                        contentPadding: EdgeInsets.symmetric(vertical: 25.0),
                        filled: true,
                        hintStyle: new TextStyle(
                            color: Colors.black54,
                            fontStyle: FontStyle.normal),
                        errorStyle: TextStyle(
                            color: Colors.white, fontStyle: FontStyle.italic),
                        hintText: "New password",
                        labelText: 'New password',
                        labelStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold) ,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),

                        ),
                        fillColor: Colors.grey[200]),
                    focusNode: focus,
                    autofocus: false,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Password cannot be empty';
                      }
                      return null;
                    },
                    textInputAction: TextInputAction.go,
                    controller: rePassword,
                    onFieldSubmitted: (v) {
                      if (_formKey.currentState!.validate()) {
                        var  _body = Password.from(password.text.toString(), rePassword.text.toString());
                        _requestPasswordReset(context, _body);
                      }
                    },
                  ),
                  Spacer(),
                  ElevatedButton(
                    style: Utils.coloredButtonStyle(Constants.clr_red),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        var  _body = Password.from(password.text.toString(), rePassword.text.toString());
                        _requestPasswordReset(context, _body);
                      }
                    },
                    child: Text('button.reset_password'.tr(),
                        style: TextStyle(color: Colors.white)),
                  ),
                  SizedBox(height: 20.0,)
                ]),
          )),
    );
  }

  Future<void> _requestPasswordReset(BuildContext context,Password body) async {
    var  response = await Provider.of<PostApiService>(context,listen: false).postForChangePassword(body);
    Changes? changes = response.body!;
    var sp = SharedPreference.getInstance();
    final int statusCode = response.statusCode;
    if (statusCode == 200) {
      showDialog(
          context: context,
          builder: (_) => new CupertinoAlertDialog(
            title: new Text('dialog.msg.notification'.tr()),
            content: new Text('${changes.description}'),
            actions: <Widget>[
              TextButton(
                child: Text('dialog.btn.close'.tr()),
                onPressed: () {
                  var navigator = Navigator.of(context);
                  navigator.pop();
                  if(changes.code == "0") {
                    sp.clearSF();
                  }
                },
              )
            ],
          ));
    }
  }
}
