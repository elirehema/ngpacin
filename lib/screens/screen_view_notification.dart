import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/data/post_api_service.dart';
import 'package:mobile/model/notification_approve.dart';
import 'package:mobile/model/changes.dart';
import 'package:mobile/model/notification.dart';
import 'package:mobile/utils/Constants.dart';
import 'package:mobile/utils/colors.dart';
import 'package:mobile/utils/index.dart';
import 'package:mobile/utils/utils.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

class ScreenViewNotifications extends StatelessWidget {
  final Notifications notification;
  final  _borderRadius = 10.0;
  late ThemeData _theme;
  ScreenViewNotifications(this.notification);
  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);
    final _buttonWidth = MediaQuery. of(context). size. width/2-20;
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: _theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text('View notification', style: _theme.textTheme.headline3,),
        backgroundColor: _theme.appBarTheme.backgroundColor,
        iconTheme: _theme.iconTheme,
        elevation: 0.0,
        leading: Utils.backArrow(),
        titleSpacing: 0,
      ),
      body: Card(
            shadowColor: _theme.cardTheme.shadowColor,
            margin: EdgeInsets.all(5.0),
            shape: _theme.cardTheme.shape,
            child: Padding(padding: EdgeInsets.all(10.0),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.info,
                    size: 70.0,
                    color: colorPrimary,
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Text(
                    '${notification.description}',
                    style: _theme.textTheme.headline2,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 100.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  ElevatedButton(
                    style: Utils.coloredButtonStyleWithWidth(colorOne, _buttonWidth),
                    onPressed: () async {
                      NotificationApprove _notification = NotificationApprove.reject(notification.requestId, notification.groupId.toString());
                      _respondToNotification(context,   _notification);
                    },
                    child: Text('Decline',
                        style: TextStyle(color: Colors.white)),
                  ),
                  Spacer(),
                  ElevatedButton(
                    style: Utils.coloredButtonStyleWithWidth(Constants.clr_blue, _buttonWidth),
                    onPressed: () async {
                      NotificationApprove _notification = NotificationApprove.approve(notification.requestId, notification.groupId.toString());
                      _respondToNotification(context,   _notification);
                    },
                    child: Text('Approve', style: TextStyle(color: Colors.white)),
                  ),

                ],),


                ],
              ),
            ),)),
    );
  }
}
Future<void> _respondToNotification(BuildContext context, NotificationApprove payload) async {
  ProgressDialog pr = new ProgressDialog(context);
  pr.update(
    progress: 50.0,
    message: "Please wait...",
    progressWidget: Container(
        padding: EdgeInsets.all(8.0), child: CircularProgressIndicator()),
    maxProgress: 100.0,
    progressTextStyle: TextStyle(
        color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
    messageTextStyle: TextStyle(
        color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600),
  );
  pr.show();

  final _response = await Provider.of<PostApiService>(context, listen: false).approveNotification(payload);

  final Changes? changes = _response.body;
  final int statusCode = _response.statusCode;

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
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            )
          ],
        ));
  } else {
    pr.hide();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.redAccent,
      content: Text("Something went wrong. Please try again later..."),
    ));
  }
}
