import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/screens/index.dart';
import 'package:mobile/utils/colors.dart';

class ScreenInfoAlreadyGroupSecretary extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 5.0),
              child: IconButton(
                icon: Icon(Icons.close, color: colorPrimary, size: 30.0,),
                tooltip: 'Close',
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )),
        ],
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.grey),
        elevation: 0.0,
      ),
      body: Center(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image(height: 100.0, image: AssetImage('images/member.png'), fit: BoxFit.fill,),
                SizedBox(height: 26.0,),
                Text('You already have a group secretary', textAlign: TextAlign.center, style: TextStyle(fontSize: 26.0),),
                SizedBox(height: 25.0,),
                Text('Barasa Samweli 2266xxxx is currently the group secretary. Do you want to replace Barasa Samweli by David Kalimwa ?',
                  textAlign: TextAlign.center,),
              ],
            ),
          )
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,    MaterialPageRoute(builder: (context) => new ScreenRequestConfirmed('submitted')));
                  },
                  child: Text('Replace secretary', style: TextStyle(color: Colors.white)),
                ),
                ElevatedButton(
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black)),
                  onPressed: () { Navigator.of(context).pop();},
                  child: Text('Cancel', style: TextStyle(color: Colors.white)),
                )

              ],
            )),
        elevation: 0,
      ),
    );
  }
}