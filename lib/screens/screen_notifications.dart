import 'dart:ui';
import 'package:chopper/chopper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile/data/post_api_service.dart';
import 'package:mobile/model/notification.dart';
import 'package:mobile/screens/index.dart';
import 'package:mobile/utils/Constants.dart';
import 'package:mobile/utils/colors.dart';
import 'package:built_collection/built_collection.dart';
import 'package:mobile/utils/util.dart';
import 'package:mobile/widgets/widget_not_found.dart';
import 'package:mobile/widgets/widget_something_happened.dart';
import 'package:provider/provider.dart';


class ScreenNotifications extends StatefulWidget {


  @override
  _ScreenNotificationsState createState() => _ScreenNotificationsState();
}
class _ScreenNotificationsState extends State<ScreenNotifications>{
  late ThemeData _theme;
  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: _theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text('Notifications', style: _theme.textTheme.headline3),
        backgroundColor: _theme.appBarTheme.backgroundColor,
        iconTheme: _theme.iconTheme,
        elevation: 0.0,
        leading: Utils.backArrow(),
        titleSpacing: 0,
      ),
      body: _buildBody(context)

    );
  }
  FutureBuilder<Response<BuiltList<Notifications>>> _buildBody(BuildContext context) {
    return FutureBuilder<Response<BuiltList<Notifications>>>(
      future: Provider.of<PostApiService>(context).getNotifications(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          print(snapshot.data!.body);
          BuiltList<Notifications>? _notifications = snapshot.data!.body;
          if(_notifications!.length==0){
            return NothingFoundWarning(message: 'no_notification',);
          } else if(snapshot.hasError){
            return SomethingWrongHasHappened();
          } else {
            final BuiltList<Notifications>? notifications = snapshot.data?.body;
            return  _buildNotifications(context, notifications);
          }
        }

        else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  ListView _buildNotifications(BuildContext context, BuiltList<Notifications?> ?notifications) {
    return ListView.separated(
        itemCount: notifications!.length,
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.symmetric(vertical: 0.0),
        physics: const AlwaysScrollableScrollPhysics(),
        separatorBuilder: (BuildContext context, int index) => Divider(height: 1),
        itemBuilder: (context, index) {
          return  ListTile(
            tileColor: index % 2==0?  Colors.transparent : _theme.cardTheme.color,
                title: Padding(padding: EdgeInsets.symmetric(vertical: 10.0), child: Text('Group Name:  ${notifications[index]?.groupName}', style: _theme.textTheme.headline2,),),
                subtitle: Text('${notifications[index]?.description}', style: _theme.textTheme.headline3,),
                leading: Icon(Icons.info_outline, color: _theme.iconTheme.color,),
                onTap: (){
                  Navigator.pushReplacement(context,    MaterialPageRoute(builder: (context) => new ScreenViewNotifications(notifications[index]!)));
                },
              );
        });
  }



}


