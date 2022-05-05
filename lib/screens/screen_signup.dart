import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/utils/colors.dart';
import 'package:mobile/model/index.dart';
import 'package:mobile/utils/utils.dart';
import 'package:easy_localization/easy_localization.dart';

class ScreenSignUp extends StatefulWidget{

  _SignUpScreenState createState() => _SignUpScreenState();
}
class _SignUpScreenState extends State<ScreenSignUp> {
   final username = TextEditingController(); final firstname = TextEditingController();
   final lastname= TextEditingController(); final email = TextEditingController();
   final repeatPassword = TextEditingController();
   final password = TextEditingController();
  final focus = FocusNode();
  final _formKey = GlobalKey<FormState>();
  var _value, _networkType,_languageSelected;
   late ThemeData _theme;



  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);
    return Scaffold(
      backgroundColor: _theme.scaffoldBackgroundColor,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: _theme.appBarTheme.backgroundColor,
        automaticallyImplyLeading: false,
        elevation: 0.0,
        centerTitle: true,
        title: Text('Sign Up',style: _theme.textTheme.headline3,),
        leading: Image(height: 40.0, image: AssetImage('images/tpb_logo.png')),
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.all(20.0),
          child: IntrinsicHeight(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Sign Up', style: TextStyle(
                      fontWeight: FontWeight.bold, color: colorPrimary),),
                  SizedBox(
                    height: 16.0,
                  ),
                  TextFormField(
                    maxLength: 15,
                    controller: username,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: 'Phone No.',
                      hintText: 'e.g 255xxx xxx xxx',
                    ),
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Field can not be null';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: firstname,
                    decoration: InputDecoration(
                        labelText: 'First name',
                        hintText: 'e.g John'
                    ),
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Field can not be null';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: lastname,
                    decoration: InputDecoration(

                        labelText: 'Last name',
                        hintText: 'e.g Doe'),
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Field can not be null';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: email,
                    decoration: InputDecoration(

                        labelText: 'Email',
                        hintText: 'e.g john@doe.example.com'),
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Field can not be null';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    controller: password,
                    decoration: InputDecoration(
                        labelText: 'Password ',
                        hintText: 'e.g ******'),
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Field can not be null';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: repeatPassword,
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: 'Repeat password',
                        hintText: 'e.g ******'),
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Field can not be null';
                      }
                      return null;
                    },
                  ),
                  Container(
                      padding: EdgeInsets.only(bottom: 10.0),
                      child: DropdownButtonFormField(
                        value: _value,
                        selectedItemBuilder: (BuildContext context) {
                          return ['English', 'Swahili'].map<Widget>((
                              String item) {
                            return Text('$item',style: _theme.textTheme.headline3,);
                          }).toList();
                        },
                        items: ['English', 'Swahili'].map((String item) {
                          return DropdownMenuItem<String>(
                            child: Text('$item',style: _theme.textTheme.headline3,),
                            value: item,
                          );
                        }).toList(),
                        onChanged: (value) {
                          _languageSelected =
                              value.toString().substring(0, 3).toUpperCase();
                        },
                        validator: (value) {
                          if (value == null) {
                            return 'warning.field_required'.tr();
                          }
                        },
                        hint: Text('selection.language'.tr()),
                        style: TextStyle(color: colorPrimary,
                            fontSize: 16,
                            fontWeight: FontWeight.normal),
                        icon: Icon(Icons.keyboard_arrow_down),
                        isExpanded: true,
                        isDense: true,
                      )
                  ),
                  Spacer(),
                  ElevatedButton(
                    style: Utils.buttonStyle(),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        //_requestForSignUp(context, userPost);
                      }
                    },
                    child:
                    Text('Sign Up', style: TextStyle(color: Colors.white)),
                  )
                ],
              ),
            ),
          )


      ),
    );
  }


}

