import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:mobile/utils/index.dart';
import 'package:mobile/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:mobile/model/auth_post.dart';

class ScannerScreen extends StatefulWidget {

  @override
  _ScannerScreenState createState() => new _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  final password  = TextEditingController();
  final name = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final focus = FocusNode();
  bool _obscureText = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);
    return Stack(children: <Widget>[
      Scaffold(
          backgroundColor: _theme.appBarTheme.backgroundColor,
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            backgroundColor: _theme.appBarTheme.backgroundColor,
            automaticallyImplyLeading: false,
            elevation: 0.0,
            centerTitle: false,
            title:
            Image(height: 40.0, image: AssetImage('images/tpb_logo.png')),
          ),
          body: Center(
              child: Padding(
                  padding: EdgeInsets.all(13.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[

                      Form(
                          key: _formKey,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ResponsiveButton('responsive_button',
                                    key: Key('value'),
                                    textColor: Colors.white,
                                    iconData: Icons.dialpad,

                                    title: 'Scan', tapCallback: () async{
                                      if (_formKey.currentState!.validate()) {
                                        String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
                                            "#ff6666", "Cancel", false, ScanMode.DEFAULT);
                                      }
                                    })
                              ])),


                    ],
                  ))))
    ]);
  }

}


