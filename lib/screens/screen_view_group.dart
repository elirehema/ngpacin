import 'dart:convert';
import 'dart:typed_data';

import 'package:chopper/chopper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/data/post_api_service.dart';
import 'package:mobile/model/get_groups.dart';
import 'package:mobile/screens/index.dart';
import 'package:mobile/screens/screen_cash_out.dart';
import 'package:mobile/screens/screen_group_current_settings.dart';
import 'package:mobile/utils/Constants.dart';
import 'package:mobile/utils/colors.dart';
import 'package:mobile/utils/utils.dart';
import 'package:mobile/widgets/widget_something_happened.dart';
import 'package:provider/provider.dart';
import 'package:built_collection/built_collection.dart';
import 'package:easy_localization/easy_localization.dart';

class GroupAction {
  final int index;
  final String subtitle;
  final IconData icon;
  final Color? color;
  final String? code;
  final bool showInMain;
  final String groupType;
  final List<String> to;

  const GroupAction(this.index, this.subtitle, this.icon, this.color, this.code,this.showInMain, this.groupType, this.to);
}
final List<GroupAction> actions = <GroupAction>[
  GroupAction(1, 'button.contribute', Icons.volunteer_activism_outlined, Colors.yellow[200], null, true,'1', ['MEMBER', 'CHAIRPERSON','TREASURER','SECRETARY']),
  GroupAction(2, 'button.transfer', Icons.send_to_mobile_outlined, Colors.lightBlueAccent,null, true,'1', [ 'CHAIRPERSON','TREASURER','SECRETARY']),
  GroupAction(2, 'button.transfer', Icons.send_to_mobile_outlined, Colors.lightBlueAccent,null, true,'2',[ 'CHAIRPERSON','TREASURER','SECRETARY']),
  GroupAction(3, 'button.share', Icons.present_to_all_outlined, Colors.blueGrey,null, true,'2',['MEMBER', 'CHAIRPERSON','TREASURER','SECRETARY']),
  GroupAction(4, 'button.loan', Icons.credit_score_outlined, Colors.white12,null, true,'2',['MEMBER', 'CHAIRPERSON','TREASURER','SECRETARY']),
  GroupAction(5, 'button.social_fund', Icons.group_outlined, Colors.white12,null, true,'2',['MEMBER', 'CHAIRPERSON','TREASURER','SECRETARY']),
  GroupAction(6, 'button.penalties', Icons.credit_card_off_outlined, Colors.white12,null, true,'2',['MEMBER', 'CHAIRPERSON','TREASURER','SECRETARY']),
  GroupAction(7, 'button.balance', Icons.account_balance_outlined, Colors.white12,null, true,'1',['MEMBER', 'CHAIRPERSON','TREASURER','SECRETARY']),
  GroupAction(7, 'button.balance', Icons.account_balance_outlined, Colors.white12,null, true,'2',['MEMBER', 'CHAIRPERSON','TREASURER','SECRETARY']),
  GroupAction(8, 'button.settings', Icons.settings_outlined, Colors.white, null, true, '1', ['MEMBER', 'CHAIRPERSON','TREASURER','SECRETARY']),
  GroupAction(8, 'button.settings', Icons.settings_outlined, Colors.white, null, true, '2',['MEMBER', 'CHAIRPERSON','TREASURER','SECRETARY'])
];

class ScreenViewGroup extends StatefulWidget {
  final groupId;
  final int groupType;

  ScreenViewGroup(this.groupId, this.groupType);

  @override
  _ScreenViewGroupState createState() => _ScreenViewGroupState();

}

