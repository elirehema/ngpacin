import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui';

import 'package:chopper/chopper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile/data/post_api_service.dart';
import 'package:mobile/model/group_member.dart';
import 'package:mobile/model/group_member_page.dart';
import 'package:mobile/screens/index.dart';
import 'package:mobile/utils/colors.dart';
import 'package:mobile/utils/utils.dart';
import 'package:mobile/widgets/widget_something_happened.dart';
import 'package:provider/provider.dart';
import 'package:built_collection/built_collection.dart';
import 'package:easy_localization/easy_localization.dart';
class ScreenGroupMembers extends StatefulWidget{
  final groupId, groupType, groupName, viewerRole;
  ScreenGroupMembers(this.groupId,this.groupType, this.groupName, this.viewerRole);

  _ScreenGroupMembersState createState()=>_ScreenGroupMembersState();
}


class _ScreenGroupMembersState extends State<ScreenGroupMembers> {
  late bool _hasMore;
  late int _pageNumber;
  late bool _error;
  late bool _loading;
  late bool _isBottom;
  late List<GroupMember> _members;
  final int _nextPageThreshold = 10;
  var _controller = ScrollController();
  late ThemeData _theme;



  @override
  void initState() {
    super.initState();
    _hasMore = true;
    _pageNumber = 1;
    _error = false;
    _loading = true;
    _isBottom = false;
    _members = [];
    fetchMembers();

    _controller.addListener(() {
      if (_controller.position.atEdge) {
        if (_controller.position.pixels == 0) {
          // You're at the top.
          print('You\'re at the top. ');
        } else {
          // You're at the bottom.
          print('You\'re at the bottom. ');

          setState(() {
            _loading = true;
            _isBottom = true;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: _theme.scaffoldBackgroundColor,
      appBar: AppBar(

        title: Text(widget.groupName+''+'title.group_members'.tr(args: ['']), style: _theme.textTheme.headline3,),
        backgroundColor: _theme.appBarTheme.backgroundColor,
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0.0,
        leading: Utils.backArrow(),
        titleSpacing: 0,
      ),
      body: getBody(),
    );
  }

  Future<void> fetchMembers() async{
    try{
       var response = await  Provider.of<PostApiService>(context, listen:false).getPageableGroupMembers(widget.groupId.toString(), nextPage: _pageNumber.toString());
       if(response.statusCode == 200){
         GroupMemberPage? _page = response.body;
         setState(() {
           _hasMore = _page!.haveNextPage!;
           _loading = true;
           _pageNumber = _pageNumber + 1;
           _members.addAll(_page.members.toList());
         });

       }
    }catch(e){
      setState(() {
        _loading =false;
        _error = true;
      });
    }

  }
  Widget getBody() {
    if (_members.isEmpty) {
      if (_loading) {
        return Center(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: CircularProgressIndicator(strokeWidth: 1.5,),
            ));
      } else if (_error) {
        return Center(
            child: InkWell(
              onTap: () async {
                setState(() {
                  _loading = true;
                  _error = false;
                  fetchMembers();
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text("Error while loading members, tap to try again"),
              ),
            ));
      }
    } else {
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: widget.viewerRole != "MEMBER",
            child:   Container(
              color: Colors.transparent,
              child: ListTile(
                leading: Icon(
                  Icons.add,
                  size: 30.0,
                  color: _theme.iconTheme.color,
                ),
                title: Text(
                  'title.add_group_member'.tr(),
                  style: TextStyle(fontSize: 20.0),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: _theme.iconTheme.color,
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => new ScreenAddGroupMember(widget.groupId, widget.groupType)));
                },
              ),


            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              'title.members'.tr(),
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 2,
            child: ListView.builder(
                controller: _controller,
                itemCount: _members.length + (_hasMore ? 1 : 0),
                itemBuilder: (context, index) {
                  if ((index == _members.length - _nextPageThreshold) && _hasMore && _isBottom) {
                    fetchMembers();
                  }
                  if (index == _members.length) {
                    if (_error) {
                      return Center(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                _loading = false;
                                _error = false;
                                fetchMembers();
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Text(''),
                            ),
                          ));
                    } else {
                      return Center(
                          child: Padding(
                            padding: const EdgeInsets.all(18),
                            child:  _loading ? CircularProgressIndicator(strokeWidth: 1.0,) :  InkWell(
                              onTap: () {
                                setState(() {
                                  _loading = false;
                                  _error = false;
                                  fetchMembers();
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Text("Load more data",style: TextStyle(color:Constants.clr_blue),),
                              ),
                            ),
                          ) );
                    }
                  }
                  final GroupMember member = _members[index];
                  return Container(
                    width: double.maxFinite,
                    margin: const EdgeInsets.only(bottom: 1.0),
                    alignment: Alignment.center,
                    color: _theme.backgroundColor,
                    child: ListTile(
                      leading: Image.asset(
                        'images/user_icon.png',
                        color: Utils.getRoleColor(member.role),
                        height: 24,
                      ),
                      title: Text("${member.firstName}  ${member.familyName}",
                        style: TextStyle(fontWeight: FontWeight.bold),),
                      subtitle: Text('${member.msisdn}', style: _theme.textTheme.headline4,),
                      trailing: Transform.translate(
                          offset: Offset(16,0),
                          child: Chip(
                            padding: const EdgeInsets.symmetric(vertical: 11,horizontal: 5),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20))),
                            backgroundColor: Utils.getRoleColor(member.role),
                            label: Text('${member.role}', style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontSize: 12.0),
                              overflow: TextOverflow.ellipsis,
                            ),
                          )),
                      onTap: widget.viewerRole == 'MEMBER'? null : () {
                        showModalBottomSheet(
                            context: context,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.0)
                            ),
                            builder: (context) {
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Padding(padding: EdgeInsets.all(10.0),
                                    child: ListTile(
                                      leading: Text('modal.choose_option'.tr(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),),
                                      trailing: Icon(Icons.close_rounded, size: 30.0,),
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                    ),),

                                  ListTile(
                                    dense: true,
                                    leading: new Icon(Icons.account_circle_outlined),
                                    title: new Text('modal.update_member_role'.tr()),
                                    onTap: () {
                                      GroupAction action = Constants.adminMenus[8];
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                              new AdministrationScreen(widget.groupId, action.index, action.subtitle, '${action.code}',memberNumber: member.msisdn,)));
                                    },
                                  ),

                                  Visibility(
                                    visible: widget.groupType == 2,
                                    child:Divider(),),
                                  Visibility(
                                    visible: widget.groupType == 2,
                                    child:ListTile(
                                      dense: true,
                                      leading: new Icon(Icons.payments_sharp),
                                      title: new Text('modal.add_penalty'.tr()),
                                      onTap: () {
                                        GroupAction action = Constants.adminMenus[11];
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                new AdministrationScreen(widget.groupId, action.index, action.subtitle, '${action.code}',memberNumber: member.msisdn,)));
                                      },
                                    ),),


                                  Divider(),
                                  ListTile(
                                    dense: true,

                                    leading: new Icon(Icons.delete, color: Colors.red,),
                                    title: new Text('modal.remove_member'.tr()),
                                    onTap: () {
                                      GroupAction action = Constants.adminMenus[10];
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                              new AdministrationScreen(widget.groupId, action.index, action.subtitle, '${action.code}',memberNumber: member.msisdn,)));
                                    },
                                  ),

                                ],
                              );
                            });
                      },
                    ),
                  );
                }),)

        ],
      );
    }
    return Container();
  }

}