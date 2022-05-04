import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:mobile/screens/index.dart';
import 'package:mobile/utils/colors.dart';

class Destination {
  const Destination(this.title, this.icon, this.screen);
  final String title;
  final IconData icon;
  final Widget screen;
}

List<Destination> allDestinations = <Destination>[
  Destination('Home', Icons.home,   ScreenHome()),
  Destination('Airtime', MdiIcons.fileUploadOutline,  Center(child: Text("Business"),)),
  Destination('Move Money', MdiIcons.cashPlus, Center(child: Text("School"),)),
  Destination('Services', MdiIcons.waterWellOutline, ScreenServicesView()),
  Destination('Settings', MdiIcons.cogOutline,  Center(child: Text("Settings"),))
];

class BottomNavigationWidget extends StatefulWidget {
  static void doSomething(int i) {}
  final GestureTapCallback tapCallback;
  final int currentIndex;

  const BottomNavigationWidget(String s,
      { required this.currentIndex, required this.tapCallback});

  @override
  _BottomNavigationWidgetState createState() => _BottomNavigationWidgetState();
}
class _BottomNavigationWidgetState extends State<BottomNavigationWidget>{
  @override
  Widget build(BuildContext context) {
   return  BottomNavigationBar(
     unselectedItemColor: Colors.grey,
     selectedItemColor: Colors.black,
     showSelectedLabels: true,
     showUnselectedLabels: true,
     currentIndex: widget.currentIndex,
     elevation: 0.0,
     backgroundColor: Theme.of(context).primaryColor,
     type: BottomNavigationBarType.fixed,
     onTap: null,
     items: allDestinations.map((Destination destination){
       return BottomNavigationBarItem(
           icon: Icon(destination.icon),
           backgroundColor: colorPrimary,
           label: destination.title
       );
     }).toList(),
   );
  }
}