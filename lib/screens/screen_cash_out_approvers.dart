import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile/screens/index.dart';
import 'package:mobile/utils/colors.dart';

enum CashoutApprovers { leaders, random }
var values = {'1', '2', '3', '4', '5','6'};

class ScreenCashOutApprovers extends StatefulWidget {
  @override
  _ScreenCashOutApproversState createState() => _ScreenCashOutApproversState();
}

class _ScreenCashOutApproversState extends State<ScreenCashOutApprovers> {
  CashoutApprovers _site = CashoutApprovers.leaders;
  var actions  =['completed', 'submitted'];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: colorAccent,
      appBar: AppBar(

        title: Text('Cash out approvers'),
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
                  padding:
                      EdgeInsets.symmetric(vertical: 19.0, horizontal: 10.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Should cash out request be approved by random members besides leaders ?',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22.0,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      ListTile(
                        title: const Text('No, only leaders '),
                        leading: Radio(
                          value: CashoutApprovers.leaders,
                          groupValue: _site,
                          onChanged: (CashoutApprovers? value) {
                            setState(() {
                              _site = value!;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: const Text('Leaders and random members'),
                        leading: Radio(
                          value: CashoutApprovers.random,
                          groupValue: _site,
                          onChanged: (CashoutApprovers? value) {
                            setState(() {
                              _site = value!;
                            });
                          },
                        ),
                      ),
                    _site == CashoutApprovers.random ? Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Divider(),
                        SizedBox(height: 10.0,),
                        Text('How many members should also approve ?'),
                   Flexible(child: Row(
                       mainAxisAlignment: MainAxisAlignment.start,
                       children: values.map((text) => Card(
                           shape: RoundedRectangleBorder(
                               side: BorderSide(
                                 color: Colors.grey,
                                 width: 1.0,
                               ),
                               borderRadius: BorderRadius.circular(4.0)
                           ),
                           elevation: 0.8,
                           child: Padding(
                             padding: EdgeInsets.all(15.0),
                             child: Center(
                               child: Text(
                                 '$text ',
                                 textAlign: TextAlign.center,
                                 textScaleFactor: 1.2,
                                 style: TextStyle(fontSize: 12.0),
                               ),
                             ),
                           )
                       )
                       ).toList()
                   ),)

                      ],
                    ): Center()
                    ],
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
                            final _random = new Random();
                            var element =actions[_random.nextInt(actions.length)];
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => ScreenRequestConfirmed('$element')));
                          },
                          child: Text('Save',
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
