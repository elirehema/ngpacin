import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:mobile/screens/index.dart';
import 'package:mobile/utils/colors.dart';

class ScreenHelp extends StatelessWidget{
  final titles  = ['M-Koba FAQ', 'M-Koba T&C'];
  final icons  = [MdiIcons.helpCircleOutline, MdiIcons.clipboardListOutline];
  final paths  = [ScreenFrequentlyAskedQuestions(), ScreenAcceptTermsAndConditions()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorAccent,
      appBar: AppBar(

        title: Text('Help'),
        backgroundColor: colorPrimary,
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0.0,
      ),
      body: ListView.builder(
          itemCount: titles.length,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return  Container(
              color: Colors.white,
              child: ListTile(
                leading: Icon(icons[index], size: 30,),
                title: Text('${titles[index]}'),
                trailing: Icon(MdiIcons.chevronRight, size: 30.0,),
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => paths[index]));
                },
              ),
            );
          }) ,
    );
  }


}