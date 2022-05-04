import 'package:flutter/painting.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/utils/Constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mobile/utils/colors.dart';

class NothingFoundWarning extends StatelessWidget {
  final String? message;
  NothingFoundWarning({this.message});
  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);
    return Scaffold(
      backgroundColor: _theme.scaffoldBackgroundColor,
      body:  Center(
        child:  Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.info_outline, size:52.0,color: _theme.iconTheme.color),
            SizedBox(height: 10,),
            Text( message != null ? 'info.$message'.tr(): 'No data found', style: _theme.textTheme.headline3,)
          ],
        ),
      ),
    );
  }
}
