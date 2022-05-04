import 'package:mobile/screens/screen_welcome.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Notifications extends StatefulWidget {
  final String mTitle, mDataInfo, mDataDate;
  final String subTitle;
  final IconData iconData;

  const Notifications(
    String s, {
    required this.iconData,
    required this.mTitle,
    required this.subTitle,
    required this.mDataDate,
    required this.mDataInfo,
  });

  @override
  State<StatefulWidget> createState() => _NotificationsWidgetState();
}

enum Answers { YES, NO, MAYBE }

class _NotificationsWidgetState extends State<Notifications> {



  @override
  Widget build(BuildContext context) {
    //var size = MediaQuery.of(context).size;
    return Material(
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Row(children: <Widget>[
            Expanded(
              flex: 4,
              child: ListTile(
                onTap: () {
                  //_askUser(widget.mTitle);
                   Navigator.of(context).push(MaterialPageRoute(builder: (context) =>ScreenWelcome()));

                },
                leading: new CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.grey,
                  child: new Icon(
                    MdiIcons.informationVariant,
                    color: Colors.white,
                  ),
                ),
                title: Text(
                  widget.mTitle ,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(widget.subTitle ),
              ),
            ),
            Expanded(
              flex: 1,
              child: ListTile(
                subtitle: Text(
                  widget.mDataDate ,
                  textAlign: TextAlign.end,
                ),
              ),
            )
          ])),
    );
  }
}
