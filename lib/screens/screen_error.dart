import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/utils/colors.dart';
import 'package:mobile/utils/utils.dart';

class ScreenError extends StatelessWidget {
  final String tile;
  final String description;

  ScreenError(this.tile, this.description);
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
                Image(height: 140.0, image: AssetImage('images/warning_icon.png'), fit: BoxFit.fill,),
                SizedBox(height: 26.0,),
                Text('$tile', textAlign: TextAlign.center, style: TextStyle(fontSize: 26.0),),
                SizedBox(height: 25.0,),
                Text('$description',
                  style: TextStyle(fontSize: 19.0),
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
                  style: Utils.coloredButtonStyle(Constants.clr_blue),
                  onPressed: () { Navigator.of(context).pop();},
                  child: Text('OK', style: TextStyle(color: Colors.white)),
                ),
              ],
            )),
        elevation: 0,
      ),
    );
  }
}