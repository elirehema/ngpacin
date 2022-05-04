import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile/screens/index.dart';
import 'package:mobile/screens/screen_groups.dart';
import 'package:mobile/utils/Constants.dart';
import 'package:mobile/utils/colors.dart';
import 'package:mobile/utils/sharedpreference.dart';

class Definition {
  const Definition(this.title, this.subsection);

  final String title;
  final List<String> subsection;
}



class ScreenAcceptTermsAndConditions extends StatelessWidget {
  final sp = SharedPreference.getInstance();
  late ThemeData _theme;
  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: _theme.appBarTheme.foregroundColor,
      appBar: AppBar(
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 5.0),
              child: IconButton(
                icon:  Icon(Icons.close, color: _theme.appBarTheme.iconTheme!.color,),
                tooltip: 'Decline Terms & Conditions',
                onPressed: () {
                       Navigator.of(context).pop();
                },
              )),
        ],
        title: Text('Terms and Conditions', style: _theme.textTheme.headline2,),
        automaticallyImplyLeading: false,
        backgroundColor: _theme.appBarTheme.foregroundColor,
        iconTheme: _theme.appBarTheme.iconTheme,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child:ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: Constants.allDefinitions.length,
                itemBuilder: (context, index) {
                  return _buildExpandableTile(Constants.allDefinitions[index]);
                }),

        ),
    );
  }

  Widget _buildExpandableTile(Definition definition){
    return ExpansionTile(
      collapsedBackgroundColor: _theme.appBarTheme.foregroundColor,
      collapsedIconColor: _theme.iconTheme.color,
      title: Text('${definition.title}', style: _theme.textTheme.headline3,),
      children: definition.subsection.map((String element) {
        return ListTile(
          dense: true,
          minLeadingWidth: -2,
          leading: Icon(Icons.adjust_outlined, color: Colors.lightGreen,size: 12.0,),
          title: Text(element),
        );
      }).toList(),
    );

  }
}
