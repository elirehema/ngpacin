import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:mobile/model/index.dart';
import 'package:mobile/utils/index.dart';
import 'package:mobile/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:mobile/model/auth_post.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:provider/provider.dart';

import '../data/post_api_service.dart';

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
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            backgroundColor: Colors.white,
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
                                    key: Key('value_1'),
                                    textColor: Colors.white,
                                    iconData: Icons.dialpad,

                                    title: 'Scan Once', tapCallback: () async{
                                      if (_formKey.currentState!.validate()) {
                                        String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
                                            "#ff6666", "Cancel", false, ScanMode.DEFAULT);
                                        if(barcodeScanRes.isNotEmpty){
                                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                            content: Text("Verifying token..."),
                                          ));
                                          VerificationPayload verification = VerificationPayload.from(barcodeScanRes);
                                          _verifyScannedTokens(context, verification);
                                        }
                                      }
                                    }),
                                SizedBox(height: 12.0,),
                                ResponsiveButton('responsive_button',
                                    key: Key('value_2'),
                                    textColor: Colors.white,
                                    iconData: Icons.dialpad,

                                    title: 'Continues Scan (Not recommended)', tapCallback: () async{
                                      if (_formKey.currentState!.validate()) {
                                        FlutterBarcodeScanner.getBarcodeStreamReceiver("#ff6666", "Cancel", false, ScanMode.DEFAULT)
                                        ?.listen((barcode) {
                                          print(barcode);
                                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                            content: Text("Verifying token..."),
                                          ));
                                          VerificationPayload verification = VerificationPayload.from(barcode);
                                          _verifyScannedTokens(context, verification);
                                        });


                                      }
                                    })
                              ])),


                    ],
                  ))))
    ]);
  }
  Future<void> _verifyScannedTokens(BuildContext context, VerificationPayload body) async {

    ProgressDialog pr = new ProgressDialog(context,
        type: ProgressDialogType.Normal,
        isDismissible: true,
        showLogs: false);


    pr.update(
      progress: 100.0,
      message: "Please wait...",
      progressWidget: Container(
          padding: EdgeInsets.all(8.0), child: CircularProgressIndicator()),
      maxProgress: 100.0,
      progressTextStyle: TextStyle(
          color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
      messageTextStyle: TextStyle(
          color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600),
    );
    pr.show();
    final response = await Provider.of<PostApiService>(context,listen: false).verifyScannedTokens(body);
    print(response.body);
    if(response.statusCode == 200) {
      pr.hide();
      VerificationResponse? ver = response.body?.data;
      showDialog(
          context: context,
          builder: (_) => new CupertinoAlertDialog(
            title: new Text('Payment Details'),
            content: new Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('PAYMENT NAME: ${ver?.payerName}'),
                SizedBox(height: 5.0,),
                Text('PAYMENT AMOUNT: ${ver?.amount} ${ver?.currency}'),
                SizedBox(height: 5.0,),
                Text('Description: ${ver?.paymentDesc}'),
                SizedBox(height: 5.0,),
                Text('PAYMENT TYPE: ${ver?.paymentType}'),
                SizedBox(height: 5.0,),
                Text('PAYER ID: ${ver?.payerID}'),
                SizedBox(height: 5.0,),
                Text('PAYMENT REF: ${ver?.paymentReference}'),
                SizedBox(height: 5.0,),
              ],
            ),
            actions: <Widget>[
              TextButton(
                child: Text('dialog.btn.ok'.tr()),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          ));
    }

    final int statusCode = response.statusCode;
    print("Status code: $statusCode");


  }



}


