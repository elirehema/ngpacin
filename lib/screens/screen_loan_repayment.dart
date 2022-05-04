import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/data/post_api_service.dart';
import 'package:mobile/model/changes.dart';
import 'package:mobile/model/loan_payload.dart';
import 'package:mobile/model/value_label.dart';
import 'package:mobile/utils/Constants.dart';
import 'package:mobile/utils/colors.dart';
import 'package:mobile/utils/util.dart';
import 'package:mobile/widgets/widget_not_found.dart';
import 'package:mobile/widgets/widget_something_happened.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

class ScreenLoanRepayment extends StatefulWidget{
  final String loanId;
  final String groupId;
  final String loanType;
  final double? balance;
  ScreenLoanRepayment(this.loanId, this.groupId, this.loanType, {this.balance});

  @override
  _ScreenLoanRepayment createState()=>_ScreenLoanRepayment();
}

class _ScreenLoanRepayment extends State<ScreenLoanRepayment> {
  final amount = TextEditingController();
  final _borderRadius = 10.0;
  var _value,  paymentType;
  late ThemeData _theme;


  String? numberValidator(String? value) {
    if (value == null) {
      return null;
    }
    final n = num.tryParse(value);
    if (n == null) {
      return '"$value" is not a valid number';
    }
    return null;
  }

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    amount.text = widget.balance.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: _theme.scaffoldBackgroundColor,
        appBar: AppBar(
          title: Text('title.repayment'.tr(),style: _theme.textTheme.headline3,),
          elevation: 0.0,
          backgroundColor:  _theme.appBarTheme.backgroundColor,
          leading: Utils.backArrow(),
        ),
        body: _body()
    );


  }

  FutureBuilder<Response>  _body() {
    return FutureBuilder<Response>(
      future: Provider.of<PostApiService>(context).getTemplate('paymenttypes'),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final List<dynamic> paymenttypes = json.decode(snapshot.data!.bodyString) ;
          List<ValueLabel> _paymentTypes = paymenttypes.map((obj) => ValueLabel.fromJson(obj)).toList();
          if (paymenttypes.isEmpty) {
            return NothingFoundWarning();
          } else if (snapshot.hasError) {
            return SomethingWrongHasHappened();
          } else {
            // final List<ValueLabel> ? roles = json.decode(snapshot.data?.body);
            return  Card(
              shadowColor: _theme.cardTheme.shadowColor,
              margin: EdgeInsets.all(5.0),
              shape: _theme.cardTheme.shape,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 60.0,
                    margin: EdgeInsets.all(0.0),
                    decoration: BoxDecoration(
                        color: colorPrimary,
                        border: Border.all(
                          color: colorPrimary,
                        ),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(_borderRadius),
                            topRight: Radius.circular(_borderRadius))),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.attach_money_rounded, color: colorPrimary,),
                      ),
                      title: Text(
                        'title.repayment_for'.tr(args: ['Loan : ${widget.loanId}']),
                        style: TextStyle(color: Colors.white,),),

                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),

                  Padding(padding: EdgeInsets.all(12.0),
                      child:
                      Form(
                          key: _formKey, child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [

                            TextFormField(
                              keyboardType: TextInputType.number,

                              controller: amount,
                              autofocus: false,
                              decoration: InputDecoration(
                                  labelStyle: TextStyle(
                                      fontWeight: FontWeight.bold),
                                  labelText: 'title.repayment_amount'.tr(),
                                  suffixText: 'TZS'),
                              validator: (text) {
                                if (text == null || text.isEmpty) {
                                  return 'warning.null_amount'.tr();
                                }
                                return null;
                              },
                              inputFormatters: [
                                CurrencyTextInputFormatter(
                                  decimalDigits: 0,
                                  locale: 'sw',
                                )
                              ],
                            ),
                            SizedBox(height: 20.0,),
                            Text('title.payment_type'.tr(),
                              style: TextStyle(fontWeight: FontWeight.bold),),
                            Container(
                                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                                child: DropdownButtonFormField(
                                  value: _value,
                                  selectedItemBuilder: (BuildContext context) {
                                    return _paymentTypes.map<
                                        Widget>((ValueLabel item) {
                                      return Text('${item.label}', style: _theme.textTheme.headline3,);
                                    }).toList();
                                  },
                                  items: _paymentTypes.map((ValueLabel item) {
                                    return DropdownMenuItem<String>(
                                      child: Text('${item.label}', style: _theme.textTheme.headline3,),
                                      value: item.value,
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                      paymentType = value.toString();
                                  },
                                  validator: (value) {
                                    if (value == null) {
                                      return 'warning.field_required'.tr();
                                    }
                                  },
                                  hint: Text('selection.payment_type'.tr()),
                                  style: TextStyle(
                                      color: colorPrimary,
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal),
                                  icon: Icon(Icons.keyboard_arrow_down),
                                  isExpanded: true,
                                  isDense: true,
                                )),

                            SizedBox(height: 30.0,),
                            ElevatedButton(
                              style: _theme.elevatedButtonTheme.style,
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  LoanPayload _loanPayload = LoanPayload.withId(widget.groupId.toString(), null, amount.text.toString().replaceAll("TZS", "").replaceAll(",", ""), paymentType, widget.loanType, widget.loanId.toString(), '0');
                                  _confirmLoanRepayment(context, _loanPayload);
                                }
                              },
                              child: Text('button.submit_repayment'.tr(),
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ])))
                ],
              ),

            );
          }
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }



  Future<void> _confirmLoanRepayment(BuildContext context, LoanPayload body) async {
    ProgressDialog pr = new ProgressDialog(context);
    pr.update(
      progress: 50.0,
      message: 'dialog.progress_wait'.tr(),
      progressWidget: Container(padding: EdgeInsets.all(8.0), child: CircularProgressIndicator()),
      maxProgress: 100.0,
      progressTextStyle: TextStyle(color: Colors.black, fontSize: 13.0,),
      messageTextStyle: TextStyle(color: Colors.black, fontSize: 19.0,),
    );
    pr.show();
    final response = await Provider.of<PostApiService>(context,listen: false).payLoan(body);

    final Changes? changes = response.body;
    final int statusCode = response.statusCode;
    if (statusCode == 200) {
      pr.hide();
      showDialog(
          context: context,
          builder: (_) =>
          new CupertinoAlertDialog(
            title: new Text('dialog.msg.notification'.tr()),
            content: new Text('${changes?.description}'),
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
}