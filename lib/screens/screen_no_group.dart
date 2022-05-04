import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile/screens/screen_create_group.dart';
import 'package:mobile/utils/colors.dart';
import 'package:mobile/utils/utils.dart';
import 'package:easy_localization/easy_localization.dart';


class ScreenNoGroupFound extends StatefulWidget {
  @override
 _ScreenCreateGroupState createState() => _ScreenCreateGroupState();
}

class _ScreenCreateGroupState extends State<ScreenNoGroupFound> {
  bool _hasFamilyAndFriends = false;


  void _onItemTapped() {
    setState(() {
      _hasFamilyAndFriends = !_hasFamilyAndFriends;
    });

  }
  @override
  Widget build(BuildContext context) {
    return _hasFamilyAndFriends ?  familyAndFriendsTab() : noGroupFoundScreen();
  }


Widget familyAndFriendsTab(){
  return DefaultTabController(
    initialIndex: 1,
    length: 2,
    child: Scaffold(
      backgroundColor: colorAccent,
      body:  TabBarView(
        children: <Widget>[
          Center(
            child: Text("Family & friends"),
          ),

          noGroupFound(),
        ],
      ),
    ),
  );

}

Widget noGroupFoundScreen(){
  return new Scaffold(
    resizeToAvoidBottomInset: false,
    backgroundColor: scaffoldBackgroundColor,

    body:  noGroupFound());
}

Widget noGroupFound(){
  return Container(
    height: double.maxFinite,
    width: double.maxFinite,
    padding: EdgeInsets.all(10.0),
    child: Card(
      elevation: 0.0,
        color: scaffoldBackgroundColor,
        shape: Utils.cardShapeRound(),
        child: Container(
          child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image(height: 80.0,  image: AssetImage('images/group_icon.png')),
                  SizedBox(height: 40),
                  Text('message.no_groups_yet'.tr() ,style: TextStyle(fontSize: 21.0),),
                  SizedBox(height: 10.0),
                  Text('message.start_saving_fund_with_friends'.tr(),style: TextStyle(fontSize: 16.0, ),textAlign: TextAlign.center,),
                  SizedBox(height: 20.0,),
                  Text('message.click_to_add_group'.tr(), style: TextStyle(fontWeight: FontWeight.w300),)
                ],
              ),
            ),

        )

    ),
  );
}}