import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/screens/index.dart';
import 'package:mobile/utils/colors.dart';

class ScreenCloseGroup extends StatelessWidget {
  final bool allowed;
  ScreenCloseGroup(this.allowed);
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
                Image(height: 100.0, image: AssetImage('images/group.png'), fit: BoxFit.fill,),
                SizedBox(height: 26.0,),
                Text('Close group', textAlign: TextAlign.center, style: TextStyle(fontSize: 26.0),),
                SizedBox(height: 25.0,),
               allowed ? Text('You are about to initiate the group closure. \n Are you sure you want to do this ?', textAlign: TextAlign.center,):
               Text('Apologies, you cannot close the group with balance.  Please contact the group secretary to initiate a cash out request',
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
                allowed ? ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,    MaterialPageRoute(builder: (context) => new ScreenNotifications()));

                  },
                  child: Text('Close group', style: TextStyle(color: Colors.white)),
                ): Text(''),
                allowed ? ElevatedButton(
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black)),
                  onPressed: () { Navigator.of(context).pop();},
                  child: Text('Cancel', style: TextStyle(color: Colors.white)),
                ): Text(''),
               !allowed ? ElevatedButton(
                  onPressed: () { Navigator.of(context).pop();},
                  child: Text('OK', style: TextStyle(color: Colors.white)),
                ):Text('')
              ],
            )),
        elevation: 0,
      ),
    );
  }
}