class _ScreenViewGroupState extends State<ScreenViewGroup> {
  final GlobalKey _menuKey = new GlobalKey();
  var _sharePrice;
  late ThemeData _theme;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }


  _onActionClickHandler(int index, String groupName, String viewerRole) {
    switch (index) {
      case 1:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => new ScreenContribute(widget.groupId, 0, groupType:  widget.groupType)));
        break;
      case 2:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => new ScreenCashOut(widget.groupId, widget.groupType)));
        break;
      case 3:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => new ScreenContribute(widget.groupId, 1, sharePrice: _sharePrice,)));
        break;
      case 4:
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return SimpleDialog(
                title:  Text('dialog.select_operation'.tr()),
                children: <Widget>[
                  SimpleDialogOption(
                    onPressed: () {

                    },
                    child: ElevatedButton(
                      style: Utils.coloredButtonStyle(Constants.clr_light_grey),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                new LoanOperationScreen(widget.groupId, 0, widget.groupType, groupName)));
                      },
                      child: Text('button.loan_application'.tr(), style: TextStyle(color: colorPrimary)),
                    ) ,
                  ),
                  SimpleDialogOption(
                    onPressed: () {

                    },
                    child: ElevatedButton(
                      style: Utils.coloredButtonStyle(Constants.clr_light_grey),
                      onPressed: () {
                        GroupAction action = Constants.adminMenus[12];
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                new ScreenLoanList()));
                      },
                      child: Text('button.self_repayment'.tr(), style: TextStyle(color: colorPrimary)),
                    ),
                  ),
                  SimpleDialogOption(
                    onPressed: () {

                    },
                    child: ElevatedButton(
                      style: Utils.coloredButtonStyle(Constants.clr_light_grey),
                      onPressed: () {
                        GroupAction action = Constants.adminMenus[12];
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                new AdministrationScreen(widget.groupId, action.index, action.subtitle, '${action.code}',groupType: widget.groupType,)));
                      },
                      child: Text('button.repay_for_other'.tr(), style: TextStyle(color: colorPrimary)),
                    ),
                  ),

                ],
              );
            }
        );
        break;
      case 5:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => new ScreenContribute(widget.groupId, 2)));
        break;
      case 6:
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => new ScreenContribute(widget.groupId, 3)));
        break;

      case 7:
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => new GroupActionsScreen(widget.groupId, 0, 'title.check_balance'.tr())));
        break;

      case 8:
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => new ScreenGroupCurrentSettings(widget.groupId, widget.groupType, viewerRole)));
        /**dynamic state = _menuKey.currentState;
        state.showButtonMenu();
        **/
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);
    return Container(
        color: colorAccent, child: _futureBody(context, widget.groupId));
  }

  FutureBuilder<Response<BuiltList<Group>>> _futureBody(BuildContext context, int groupId) {
    return FutureBuilder<Response<BuiltList<Group>>>(
      future: Provider.of<PostApiService>(context).getGroupById(groupId.toString()),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          Group group = snapshot.data!.body!.first;
          _sharePrice = group.sharePrice;
          final _groupName = '  ${group.groupName[0].toUpperCase()}${group.groupName.substring(1)} ';
          return  Scaffold(
                backgroundColor: _theme.scaffoldBackgroundColor,
                resizeToAvoidBottomInset: true,
                appBar: AppBar(
                  backgroundColor: _theme.appBarTheme.backgroundColor,
                  elevation: 0.0,
                  leading: Utils.backArrow(),
                  titleSpacing: 0,
                  title: Text(_groupName, style: _theme.textTheme.headline3,),
                  actionsIconTheme: _theme.appBarTheme.actionsIconTheme,
                  actions: [
                    widget.groupType==1? PopupMenuButton<GroupAction>(
                      color: _theme.scaffoldBackgroundColor,
                      key: _menuKey,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
                      icon: Icon(Icons.more_vert,color: Colors.white,),
                      elevation: 0.0,
                      itemBuilder: (BuildContext context) => Constants.adminMenus.where((element) => element.showInMain && element.groupType == widget.groupType.toString())
                          .map(
                            (action) => PopupMenuItem<GroupAction>(
                          padding: EdgeInsets.all(0.0),
                          child: ListTile(
                            leading: CircleAvatar(radius: 20, backgroundColor: colorPrimary, child: Text('${action.code}', style: TextStyle(fontWeight: FontWeight.bold, color: Constants.clr_blue ),),),
                            title: Text(action.subtitle.tr(), style: _theme.textTheme.headline4),),
                          value: action,
                        ),
                      )
                          .toList(),
                      onSelected: (GroupAction action) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                new AdministrationScreen(groupId, action.index, action.subtitle, '${action.code}')));
                      },
                    ):PopupMenuButton<GroupAction>(
                      color: _theme.scaffoldBackgroundColor,
                      key: _menuKey, shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0)),
                      icon: Icon(Icons.more_vert,),
                      elevation: 0.0,
                      itemBuilder: (BuildContext context) => Constants.adminMenus.where((element) => element.showInMain)
                          .map((action) => PopupMenuItem<GroupAction>(
                        padding: EdgeInsets.all(0.0),
                        child: ListTile(
                          leading: CircleAvatar(radius: 20, backgroundColor: colorPrimary, child: Text('${action.code}', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white ),),),
                          title: Text(action.subtitle.tr(),style: _theme.textTheme.headline4,),),
                        value: action,
                      ),).toList(), onSelected: (GroupAction action) {
                        Navigator.push(context, MaterialPageRoute(
                      builder: (context) =>
                      new AdministrationScreen(groupId, action.index, action.subtitle, '${action.code}')));},),
                  ],
                ),
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(2.0),
                      child: Card(
                        shape: _theme.cardTheme.shape,
                        shadowColor: _theme.cardTheme.shadowColor,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                ListTile(
                                dense: false,
                                contentPadding: EdgeInsets.all(0.0),
                                leading: ConstrainedBox(
                                  constraints: BoxConstraints(
                                      minWidth: 50,
                                      minHeight: 50
                                  ),
                                  child:  Utils.buildGroupImage(context, group.groupType, widget.groupId, 50.0),
                                  //Image.asset(groups[index].groupType == '1'?'images/family.png':'images/peoples.png', fit: BoxFit.cover, width: 20.0,),
                                ),
                                title:Text('$_groupName '.trim(), style: _theme.textTheme.headline2),
                                  subtitle: RichText(
                                    text: TextSpan(
                                      text: 'title.group_account'.tr(),
                                      style: _theme.textTheme.headline4,
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: ' ${group.groupAcct} .\t',
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blue,
                                          ),
                                        ),
                                        TextSpan(
                                            text: 'title.share_prices'.tr(),
                                            style: TextStyle(fontSize: 12.0)),
                                        TextSpan(
                                            text: '\t ${group.sharePrice} ',
                                            style: TextStyle(
                                                fontSize: 12.0,
                                                color: Colors.red,
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                  ),
                                ),

                                  SizedBox(
                                    height: 5.0,
                                  ),
                                 Divider(color: _theme.dividerTheme.color,),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                 /** RichText(
                                    text: TextSpan(
                                      text: 'title.group_account'.tr(),
                                        style: _theme.textTheme.headline4,

                                      children: <TextSpan>[
                                        TextSpan(
                                          text: ' ${group.groupAcct} .\t',
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blue,
                                          ),
                                        ),
                                        TextSpan(
                                            text: 'title.share_prices'.tr(),
                                            style: TextStyle(fontSize: 12.0)),
                                        TextSpan(
                                            text: '\t ${group.sharePrice} ',
                                            style: TextStyle(
                                                fontSize: 12.0,
                                                color: Colors.red,
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 40.0,
                                  ),
                                  **/
                                  Wrap(
                                    spacing: 20.0,
                                    children: actions.where((element) => element.groupType == group.groupType && element.to.contains(group.role))
                                        .map((act) => GestureDetector(
                                            child: Column(
                                                children: [
                                                  new CircleAvatar(
                                                    radius: 30,
                                                    backgroundColor: _theme.scaffoldBackgroundColor,
                                                    child: new Icon(
                                                      act.icon,
                                                      color: _theme.iconTheme.color,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5.0,
                                                  ),
                                                  Text('${act.subtitle}'.tr(), style: _theme.textTheme.headline4,),
                                                  SizedBox(
                                                    height: 10.0,
                                                  ),
                                                ],
                                              ),

                                            onTap: () {
                                              _onActionClickHandler(
                                                  act.index, _groupName, group.role);
                                            }))
                                        .toList(),
                                  ),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                ],
                              ),
                            ),

                            Divider(),
                           ListTile(
                             dense: true,
                                leading: Icon(Icons.grain_rounded),
                                title: Text(
                                  'title.group_members'.tr(args: ['${group.totalMembers}']),
                                  style: _theme.textTheme.headline4,
                                ),
                                trailing: Icon(
                                  Icons.arrow_forward_ios_outlined,
                                ),


                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                        new ScreenGroupMembers(group.groupId, int.parse(group.groupType), group.groupName, group.role)));
                              },),

                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                  ],
                ));
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
}
