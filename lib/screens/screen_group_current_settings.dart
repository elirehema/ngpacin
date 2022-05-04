import 'package:chopper/chopper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/data/post_api_service.dart';
import 'package:mobile/model/group_settings.dart';
import 'package:mobile/screens/screen_group_settings.dart';
import 'package:mobile/utils/colors.dart';
import 'package:mobile/utils/util.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mobile/widgets/widget_something_happened.dart';
import 'package:provider/provider.dart';

class ScreenGroupCurrentSettings extends StatefulWidget {
  final int groupId;
  final int groupType;
  final String viewerRole;

  ScreenGroupCurrentSettings(this.groupId, this.groupType, this.viewerRole);

  @override
  _ScreenGroupCurrentSettingsState createState() =>
      _ScreenGroupCurrentSettingsState();
}

class _ScreenGroupCurrentSettingsState
    extends State<ScreenGroupCurrentSettings> {
  bool isSwitched = false;
  final ValueNotifier<int> _valueNotifier = ValueNotifier<int>(0);
  late ThemeData _theme;


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: _theme.scaffoldBackgroundColor,
        appBar: AppBar(
          title: Text('title.current_group_settings'.tr(), style: _theme.textTheme.headline3,),
          backgroundColor:  _theme.appBarTheme.backgroundColor,
          elevation: 0.0,
          leading: Utils.backArrow(),
          titleSpacing: 0,
          actionsIconTheme: _theme.appBarTheme.actionsIconTheme,
          actions: <Widget>[
            Visibility(
              visible: widget.viewerRole != 'MEMBER',
              child: IconButton(
                icon: Icon(
                  Icons.edit_outlined,
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => new ScreenGroupSettings(widget.groupId, widget.groupType)));
                  // do something
                },
              ),
            )
          ],
        ),
        body: Container(
            padding: EdgeInsets.all(0.0),
            child: _futureBody(context)));
  }


  FutureBuilder<Response<GroupSettings>> _futureBody(BuildContext context) {
    return FutureBuilder<Response<GroupSettings>>(
      future: Provider.of<PostApiService>(context).getGroupSettings(
          widget.groupId.toString()),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          GroupSettings? settings = snapshot.data!.body;
          return _viewCurrentSettings(settings!);
        } else if (snapshot.hasError) {
          return SomethingWrongHasHappened();
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _viewCurrentSettings(GroupSettings setting) {
    return ListView(
      children: ListTile.divideTiles(
          context: context,
          color: _theme.backgroundColor,
          tiles: [
            ListTile(
              title: Text(setting.sharePrice),
            ),
            ListTile(
              title: Text(setting.loanInterest),
            ),
            ListTile(
              title: Text(setting.guaranteeMode),
            ),
            ListTile(
              title: Text(setting.loanFactor),
            ),
            ListTile(
              title: Text(setting.approvalMode),
            ),
            ListTile(
              title: Text(setting.interestType),
            ),
            ListTile(
              title: Text(setting.approvalMembers),
            ),
            ListTile(
              title: Text(setting.creditBroadcast),
            ),
          ]
      ).toList(),);
  }
}