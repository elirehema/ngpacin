

import 'package:flutter/cupertino.dart';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mobile/utils/colors.dart';
import 'index.dart';

class ScreenViewSelectedImage extends StatefulWidget{
  late final File image;

  ScreenViewSelectedImage(String s, { required this.image,});
  @override
  _ScreenViewSelectedImageState createState()=> _ScreenViewSelectedImageState();

}

class _ScreenViewSelectedImageState extends State<ScreenViewSelectedImage>{

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     resizeToAvoidBottomInset: false,
     backgroundColor: colorPrimary,
     appBar: AppBar(
       backgroundColor: colorPrimary,
       elevation: 0.0,
       title: Center(child: Text('Set picture'),),
     ),
     body: Center(
         child: Container(
           width: double.maxFinite,
           height: 400.0,
           child: Image.file(
             widget.image,
             width:  double.maxFinite,
             height: double.maxFinite,
             fit: BoxFit.fitHeight,
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
                 onPressed:(){
                   Navigator.of(context).push(MaterialPageRoute(builder: (context) =>ScreenGroupPictureAddedConfirmed()));
                 },
                 style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black87, )),
                 child: Text('Use photo', style: TextStyle(color:  Colors.white)),
               ),

             ],
           )
       ),
       elevation: 0,
     ),

   );
  }
}
