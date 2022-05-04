import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/data/post_api_service.dart';
import 'package:mobile/model/index.dart';
import 'package:mobile/utils/Constants.dart';
import 'package:mobile/utils/colors.dart';
import 'package:mobile/utils/utils.dart';
import 'package:mobile/widgets/widget_not_found.dart';
import 'package:mobile/widgets/widget_something_happened.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:provider/provider.dart';
import 'package:built_collection/built_collection.dart';
import 'package:easy_localization/easy_localization.dart';

class GroupActionsScreen extends StatefulWidget {
  final int groupId;
  final int action;
  final String title;

  GroupActionsScreen(this.groupId, this.action, this.title,);

  @override
  _GroupActionsScreenState createState() => _GroupActionsScreenState();
}

class _GroupActionsScreenState extends State<GroupActionsScreen> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _borderRadius = 10.0;
  bool isSwitched = false;
  var _value,_msisdn;
  late ThemeData _theme;

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);
    return new Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: _theme.scaffoldBackgroundColor,
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text(widget.title,style: _theme.textTheme.headline3,),
          backgroundColor: _theme.appBarTheme.backgroundColor,
          elevation: 0.0,
          leading: Utils.backArrow(),
          titleSpacing: 0,
        ),
        body: Container(
          padding: EdgeInsets.all(0.0),
          child: _buildChild(widget.action),));
  }

  Widget _buildChild(int? action) {
    if (action == 0) {
      return _checkGroupBalanceWidget();
    }
    return Center(
      child: Text('err.unknown_operation'),
    );
  }
  Widget _checkGroupBalanceWidget() {


    return _form();
  }
  FutureBuilder<Response> _form() {
    String _balanceType ='';
    String _balanceScope ='';
    var _value;
    return FutureBuilder<Response>(
      future: Provider.of<PostApiService>(context).getTemplate('checkbalance'),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final Map map = json.decode(snapshot.data!.bodyString);
          final List<dynamic> balancetypes = map['balanceTypes'];
          final List<dynamic> scopetypes = map['scopeTypes'];

          List<ValueLabel> _balanceTypes = balancetypes.map((obj) => ValueLabel.fromJson(obj)).toList();
          List<ValueLabel> _scopeTypes = scopetypes.map((obj) => ValueLabel.fromJson(obj)).toList();

          if (map.isEmpty) {
            return NothingFoundWarning();
          } else if (snapshot.hasError) {
            return SomethingWrongHasHappened();
          } else {
            // final List<ValueLabel> ? roles = json.decode(snapshot.data?.body);
            return Form(
                key: _formKey,
                child:  Card(
                  shadowColor: Constants.clr_blue,
                  margin: EdgeInsets.all(5.0),
                  shape: Utils.cardShapeRound(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,

                    children: [
                      Container(
                        height: 60.0,
                        margin: EdgeInsets.all(0.0),
                        decoration: BoxDecoration(
                            color: colorPrimary,
                            border: Border.all(
                              color: colorPrimary,),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(_borderRadius),
                                topRight: Radius.circular(_borderRadius))),
                        child: ListTile(
                          leading: CircleAvatar(backgroundColor: Colors.white, child: Icon(Icons.ac_unit, color: colorPrimary,),),
                          title: Text('check_group_balance'.tr(), style: TextStyle(color: Colors.white,),),
                        ),),
                      Padding(
                          padding: EdgeInsets.all(12.0),
                          child:  Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [

                                Container(
                                    padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 5.0),
                                    child: DropdownButtonFormField(
                                      value: _value,
                                      selectedItemBuilder: (BuildContext context) {
                                        return _balanceTypes.map<Widget>((ValueLabel item) {
                                          return Text('${item.label}',style: _theme.textTheme.headline3);
                                        }).toList();
                                      },
                                      items: _balanceTypes.map((ValueLabel item) {
                                        return DropdownMenuItem<String>(
                                          child: Text('${item.label}',style: _theme.textTheme.headline3),
                                          value: item.value,
                                        );
                                      }).toList(),
                                      onChanged: (value) {
                                        _balanceType = value.toString();
                                      },
                                      validator: (value) {
                                        if (value == null) {
                                          return 'warning.field_required'.tr();
                                        }
                                      },
                                      hint: Text('selection.balance_type'.tr()),
                                      style: TextStyle(color: colorPrimary, fontSize: 16, fontWeight: FontWeight.normal),
                                      icon: Icon(Icons.keyboard_arrow_down),
                                      isExpanded: true,
                                      isDense: true,
                                    )),
                                Container(
                                    padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 5.0),
                                    child: DropdownButtonFormField(
                                      value: _value,
                                      selectedItemBuilder: (BuildContext context) {
                                        return _scopeTypes.map<Widget>((ValueLabel item) {
                                          return Text('${item.label}',style: _theme.textTheme.headline3);
                                        }).toList();
                                      },
                                      items: _scopeTypes.map((ValueLabel item) {
                                        return DropdownMenuItem<String>(
                                          child: Text('${item.label}',style: _theme.textTheme.headline3),
                                          value: item.value,
                                        );
                                      }).toList(),
                                      onChanged: (value) {
                                        _balanceScope = value.toString();
                                      },
                                      validator: (value) {
                                        if (value == null) {
                                          return 'warning.field_required'.tr();
                                        }
                                      },
                                      hint: Text('selection.balance_scope'.tr()),
                                      style: TextStyle(color: colorPrimary, fontSize: 16, fontWeight: FontWeight.normal),
                                      icon: Icon(Icons.keyboard_arrow_down),
                                      isExpanded: true,
                                      isDense: true,
                                    )),
                                Visibility(
                                  visible: isSwitched,
                                  child: Text('title.other_member'.tr(),style: TextStyle(fontWeight: FontWeight.bold),),),
                                SizedBox(height: 15.0,),
                                Visibility(
                                  visible: isSwitched,
                                  child: _memberList(context, widget.groupId),),
                                SizedBox(
                                  height: 15.0,
                                ),
                                ListTile(title: Text('title.for_others'.tr()),
                                  trailing: Switch(
                                    value: isSwitched,
                                    onChanged: (value) {
                                      setState(() {
                                        isSwitched = value;
                                      });
                                    },
                                    activeTrackColor: Colors.yellow,
                                    activeColor: Colors.orangeAccent,
                                  ),),
                                SizedBox(height: 50.0,),
                                Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: ElevatedButton(
                                    style: Utils.buttonStyle(),
                                    onPressed: () async {
                                      if(_formKey.currentState!.validate()) {
                                        var _groupId =widget.groupId.toString();
                                        var balanceScope = isSwitched ? null:_balanceScope;
                                        var balanceType = isSwitched ? null:_balanceType;
                                        var forOther = isSwitched ? 1:0;
                                        showDialog(context: context, builder: (BuildContext context) => ChargesConfirmationScreen(_groupId, balanceType, balanceScope, forOther.toString(), _msisdn));

                                      }},
                                    child: Text('button.check_balance'.tr(), style: TextStyle(color: Colors.white)),
                                  ),
                                ),]))
                    ],
                  ),
                ));
          }
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  FutureBuilder<Response<BuiltList<GroupMember>>> _memberList(BuildContext context, int groupId) {
    return FutureBuilder<Response<BuiltList<GroupMember>>>(
      future:
      Provider.of<PostApiService>(context).getGroupMembers(groupId.toString()),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {

          final BuiltList<GroupMember>?  members = snapshot.data!.body;
          return Container(
              padding: EdgeInsets.all(10.0),
              child: DropdownButtonFormField(
                value: _value,
                selectedItemBuilder: (BuildContext context) {
                  return members!.map<Widget>((GroupMember member) {
                    return  Text('${member.firstName} ${member.familyName}',style: _theme.textTheme.headline3,);
                  }).toList();
                },
                items: members?.map((GroupMember member) {
                  return DropdownMenuItem<String>(
                    child:  ListTile(title:Text('${member.firstName} ${member.familyName}'),
                      subtitle: Text('${member.msisdn}',style: _theme.textTheme.headline3),
                      dense: true,),
                    value: member.msisdn,
                  );
                }).toList(),
                onChanged: (value) {
                  _msisdn = value;
                },
                validator: (value) {
                  if (value == null) {
                    return  'warning.field_required'.tr();
                  }
                },
                hint: Text('selection.member'.tr()),
                style: TextStyle(color: colorPrimary, fontSize: 16, fontWeight: FontWeight.normal),
                icon: Icon(Icons.keyboard_arrow_down),
                isExpanded: true,
                isDense: true,
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

class ChargesConfirmationScreen extends StatelessWidget {
  final String  _groupId,  forOthers, bParty; var  balanceType,  balanceScope;
  ChargesConfirmationScreen(this._groupId,this.balanceType, this.balanceScope, this.forOthers, this.bParty);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white.withOpacity(0.0), // this is the main reason of transparency at next screen. I am ignoring rest implementation but what i have achieved is you can see.
        body: FutureBuilder<Response<Fees>>(
          future: Provider.of<PostApiService>(context).getFeesByType(balanceType=='BALANCE'?'balancefee':'statementfee',groupId: _groupId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
              Fees? fee = snapshot.data!.body;
              return CustomDialog(_groupId, balanceType, balanceScope, forOthers, bParty, fee!.charge);
            } else if (snapshot.hasError) {
              return SomethingWrongHasHappened();
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        )
    );
  }
}

class CustomDialog extends StatelessWidget {
  final String _groupId,  balanceType,  balanceScope, forOthers, bParty; String? amount;
  CustomDialog(this._groupId,this.balanceType, this.balanceScope, this.forOthers, this.bParty, this.amount);

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        child:  Container(
          margin: EdgeInsets.only(left: 0.0,right: 0.0),
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                  top: 18.0,
                ),
                margin: EdgeInsets.only(top: 13.0,right: 8.0),
                decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(16.0),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 0.0,
                        offset: Offset(0.0, 0.0),
                      ),
                    ]),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(
                      height: 20.0,
                    ),
                    Center(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: new Text('dialog.msg.check_balance'.tr(args: ['$amount']), style:TextStyle(fontSize: 19.0,color: Colors.white), textAlign: TextAlign.center,),
                        )//
                    ),
                    SizedBox(height: 24.0),
                    InkWell(
                      child: Container(
                        padding: EdgeInsets.only(top: 15.0,bottom:15.0),
                        decoration: BoxDecoration(
                          color:Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(16.0),
                              bottomRight: Radius.circular(16.0)),
                        ),
                        child:  Text(
                          'dialog.btn.proceed'.tr(),
                          style: TextStyle(color: Colors.blue,fontSize: 25.0),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      onTap:(){
                        _checkGroupBalance(context, _groupId, balanceType, balanceScope, forOthers, bParty);
                      },
                    )
                  ],
                ),
              ),
              Positioned(
                right: 0.0,
                child: GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Align(
                    alignment: Alignment.topRight,
                    child: CircleAvatar(
                      radius: 14.0,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.close, color: Colors.red),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
  Future<void> _checkGroupBalance(BuildContext context, String _groupId, String balanceType, String balanceScope, String forOthers, String  bParty ) async {
    ProgressDialog pr = new ProgressDialog(context);
    pr.update(
      progress: 50.0,
      message: 'dialog.progress_wait'.tr(),
      progressWidget: Container(padding: EdgeInsets.all(8.0), child: CircularProgressIndicator()),
      maxProgress: 100.0,
      progressTextStyle: TextStyle(color: Colors.black, fontSize: 13.0,),
      messageTextStyle: TextStyle(color: Colors.black, fontSize: 19.0,),
    );
    pr.show();
    var response = await Provider.of<PostApiService>(context,listen: false).checkBalance(_groupId, balanceType, balanceScope, forOthers: forOthers, bParty: bParty);

    Changes? changes = response.body;
    //String httpClientResponse = response;
    final int statusCode = response.statusCode;
    if (statusCode == 200) {
      pr.hide();
      showDialog(
          context: context,
          builder: (_) => new CupertinoAlertDialog(
            title: new Text('dialog.msg.notification'.tr()),
            content: new Text('${changes!.description}'),
            actions: <Widget>[
              TextButton(
                child: Text('dialog.btn.close'.tr()),
                onPressed: () {
                 var nav = Navigator.of(context);
                  nav.pop();
                  nav.pop();
                  nav.pop();

                },
              )
            ],
          ));
    }
  }
}

