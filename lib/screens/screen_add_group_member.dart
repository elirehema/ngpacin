import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile/data/post_api_service.dart';
import 'package:mobile/model/changes.dart';
import 'package:mobile/model/index.dart';
import 'package:mobile/model/post_member.dart';
import 'package:mobile/utils/colors.dart';
import 'package:mobile/utils/index.dart';
import 'package:mobile/utils/utils.dart';
import 'package:mobile/widgets/widget_not_found.dart';
import 'package:mobile/widgets/widget_something_happened.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:provider/provider.dart';
import 'package:fluttercontactpicker/fluttercontactpicker.dart';
import 'package:easy_localization/easy_localization.dart';


class ScreenAddGroupMember extends StatefulWidget {
  final int groupId;
  final int groupType;
  ScreenAddGroupMember(this.groupId, this.groupType);
  @override
  _ScreenAddGroupMemberState createState() => _ScreenAddGroupMemberState();
}

class _ScreenAddGroupMemberState extends State<ScreenAddGroupMember> {
  final number = TextEditingController();
  final bparty = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var _value, _networkType, _role;
  late ThemeData _theme;

  @override
  void dispose() {
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: _theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text('title.add_group_member'.tr(), style: _theme.textTheme.headline3,),
        backgroundColor: _theme.appBarTheme.backgroundColor,
        leading: Utils.backArrow(),
        titleSpacing: 0,
        elevation: 0.0,
      ),
      body: _body()
    );
  }

  FutureBuilder<Response> _body() {
    final _amount = TextEditingController();
    return FutureBuilder<Response>(
      future: Provider.of<PostApiService>(context).getTemplate('addgroupmember', groupId: widget.groupId.toString(), groupType: widget.groupType.toString()),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final Map map = json.decode(snapshot.data!.bodyString);

          final List<dynamic> network = map['networkTypes'];
          final List<dynamic> roles = map['roles'];
          List<ValueLabel>  _memberRoles = roles.map((obj) => ValueLabel.fromJson(obj)).toList();
          List<ValueLabel> _networkTypes = network.map((obj) => ValueLabel.fromJson(obj)).toList();


          if (map.isEmpty) {
            return NothingFoundWarning();
          } else if (snapshot.hasError) {
            return SomethingWrongHasHappened();
          } else {
            return  Container(
              height: double.maxFinite,
              width: double.maxFinite,
              padding: EdgeInsets.all(3.0),
              child: Card(
                  shape: Utils.cardShapeRound(),
                  shadowColor: Constants.clr_blue,
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Form(
                        key: _formKey,
                        child:Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            //Text('Group name'),
                            SizedBox(height: 8.0,),
                            Text(number.text.isEmpty ? 'title.enter_number'.tr() : 'title.phone_no'.tr()),
                            SizedBox(height: 5.0,),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: TextFormField(
                                    controller: number,
                                    keyboardType: TextInputType.phone,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                    validator: (text) {
                                      if (text == null || text.isEmpty) {
                                        return 'warning.field_required'.tr();
                                      }
                                      return null;
                                    },

                                  ),
                                ),
                                Padding(
                                    padding: EdgeInsets.only(bottom: 0.0),
                                    child: GestureDetector(
                                      onTap: () async {
                                        var secretaryNumber =
                                        await openContactBook();
                                        number.text =
                                            secretaryNumber.toString();
                                      },
                                      child: Card(
                                          color: colorPrimary,
                                          shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                color: colorPrimary,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                              BorderRadius.circular(4.0)),
                                          elevation: 0.8,
                                          child: Padding(
                                            padding: EdgeInsets.all(14.0),
                                            child: Center(
                                              child: Image.asset(
                                                'images/user_icon.png',
                                                height: 24,
                                              ),
                                            ),
                                          )),
                                    ))
                              ],
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Text('title.member_role'.tr()),
                            Container(
                                padding: EdgeInsets.only(top: 10.0),
                                child: DropdownButtonFormField(
                                  value: _value,
                                  selectedItemBuilder: (BuildContext context) {
                                    return _memberRoles.map<Widget>((ValueLabel role) {
                                      return Text('${role.label}', style: _theme.textTheme.headline3,);
                                    }).toList();
                                  },
                                  items: _memberRoles.map((ValueLabel role) {
                                    return DropdownMenuItem<String>(
                                      child: Text('${role.label}', style: _theme.textTheme.headline3,),
                                      value: role.value,
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    _role = value.toString();
                                  },
                                  validator: (value) {
                                    if (value == null) {
                                      return 'warning.field_required'.tr();
                                    }
                                  },
                                  hint: Text('selection.leader_role'.tr()),
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
                                    return _networkTypes.map<Widget>((ValueLabel item) {
                                      return Text('${item.label}', style: _theme.textTheme.headline3,);
                                    }).toList();
                                  },
                                  items: _networkTypes.map((ValueLabel item) {
                                    return DropdownMenuItem<String>(
                                      child: Text('${item.label}', style: _theme.textTheme.headline3,),
                                      value: item.value,
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    _networkType = value.toString();
                                  },
                                  validator: (value) {
                                    if (value == null) {
                                      return 'warning.field_required'.tr();
                                    }
                                  },
                                  hint: Text('selection.network'.tr()),
                                  style: TextStyle(color: colorPrimary, fontSize: 16, fontWeight: FontWeight.normal),
                                  icon: Icon(Icons.keyboard_arrow_down),
                                  isExpanded: true,
                                  isDense: true,
                                )),


                            SizedBox(
                              height: 5.0,
                            ),
                            Divider(),
                            ListTile(
                              dense: true,
                              title: Text('Note:', style: TextStyle(fontWeight: FontWeight.bold),),
                              subtitle: Padding(
                                padding: EdgeInsets.only(top: 5.0),
                                child: Text('message.secretary_role_for_vodacom_user'.tr()),
                              ),

                            ),
                            Spacer(),
                            ElevatedButton(
                              style:  Utils.buttonStyle(),
                              onPressed:  (){
                                if(_formKey.currentState!.validate()) {
                                  var memberResponse = MemberPost.from(_role.toString().toUpperCase(),number.text.toString(),_networkType);
                                  print(_role.toString().split('.').last.toUpperCase());
                                  _showMyDialog(memberResponse);
                                 // _addGroupMember(context, number, _memberType, widget.groupId,_networkType);
                                }
                              },
                              child: Text('button.check_and_confirm'.tr(), style: TextStyle(color: Colors.white)),
                            ),
                            SizedBox(height: 20.0,)
                          ],
                        )),
                  )),
            );
          }
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
  Future<void> _showMyDialog(final MemberPost body) async {
    return showDialog<void>(
      context: context,
      barrierColor: Colors.black54,
      barrierDismissible:  true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          titlePadding: EdgeInsets.zero,
          backgroundColor: _theme.appBarTheme.backgroundColor,
          title: Container(
            color: colorPrimary,
            child: Padding(padding: EdgeInsets.symmetric(vertical: 20.0),
            child: Center(child:  Text('title.check_and_confirm'.tr(), style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),),),
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ListTile(
                    title:Text('title.member_role'.tr()),
                subtitle: Text(body.role),),
                ListTile(
                  title: Text('title.phone_no'.tr(args: [''])),
                  subtitle: Text(body.bParty),
                ),
                ListTile(
                  title: Text('title.network_type'.tr()),
                  subtitle: Text(body.network),
                )
              ],
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              style: Utils.buttonStyle(),
              child: Text('button.add_member'.tr(), style: _theme.textTheme.headline2,),
              onPressed: () {
               _addGroupMember(context, body);
              },
            ),
          ],
        );
      },
    );
  }

  Future<String> openContactBook() async {
    final PhoneContact contact = await FlutterContactPicker.pickPhoneContact();
    var phoneNumber = contact.phoneNumber!.number
        .toString()
        .replaceAll(new RegExp(r"\s+"), "");
    return phoneNumber;
  }

  void _addGroupMember(BuildContext context, final MemberPost memberResponse  ) async{
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

   final userPostResponse = await Provider.of<PostApiService>(context,listen: false).addGroupMember(widget.groupId, memberResponse );

    final Changes? changes = userPostResponse.body;
    final int statusCode = userPostResponse.statusCode;

    if (statusCode == 200 ) {
      pr.hide();
      showDialog(
          context: context,
          builder: (_) => new CupertinoAlertDialog(
            title: new Text('dialog.msg.notification'.tr()),
            content: new Text('${changes?.description}'),
            actions: <Widget>[
              TextButton(
                child: Text('dialog.btn.close'.tr()),
                onPressed: () {
                  var navigator = Navigator.of(context);
                  navigator.pop();
                  navigator.pop();
                  navigator.pop();
                },
              )
            ],
          ));
    } else if (statusCode == 500) {
      pr.hide();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.redAccent,
        content: Text("Something went wrong. Please, Try again later ..."),
      ));
    } else {
      pr.hide();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.redAccent,
        content: Text("Something went wrong. Please try again later..."),
      ));
    }
  }
}
