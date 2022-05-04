import 'package:mobile/utils/index.dart';
import 'package:mobile/widgets/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          child: Text('EG-SAVINGS',
              maxLines: 1,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          decoration: BoxDecoration(color: colorPrimary),
        ),
        ReusableDrawerListTile(
          subtitle: '',
          title: 'Home',
          leading: MdiIcons.homeCircleOutline,
          disabled: false,
          route: '/home',
          onTap: () {
            Navigator.pushNamed(context, '/home');
          },
        ),
        Divider(),
        ReusableDrawerListTile(
          subtitle: '',
          title: 'About Us',
          leading: MdiIcons.alphaACircleOutline,
          disabled: false,
          route: '/about',
          onTap: () {
            Navigator.of(context).pushNamed('/about');
          },
        ),
        Divider(),
        ReusableDrawerListTile(
          subtitle: '',
          title: 'Contact Us',
          leading: MdiIcons.alphaCCircleOutline,
          disabled: false,
          route: '/contacts',
          onTap: () {
            Navigator.pushNamed(context, '/contacts');
          },
        ),
        Divider(),
        ReusableDrawerListTile(
          subtitle: '',
          title: 'Help',
          leading: MdiIcons.helpCircleOutline,
          disabled: false,
          route: '/help',
          onTap: () {
            Navigator.pushNamed(context, '/help');
          },
        ),
        Divider(),
        ReusableDrawerListTile(
          subtitle: '',
          title: 'This App',
          leading: MdiIcons.alertCircleOutline,
          disabled: false,
          route: '/app',
          onTap: () {
            Navigator.pushNamed(context, '/app');
          },
        ),
        Divider()
      ],
    );
  }
}
