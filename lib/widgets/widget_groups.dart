import 'package:mobile/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Transactions extends StatefulWidget {
  final String mTitle, mDataInfo, mDataDate;
  final String subTitle;
  final IconData iconData;
  final GestureTapCallback tapCallback;

  const Transactions( {
    required this.iconData,
    required this.mTitle,
    required this.subTitle,
    required this.mDataDate,
    required this.mDataInfo,
    required this.tapCallback
  }) ;

  @override
  State<StatefulWidget> createState() => _TransactionsWidgetState();
}

class _TransactionsWidgetState extends State<Transactions> {
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
                leading: new CircleAvatar(
                  radius: 30,
                  backgroundColor: green1.withOpacity(0.8),
                  child: new Icon(
                    MdiIcons.accountGroup,
                    color: Colors.white,
                  ),
                ),
                title: Text(
                  widget.mTitle ,
                  style: TextStyle(color: gray3),
                ),
                subtitle: Text(widget.subTitle ),
                onTap: widget.tapCallback,
              ),
              
            ),
            Expanded(
              flex: 1,
              child: ListTile(
                title: Text(
                  widget.mDataInfo  ,
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      color: colorAccent, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  widget.mDataDate,
                  textAlign: TextAlign.end,
                ),
              ),
            )
          ])),
    );
  }
}
