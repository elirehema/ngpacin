import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/data/post_api_service.dart';
import 'package:mobile/model/balance.dart';
import 'package:mobile/model/current_user.dart';
import 'package:mobile/screens/index.dart';
import 'package:mobile/screens/screen_groups.dart';
import 'package:mobile/screens/screen_notifications.dart';
import 'package:mobile/utils/colors.dart';
import 'package:mobile/utils/index.dart';
import 'package:mobile/widgets/matcap/mat_cap_switch.dart';
import 'package:mobile/widgets/widget_something_happened.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

class ScreenHome extends StatefulWidget {

  _ScreenHomeState createState()=>_ScreenHomeState();
}


class _ScreenHomeState extends State<ScreenHome> {
  ValueNotifier<String> _notifier = ValueNotifier('0');
  bool isSwitched = true;
  String greetingMessage(){

    var timeNow = DateTime.now().hour;

    if (timeNow <= 12) {
      return 'greetings.morning';
    } else if ((timeNow > 12) && (timeNow <= 16)) {
      return 'greetings.afternoon';
    } else if ((timeNow > 16) && (timeNow < 20)) {
      return 'greetings.evening';
    } else {
      return 'greetings.night';
    }
  }
  Timer? timer;


  @override
  void initState() {
    super.initState();
    _notifier.value = '0';
    timer = Timer.periodic(Duration(seconds: 50), (Timer t) => {
      Provider.of<PostApiService>(context, listen: false).getNotifications().then((response) => {
       _updateNotificationLength(response.body?.length),
      })
    });

  }
  void _updateNotificationLength(var value){
      print('Notifications: '+value.toString());
      _notifier.value = value.toString();
  }

  Future<void> _logout() async{
    SharedPreference sp = SharedPreference.getInstance();
    sp.clearSF();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
    _notifier.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return _futureBody(context);
  }


  Widget _body(BuildContext context) {
    ThemeData _theme = Theme.of(context);
    return Container(
      height: MediaQuery.of(context).size.height - 10,
      margin: EdgeInsets.only(left: 0.0, right: 0.0, top: 5.0, bottom: 0.0),
      decoration: new BoxDecoration(
          color: _theme.scaffoldBackgroundColor,
          borderRadius: new BorderRadius.only(
            topLeft: const Radius.circular(20.0),
            topRight: const Radius.circular(20.0),
          )),
      child: Padding(
          padding: EdgeInsets.only(top: 10.0, left: 3.0, right: 3.0),
          child: ScreenGroups()
      ),
    );
  }

  FutureBuilder<Response<Balance>> _balanceCard(BuildContext context) {
    ThemeData _theme = Theme.of(context);
    return FutureBuilder<Response<Balance>>(
        future: Provider.of<PostApiService>(context).getTotalSavingBalances(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
            final Balance? balance = snapshot.data?.body;
            final formatCurrency = new NumberFormat.decimalPattern();
            return Card(
                color: _theme.scaffoldBackgroundColor,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  // if you need this
                  side: BorderSide(
                    color: Colors.white,
                    width: 1,
                  ),
                ),
                child: ListTile(
                  title: Text(
                    'title.m_pesa_balance'.tr(),
                    style: _theme.textTheme.headline3,
                  ),
                  subtitle: Text(isSwitched ? 'title.saving_balance_sh'.tr(args: ['${formatCurrency.format(int.parse(balance!.balance!))}']) : '${'${formatCurrency.format(int.parse(balance!.balance!))}'.toString().replaceAll(RegExp(r"."), "*")}',
                      style: _theme.textTheme.headline1),
                  trailing:  MatCapSwitch(
                    value: isSwitched,
                    tapCallback: (){
                      setState(() {
                        isSwitched = !isSwitched;
                      });
                    },
                  ),
                ));
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }


  FutureBuilder<Response<CurrentUser>> _futureBody(BuildContext context) {
    ThemeData _theme = Theme.of(context);
    return FutureBuilder<Response<CurrentUser>>(
      future: Provider.of<PostApiService>(context).getLoggedInUser(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          final CurrentUser? user = snapshot.data?.body;
          return Scaffold(
            backgroundColor: _theme.appBarTheme.backgroundColor,
            appBar: AppBar(
                backgroundColor: _theme.appBarTheme.backgroundColor,
                automaticallyImplyLeading: false,
                elevation: 0.0,
                bottom: PreferredSize(
                  preferredSize:  Size.fromHeight(100),
                  child:  _balanceCard(context)
                ),
                actionsIconTheme: _theme.appBarTheme.actionsIconTheme,
                actions: [
                  ValueListenableBuilder(
                      valueListenable: _notifier,
                      builder: (BuildContext context, String val, Widget? child) {
                        return new IconButton(
                              icon: Stack(
                                children: [
                                  new Icon(Icons.notifications, color: Colors.white,),
                                  new Visibility(
                                    visible: val !='0',
                                      child: Positioned(
                                      right: 0,
                                      child: Container(
                                        padding: EdgeInsets.all(1),
                                        decoration: new BoxDecoration(
                                          color: Colors.red,
                                          borderRadius: BorderRadius.circular(6),
                                        ),
                                        constraints: BoxConstraints(
                                          minWidth: 12,
                                          minHeight: 12,
                                        ),
                                        child: new Text(
                                          '$val',
                                          style: new TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      )
                                  ))
                                ],
                              ),
                              tooltip: 'dialog.msg.notification'.tr(),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => ScreenNotifications()));
                              },
                            );
                      }),
                  PopupMenuButton<int>(
                    padding: EdgeInsets.all(0.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0)),
                    icon: Icon(Icons.more_vert),
                    itemBuilder: (BuildContext context) =>
                    <PopupMenuEntry<int>>[
                      PopupMenuItem(
                        child: Text('menu.what_is_mkoba'.tr()),
                        value: 1,
                      ),
                      PopupMenuDivider(),
                       PopupMenuItem(
                        child: Text('menu.terms_and_condition'.tr()),
                        value: 2,
                      ),
                     PopupMenuDivider(),
                       PopupMenuItem(
                        child: Text('FAQ'),
                        value: 3,
                      ),

                      PopupMenuDivider(),
                      PopupMenuItem(
                        child: Text('title.logout'.tr()),
                        value: 4
                      )
                    ],
                    onSelected: (int value) {
                      switch (value) {
                        case 1:
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                  new ScreenWhatIsMkoba()));
                          break;
                        case 2:
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                  new ScreenAcceptTermsAndConditions()));
                          break;
                        case 3:
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                  new ScreenFrequentlyAskedQuestions()));
                          break;
                        case 4:
                          _logout();
                          break;
                      }
                    },
                  )
                ],
                titleSpacing: 0,
                leadingWidth: 0.0,
                title: ListTile(
                  dense: true,
                  leading: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: colorPrimary,
                      border: Border.all(color: Colors.blueAccent),
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage('images/tick.png'),
                          fit: BoxFit.contain
                      ),
                    ),
                  ),
                  title: Text(greetingMessage().tr(), style: TextStyle(color: Colors.white),),
                  subtitle: Text('title.hi'.tr(args: [user!.firstname=='null'?'':user.firstname!, user.lastname=='null'?user.username!:user.lastname!]), style: TextStyle(color: Colors.white),),
                ),),
            body: _body(context),

          );
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
