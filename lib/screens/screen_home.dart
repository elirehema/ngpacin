
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScreenHome extends StatefulWidget {

  _ScreenHomeState createState()=>_ScreenHomeState();
}


class _ScreenHomeState extends State<ScreenHome> {
  ValueNotifier<String> _notifier = ValueNotifier('0');



  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);
    return _body(context);
  }


  Widget _body(BuildContext context) {
    ThemeData _theme = Theme.of(context);
    return Container(
      height: MediaQuery.of(context).size.height - 10,
      margin: EdgeInsets.only(left: 0.0, right: 0.0, top: 5.0, bottom: 0.0),
      decoration: new BoxDecoration(
          color: _theme.scaffoldBackgroundColor,
          borderRadius: new BorderRadius.only(
            topLeft: const Radius.circular(20.0),
            topRight: const Radius.circular(20.0),
          )),
      child: Padding(
          padding: EdgeInsets.only(top: 10.0, left: 3.0, right: 3.0),
          child: Text("")
      ),
    );
  }


}
