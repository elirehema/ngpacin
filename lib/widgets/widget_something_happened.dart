import 'package:flutter/painting.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/utils/Constants.dart';

class SomethingWrongHasHappened extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child:  Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.cloud_off_outlined, size:42.0,color: Colors.redAccent),
          SizedBox(height: 10,),
          Text('Oops! \n Something wrong has happened. \n Please try again later  ', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.normal, fontSize: 19.0, color: Constants.clr_red),)
        ],
      ),
    );
  }
}
