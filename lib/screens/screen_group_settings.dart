import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/screens/screen_administration.dart';
import 'package:mobile/screens/screen_view_group.dart';
import 'package:mobile/utils/Constants.dart';
import 'package:mobile/utils/colors.dart';
import 'package:mobile/utils/util.dart';
import 'package:easy_localization/easy_localization.dart';

class ScreenGroupSettings extends StatefulWidget {
  final int groupType;
  final int groupId;
  ScreenGroupSettings(this.groupId, this.groupType);

  @override
  _ScreenGroupSettingsState createState() => _ScreenGroupSettingsState();
}

class _ScreenGroupSettingsState extends State<ScreenGroupSettings> {
  bool isSwitched = false;
  final ValueNotifier<int> _valueNotifier = ValueNotifier<int>(0);
  late List<GroupAction> settings;
  late ThemeData _theme;


  @override
  void initState() {
    settings = widget.groupType==1 ? Constants.adminMenus.where((element) => element.showInMain && element.groupType == widget.groupType.toString()).toList() : Constants.adminMenus.where((element) => element.showInMain).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: _theme.scaffoldBackgroundColor,
        appBar: AppBar(
          title: Text('title.group_settings'.tr(), style: _theme.textTheme.headline3,),
          backgroundColor: _theme.appBarTheme.backgroundColor,
          elevation: 0.0,
          leading: Utils.backArrow(),
          titleSpacing: 0,
        ),
        body: Container(
          padding: EdgeInsets.all(0.0),
          child: _groupSettingsList(context, settings)));
  }

  Widget _groupSettingsList(BuildContext context, List<GroupAction> settings){
    return   Expanded(
      flex: 2,
      child: ListView.separated(
        itemCount: settings.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Container(
            width: double.maxFinite,
            margin: const EdgeInsets.all(0.0),
            alignment: Alignment.center,
            color: Colors.transparent,
            child: ListTile(
              leading: CircleAvatar(radius: 20, backgroundColor: _theme.backgroundColor, child: Text('${settings[index].code}', style: _theme.textTheme.headline3,),),
              title: Text(settings[index].subtitle.tr(),style: _theme.textTheme.headline3,),
              trailing: Icon(Icons.chevron_right_sharp, size: 24.0, color: Colors.grey,),
            onTap: (){
                GroupAction action = settings[index];
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) =>
                  new AdministrationScreen(widget.groupId, action.index, action.subtitle, '${action.code}')));
            },
            ),

          );
        },
        separatorBuilder: (context, index) {
          return Divider(height: .6,);
        },
      ),);
  }
}