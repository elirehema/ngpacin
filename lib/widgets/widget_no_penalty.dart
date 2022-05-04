import 'package:flutter/painting.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mobile/utils/Constants.dart';

class NoPenaltyFoundScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);
    return Scaffold(
        backgroundColor: _theme.appBarTheme.backgroundColor,
        body:  Center(
      child:  Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.payments_outlined, size:24.0,color: _theme.iconTheme.color),
          SizedBox(height: 10,),
          Text('No penalty. Please, Try to select another member to see if they have pending penalties ', style: _theme.textTheme.headline3,)
        ],
      ),),
    );
  }
}
