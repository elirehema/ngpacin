import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/data/post_api_service.dart';
import 'package:mobile/model/changes.dart';
import 'package:mobile/model/transfer_request.dart';
import 'package:mobile/utils/Constants.dart';
import 'package:mobile/utils/colors.dart';
import 'package:mobile/utils/util.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

class ScreenCheckAndConfirmTransfer extends StatelessWidget {
  final TransferRequest _transferRequest;
  final String _memberName; final int _groupType;
  var loanType, paymentType;
  late ThemeData _theme;
  ScreenCheckAndConfirmTransfer(this._transferRequest, this._memberName,this._groupType, {this.loanType, this.paymentType});
  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: _theme.scaffoldBackgroundColor,
      appBar: AppBar(

        title: Text('title.check_and_confirm'.tr(), style: _theme.textTheme.headline3,),
        backgroundColor: _theme.appBarTheme.backgroundColor,
        iconTheme: _theme.iconTheme,
        elevation: 0.0,
      ),
      body: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          padding: EdgeInsets.all(5.0),
          child: Card(
            shape: Utils.cardShapeRound(),
              shadowColor: Constants.clr_blue,
              child:  Padding(
                  padding: EdgeInsets.all(15.0),
                  child:  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ListTile(
                          title: Text('title.to'.tr(), style: TextStyle(fontSize: 20.0),),
                          trailing:   Text('${ _memberName.isNotEmpty? _memberName: _transferRequest.bParty}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),),
                      ),
                      /**Divider(),
                      ListTile(
                        dense: true,
                        title: Text('From', style: TextStyle(fontSize: 20.0)),
                        trailing: Text(
                          _transferRequest.mobileNumber.toString(),
                          style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                        ),
                      ),
                      **/
                      Divider(),
                      ListTile(
                        dense: true,
                        title:
                        Text('Amount', style: TextStyle(fontSize: 20.0)),
                        trailing: Text(
                          '${Constants.currencyFormat.format(_transferRequest.amount)}',
                          style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                        ),
                      ),
                      Divider(),
                      ListTile(
                        dense: true,
                        title:
                        Text('title.payment_type'.tr(), style: TextStyle(fontSize: 20.0)),
                        trailing: Text(
                          '$paymentType',
                          style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                        ),
                      ),
                      Visibility(
                        visible: _groupType == 2,
                          child: Divider()),
                      Visibility(
                        visible: _groupType == 2,
                        child: ListTile(
                        dense: true,
                        title: Text('title.loan_type'.tr(args: ['']), style: TextStyle(fontSize: 20.0)),
                        trailing: Text(
                          '$loanType',
                          style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                        ),
                      ),),
                      Divider(),
                      Spacer(),
                      ElevatedButton(
                        style: Utils.buttonStyle(),
                        onPressed: () async{
                          await _confirmContribution(context, _transferRequest);
                        },
                        child: Text('button.cash_out'.tr(), style: TextStyle(color: Colors.white)),
                      ),

                    ],
                  ),

              ))),
    );
  }
}

Future<void> _confirmContribution(BuildContext context,TransferRequest _transferRequest) async {

    final response = await Provider.of<PostApiService>(context,listen: false).transfer(_transferRequest);
    Changes authResponse = response.body!;
    final int statusCode = response.statusCode;
    if (statusCode == 200) {
      showDialog(
          context: context,
          builder: (_) => new CupertinoAlertDialog(
            title: new Text('dialog.msg.notification'.tr()),
            content: new Text('${authResponse.description}'),
            actions: <Widget>[
              TextButton(
                child: Text('dialog.btn.close'.tr()),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
              )
            ],
          ));
    }
}

