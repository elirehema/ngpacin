import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/data/post_api_service.dart';
import 'package:mobile/model/changes.dart';
import 'package:mobile/model/contribution.dart';
import 'package:mobile/model/loan_payload.dart';
import 'package:mobile/screens/index.dart';
import 'package:mobile/utils/Constants.dart';
import 'package:mobile/utils/colors.dart';
import 'package:mobile/utils/utils.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:intl/intl.dart';

class ScreenLoanApplicationConfirm extends StatelessWidget {
  final LoanPayload loanPayload;
  var paymentType, loanType, groupName,otherMemberName;
  ScreenLoanApplicationConfirm(this.loanPayload, {this.loanType, this.paymentType, this.groupName, this.otherMemberName });
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: scaffoldBackgroundColor,
      appBar: AppBar(

        title: Text('title.check_and_confirm'.tr()),
        backgroundColor: colorPrimary,
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0.0,
      ),
      body: Card(
          shadowColor: Constants.clr_blue,
          shape: Utils.cardShapeRound(),
          child:Container(
          padding: EdgeInsets.all(10.0),
          child:  Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [

                  ListTile(
                    dense: true,
                    title: Text('title.payment_type'.tr(), style: TextStyle(fontSize: 20.0)),
                    trailing: Text( paymentType.toString().isEmpty ? loanPayload.paymentType : paymentType, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    dense: true,
                    title: Text('title.loan_type'.tr(args: ['']), style: TextStyle(fontSize: 20.0)),
                    trailing: Text(loanType.toString().isEmpty ? loanPayload.loanType :loanType,
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    dense: true,
                    title:
                    Text('title.amount'.tr(), style: TextStyle(fontSize: 20.0)),
                    trailing: Text(
                      '${Constants.currencyFormat.format(loanPayload.amount)}',
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                  ),
                  Divider(),

                  ListTile(
                    dense: true,
                    title: Text('title.group_id'.tr(), style: TextStyle(fontSize: 20.0)),
                    trailing: Text(groupName.toString().isEmpty ?  loanPayload.groupId.toString() : groupName,
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                  ),
                  Divider(),
                 SizedBox(height: 20.0,),
                 Visibility(
                      visible: loanPayload.forOthers == '1',
                      child: Container(
                        color: Constants.clr_light_grey,
                        padding: EdgeInsets.all(10.0),
                        child:  Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text('title.apply_for'.tr(), style: TextStyle(fontWeight: FontWeight.bold, ),),
                              ListTile(
                                dense: true,
                                title:
                                Text('title.member_name'.tr(), style: TextStyle(fontSize: 20.0)),
                                trailing: Text('$otherMemberName',
                                  style:
                                  TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                                ),
                              ),

                            ]),
                      )),
                  Spacer(),
                  ElevatedButton(
                    style: Utils.buttonStyle(),
                    onPressed: () async{
                      await _confirmLoanAPplication(context,  loanPayload);
                    },
                    child: Text('button.submit_loan'.tr(), style: TextStyle(color: Colors.white)),
                  ),

                ],
              ),)),
    );
  }
}

Future<void> _confirmLoanAPplication(BuildContext context,LoanPayload loanPayload) async {
  ProgressDialog pr = new ProgressDialog(context,
      type: ProgressDialogType.Normal,
      isDismissible: true,
      showLogs: false);

  pr.update(
    progress: 50.0,
    message: 'dialog.progress_wait'.tr(),
    progressWidget: Container(padding: EdgeInsets.all(8.0), child: CircularProgressIndicator()),
    maxProgress: 100.0,
    progressTextStyle: TextStyle(color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
    messageTextStyle: TextStyle(color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600),
  );
  pr.show();
  var  response = await Provider.of<PostApiService>(context,listen: false).applyLoan(loanPayload);


  Changes authResponse = response.body!;
  //String httpClientResponse = response;
  final int statusCode = response.statusCode;
  if (statusCode == 200) {
    pr.hide();
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
                Navigator.of(context).pop();
              },
            )
          ],
        ));
  }else{
    pr.hide();
  }
}