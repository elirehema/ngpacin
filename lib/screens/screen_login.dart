import 'package:mobile/utils/index.dart';
import 'package:mobile/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:mobile/model/auth_post.dart';

class LoginScreen extends StatefulWidget {

  @override
  _LoginScreenState createState() => new _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final password  = TextEditingController();
  final name = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final focus = FocusNode();
  bool _obscureText = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);
    return Stack(children: <Widget>[
      Scaffold(
          backgroundColor: _theme.appBarTheme.backgroundColor,
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            backgroundColor: _theme.appBarTheme.backgroundColor,
            automaticallyImplyLeading: false,
            elevation: 0.0,
            centerTitle: false,
            title:
                Image(height: 40.0, image: AssetImage('images/tpb_logo.png')),
          ),
          body: Center(
              child: Padding(
                  padding: EdgeInsets.all(13.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[

                      Form(
                          key: _formKey,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                  child: TextFormField(
                                    controller: name,
                                    keyboardType: TextInputType.phone,
                                    style: TextStyle(color: Colors.black),
                                    decoration: new InputDecoration(
                                        prefixIcon: Icon(Icons.phone_outlined),
                                        filled: true,
                                        hintStyle:  TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w100),
                                        errorStyle: TextStyle(
                                            color: Colors.white,
                                            fontStyle: FontStyle.italic),
                                        hintText: "Phone No. e.g 2557*********",
                                        fillColor: Colors.grey[200],
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5.0),
                                        borderSide: BorderSide(
                                          width: 0,
                                          style: BorderStyle.none,
                                        ),

                                      ),),
                                    textInputAction: TextInputAction.next,
                                    autofocus: true,
                                    onFieldSubmitted: (v) {
                                      FocusScope.of(context)
                                          .requestFocus(focus);
                                    },
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Username cannot be empty';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                  margin: const EdgeInsets.only(bottom: 20.0),
                                  child: TextFormField(
                                    obscureText: _obscureText,
                                    style: TextStyle(color: Colors.black),
                                    decoration: new InputDecoration(
                                        prefixIcon: Icon(Icons.lock_outline_rounded),
                                        suffixIcon: GestureDetector(
                                          child: Icon(_obscureText ? Icons.remove_red_eye : Icons.visibility_off_outlined),
                                          onTap: (){
                                            _toggle();
                                          },
                                        ),
                                        filled: true,
                                      hintStyle:  TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w100),
                                        errorStyle: TextStyle(
                                            color: Colors.white,
                                            fontStyle: FontStyle.italic),
                                        hintText: "Password e.g. **********",
                                        fillColor: Colors.grey[200],
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5.0),
                                        borderSide: BorderSide(
                                          width: 0,
                                          style: BorderStyle.none,
                                        ),

                                      ),
                                    ),
                                    focusNode: focus,
                                    autofocus: false,

                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Password cannot be empty';
                                      }
                                      return null;
                                    },
                                    textInputAction: TextInputAction.go,
                                    controller: password,
                                    onFieldSubmitted: (v) {
                                      if (_formKey.currentState!.validate()) {
                                      var  _body = AuthPost.from(name.text.toString(), password.text.toString());
                                      //_requestForLogin(context, _body);
                                      }
                                    },
                                  ),
                                ),
                                ResponsiveButton('responsive_button',
                                    key: Key('value'),
                                    textColor: Colors.white,
                                    iconData: Icons.dialpad,

                                    title: 'Sign In', tapCallback: () {
                                      if (_formKey.currentState!.validate()) {
                                        var body = AuthPost.from(name.text.toString(), password.text.toString());
                                        //_requestForLogin(context,  body);
                                  }
                                })
                              ])),

                      Container(
                          child: Row(
                        children: <Widget>[
                          Text('Don\'t have account?',style: _theme.textTheme.headline3),
                          TextButton(
                            style: ButtonStyle(textStyle: MaterialStateProperty.all(TextStyle(color: Colors.blue)),
                                backgroundColor: MaterialStateProperty.all(Colors.transparent)),
                            child: Text(
                              'Sign up',
                              style: _theme.textTheme.headline2,
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, '/signup');

                            },
                          )
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                      ))
                    ],
                  ))))
    ]);
  }

}


Future<bool?> isloggedIn() async {
  var sp = SharedPreference.getInstance();
  return await sp.getBoolValuesSF(enumKey.IS_LOGGED_IN.toString());
}

