import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/screens/index.dart';
import 'package:mobile/utils/Constants.dart';
import 'package:mobile/utils/colors.dart';
import 'package:mobile/widgets/widget_colored_tab_bar.dart';

class ScreenProducts extends StatefulWidget {
  @override
  _ScreenProductsState createState() => new _ScreenProductsState();
}

class _ScreenProductsState extends State<ScreenProducts> {
  var index = 0;
  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor:  _theme.appBarTheme.backgroundColor,
            elevation: 0,
            title: Text('nav.products'.tr()),
            titleTextStyle:  _theme.textTheme.headline3,
            bottom: TabBar(
                    padding: EdgeInsets.symmetric(vertical: 2.0),
                    unselectedLabelColor: Colors.white70,
                    indicatorSize: TabBarIndicatorSize.label,
                    labelStyle: TextStyle(fontWeight: FontWeight.bold),
                    unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
                    indicator: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [_theme.appBarTheme.backgroundColor!, _theme.cardTheme.shadowColor!]),
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.redAccent),
                    tabs: [
                      Tab(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text('tabs.loans'.tr(), style: _theme.textTheme.headline3,),
                        ),
                      ),
                      Tab(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text('tabs.savings'.tr(), style: _theme.textTheme.headline3,),
                        ),
                      ),
                    ]),
          ),
          body: TabBarView(children: [
            ScreenLoanList(),
            ScreenSavingsList(),
          ]),
        ));
  }
}
