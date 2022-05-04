import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/screens/index.dart';
import 'package:mobile/utils/colors.dart';
import 'package:mobile/utils/util.dart';

class ScreenViewGroupNotifications extends StatefulWidget{
  
  
  @override
  _ScreenViewGroupNotificationsState createState() => _ScreenViewGroupNotificationsState();
  
}

class _ScreenViewGroupNotificationsState extends State<ScreenViewGroupNotifications>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: colorAccent,
      appBar: AppBar(

        title: Text('Construction of A Mosque'),
        backgroundColor: colorPrimary,
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0.0,
        leading: Utils.backArrow(),
        titleSpacing: 0,
      ),
      body: new Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 0,
            child: Container(
              color: Colors.deepPurple,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .35,
              padding: EdgeInsets.all(0.0),
              child:Stack(
                alignment: Alignment.topRight,
                children: <Widget>[
              Image.network(
                  'https://www.unicef.org/esa/sites/unicef.org.esa/files/styles/hero_desktop/public/UN0228468_1.jpg?itok=vNqthdgg',
                width: double.infinity,  height: double.maxFinite,fit: BoxFit.fitWidth, ),
                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Chip(
                        padding: EdgeInsets.symmetric(horizontal: 1.0, vertical: 0.0),
                        backgroundColor: Colors.white,
                        label: Text('Join as member',style: TextStyle(color: Colors.blueGrey),),
                      )
                  ),]),
            ),
          ),
           Positioned(
            top: MediaQuery.of(context).size.height * .29,
            left: 10,
            right: 10,
            child: Card(
              elevation: 2.0,
              color: Colors.white,
              shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              child: Container(
                width: MediaQuery.of(context).size.height * .90,
                padding: EdgeInsets.all(12.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Text('Construction of Mosque', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 26.0),),),
                    Text('We need to get contributors and funds to continue with the construction started two years age'),
                    SizedBox(height: 10.0,),
                    RichText(
                      text: TextSpan(
                        text: 'Group \t',
                        style: TextStyle(color: Colors.black38),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'ID. 18370382  \t .',
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          TextSpan(
                              text: ' Created by ',
                              style: TextStyle(fontSize: 12.0)),
                          TextSpan(
                              text: 'Alex Kura ',
                              style: TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),

                    SizedBox(height: 40.0,),
                    Center(
                      child: RichText(
                        text: TextSpan(
                          text: 'Expires in',
                          style: TextStyle(color: Colors.black38),
                          children: <TextSpan>[
                            TextSpan(
                              text: '48h',
                              style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 40.0,),
                    ElevatedButton(
                      onPressed: () {
                        final message = 'You have successfully joined the group';
                        final title = 'Invitation accepted';
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ScreenDynamicNotifications(title: title, message: message, accepted: true)));
                      },
                      child: Text('Join group',
                          style: TextStyle(color: Colors.white)),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all(Colors.black)),
                      onPressed: () {
                        final message = 'You have rejected the invite successfully';
                        final title = 'Invitation rejected';
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ScreenDynamicNotifications(title: title, message: message, accepted: false)));
                      },
                      child: Text('Reject invite',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ),
            ),
          ),

        ],
      ),

    );
  }
  
}