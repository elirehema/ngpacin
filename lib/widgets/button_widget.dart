import 'package:mobile/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:mobile/utils/utils.dart';

class ResponsiveButton extends StatefulWidget {
  final String title;
  final IconData iconData;
  final Color textColor;
  final GestureTapCallback tapCallback;

  const ResponsiveButton(String s,
      {required Key key,
      required this.iconData,
      required this.title,
      required this.textColor,
      required this.tapCallback})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _ResponsiveButtonWidgetState();
}

class _ResponsiveButtonWidgetState extends State<ResponsiveButton> {
  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
            onPressed: widget.tapCallback,
            child: Text(' ${widget.title}',style: TextStyle(fontWeight: FontWeight.w600, color:widget.textColor),),
            style: Utils.coloredButtonStyle(Constants.clr_blue)
          );
  }
}
