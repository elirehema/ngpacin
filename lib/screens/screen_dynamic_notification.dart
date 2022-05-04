import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/screens/screen_view_group.dart';
import 'package:mobile/utils/colors.dart';

class ScreenDynamicNotifications extends StatefulWidget{
  final String title;
  final String message;
  final bool accepted;
  ScreenDynamicNotifications({required this.title, required this.message, required this.accepted});

  @override
  _ScreenDynamicNotificationsState createState() => _ScreenDynamicNotificationsState();
}

class _ScreenDynamicNotificationsState extends State<ScreenDynamicNotifications>{
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: colorAccent,
      appBar: AppBar(

        title: Text('${widget.title}'),
        backgroundColor: colorPrimary,
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0.0,
      ),
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        padding: EdgeInsets.all(10.0),
        child: Card(
            elevation: 1,
            child: Scaffold(
              body: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image(height: 80.0,  image: AssetImage('images/tick.png')),
                          SizedBox(
                            height: 40.0,
                          ),
                          Text(
                            '${widget.message}',
                            style: TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 24.0),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      )

                  )),
              bottomNavigationBar: BottomAppBar(
                color: Colors.transparent,
                child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child:  ElevatedButton(
                          onPressed: () {
                            widget.accepted ? Navigator.of(context).pop() : Navigator.of(context).popUntil((_) => count++ >= 2);
                          },
                          child: Text(widget.accepted ? 'See group' : 'Done', style: TextStyle(color: Colors.white)),

                    )),
                elevation: 0,
              ),
            )),
      ),
    );
  }

}