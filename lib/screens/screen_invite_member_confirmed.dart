import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/screens/screen_view_group.dart';
import 'package:mobile/utils/colors.dart';

class ScreenInviteMemberConfirmed extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: colorAccent,
      appBar: AppBar(

        title: Text('Group picture added'),
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
              resizeToAvoidBottomInset: true,
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
                          'The invite has been successfully sent',
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 24.0),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  )),
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
                            Navigator.pop(context);
                          },
                          child: Text('Invite new Member',
                              style: TextStyle(color: Colors.white)),
                        ),
                        ElevatedButton(
                          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black)),
                          onPressed: () {

                          },
                          child: Text('See group',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    )),
                elevation: 0,
              ),
            )),
      ),
    );
  }

}