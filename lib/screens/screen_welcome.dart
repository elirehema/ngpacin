import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/screens/index.dart';
import 'package:mobile/utils/colors.dart';
import 'package:mobile/utils/index.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mobile/utils/util.dart';

class Destination {
  const Destination(this.title, this.icon, this.screen);

  final String title;
  final IconData icon;
  final Widget screen;
}

List<Destination> allDestinations = <Destination>[
  Destination('nav.home', Icons.cottage_outlined, ScreenHome()),
  Destination('nav.products', Icons.credit_score_outlined, ScreenProducts()),
  Destination('nav.settings', Icons.tune_outlined, ScreenSettings())
];

class ScreenWelcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<ScreenWelcome>
    with TickerProviderStateMixin<ScreenWelcome> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);
    return WillPopScope(
        child: Scaffold(
          backgroundColor: _theme.appBarTheme.backgroundColor,
          body: IndexedStack(
            index: _currentIndex,
            children: allDestinations.map<Widget>((Destination destination) {
              return destination.screen;
            }).toList(),
          ),
          floatingActionButton: new Builder(builder: (BuildContext context) {
            return Visibility(
                visible: _currentIndex == 0,
                child: FloatingActionButton(
                    tooltip: 'Create new group',
                    elevation: 2.0,
                    highlightElevation: 3.0,
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    backgroundColor:  colorPrimary,
                    onPressed: () {
                      Future.delayed(Duration.zero, () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => new ScreenCreateGroup()));
                      });
                    }));
          }),
          bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: _theme.bottomNavigationBarTheme.unselectedItemColor,
            selectedItemColor: _theme.bottomNavigationBarTheme.selectedItemColor,
            unselectedIconTheme: _theme.bottomNavigationBarTheme.unselectedIconTheme,
            selectedFontSize: 18.0,
            backgroundColor: _theme.backgroundColor,
            selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
            showSelectedLabels: true,
            showUnselectedLabels: true,
            currentIndex: _currentIndex,
            type: BottomNavigationBarType.fixed,
            elevation: 0.0,
            onTap: (int index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: allDestinations.map((Destination destination) {
              return BottomNavigationBarItem(
                  icon: Icon(
                    destination.icon,
                    color: colorPrimary,
                  ),
                  backgroundColor: Colors.white,
                  label: destination.title.tr());
            }).toList(),
          ),
        ),
        onWillPop: () async {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text(
              "Do you want to close this app ? ",
              style: TextStyle(color: Colors.white),
            ),
            action: SnackBarAction(
              label: 'YES CLOSE',
              textColor: Colors.white,
              onPressed: () async {
                Utils.getOutOfApp();
              },
            ),
          ));

          return false;
        });
  }
}
