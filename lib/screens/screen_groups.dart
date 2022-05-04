import 'dart:convert';
import 'dart:core';
import 'dart:typed_data';
import 'package:chopper/chopper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/data/post_api_service.dart';
import 'package:mobile/model/current_user.dart';
import 'package:mobile/model/get_groups.dart';
import 'package:mobile/screens/index.dart';
import 'package:mobile/utils/Constants.dart';
import 'package:mobile/utils/colors.dart';
import 'package:mobile/utils/sharedpreference.dart';
import 'package:mobile/utils/util.dart';
import 'package:mobile/widgets/widget_something_happened.dart';
import 'package:provider/provider.dart';
import 'package:built_collection/built_collection.dart';
import 'package:easy_localization/easy_localization.dart';

class ScreenGroups extends StatelessWidget {
  late ThemeData _theme;
  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);
    return Scaffold(
      backgroundColor: _theme.scaffoldBackgroundColor,
      extendBody: true,

      body: Expanded(child: _buildBody(context)),

    );
  }

  FutureBuilder<Response<BuiltList<Group>>> _buildBody(BuildContext context) {
    return FutureBuilder<Response<BuiltList<Group>>>(
      future: Provider.of<PostApiService>(context).getGroups(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          BuiltList<Group>? _groups = snapshot.data?.body;
          if (_groups!.isEmpty) {
            return  ScreenNoGroupFound();
          } else if (snapshot.hasError) {
            return SomethingWrongHasHappened();
          } else {
            final BuiltList<Group> ? posts = snapshot.data?.body;
            _confirmContribution(context);
            return _buildGroupsList(context, posts);
          }
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
  ListView _buildGroupsList(BuildContext context, BuiltList<Group>? groups) {
    return ListView.builder(
        itemCount: groups!.length,
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(8.0),
        physics: const AlwaysScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return GestureDetector(
            child: Card(
              shape: Utils.cardShapeRound(),
              shadowColor: colorPrimary,
              child: ListTile(
                  dense: true,
                  leading: ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: 50,
                      minHeight: 50
                    ),
                    child:  Utils.buildGroupImage(context, groups[index].groupType, groups[index].groupId, 10.0),
                    //Image.asset(groups[index].groupType == '1'?'images/family.png':'images/peoples.png', fit: BoxFit.cover, width: 20.0,),
                  ),
                  title: Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(groups[index].groupName, style: _theme.textTheme.headline2,),

                        SizedBox(height: 10),
                      RichText(
                        text: TextSpan(
                          style: TextStyle(color: Colors.black38),
                          children: <TextSpan>[
                            TextSpan(text: 'title.share_price'.tr(args: ['${groups[index].sharePrice}']), style: _theme.textTheme.headline3),
                            TextSpan(),
                            TextSpan(text: '\t\t'+'title.group_ac'.tr(args: ['${groups[index].groupAcct}']), style: _theme.textTheme.headline3),
                          ],
                        ),
                      ),

                        SizedBox(height: 10),
                        LinearProgressIndicator(
                          value: 0.45,
                          minHeight: 1.0,
                          color: colorPrimary,
                          backgroundColor: colorAccent,
                          semanticsLabel: 'Linear progress indicator',
                        ),
                        SizedBox(height: 10),
                        RichText(
                          textAlign: TextAlign.start,
                          text: TextSpan(text: 'title.with'.tr(), style: _theme.textTheme.headline3,
                            children: <TextSpan>[
                              TextSpan(text: 'title.no_of_members'.tr(args: ['${groups[index].totalMembers}']), style:  _theme.textTheme.headline3,
                              ),

                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => new ScreenViewGroup(groups[index].groupId, int.parse(groups[index].groupType))));
            },
          );
        });
  }
}


Future<void> _confirmContribution(BuildContext context) async {
  //final _formKey = GlobalKey<FormState>();
  final response = await Provider.of<PostApiService>(context,listen: false).getLoggedInUser();

  CurrentUser _currentUser = response.body!;
  final int statusCode = response.statusCode;
  if (statusCode == 200) {
    SharedPreference sp = SharedPreference.getInstance();
    await sp.setStringToSF(currentUserEnum.LANGUAGE.toString(), _currentUser.language!);
    await sp.setStringToSF(currentUserEnum.NETWORK.toString(), _currentUser.network!);
  }
}
