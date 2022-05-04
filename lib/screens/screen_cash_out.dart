import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttercontactpicker/fluttercontactpicker.dart';
import 'package:mobile/data/post_api_service.dart';
import 'package:mobile/model/group_member_json.dart';
import 'package:mobile/model/transfer_request.dart';
import 'package:mobile/model/value_label.dart';
import 'package:mobile/screens/screen_confirm_transfer.dart';
import 'package:mobile/utils/Constants.dart';
import 'package:mobile/utils/colors.dart';
import 'package:mobile/utils/sharedpreference.dart';
import 'package:mobile/utils/utils.dart';
import 'package:mobile/widgets/widget_not_found.dart';
import 'package:mobile/widgets/widget_something_happened.dart';
import 'package:provider/provider.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';


class ScreenCashOut extends StatefulWidget {
  final int groupId;
  final int groupType;

  ScreenCashOut(this.groupId, this.groupType);

  @override
  _ScreenCashOutState createState() => _ScreenCashOutState();
}

class _ScreenCashOutState extends State<ScreenCashOut> {
  var values = {'1000', '2000', '5000', '10000'};
  final amount = TextEditingController();
  final _borderRadius = 10.0;
  var _payment, _loanType, _value, _msisdn, _memberName, valLoanType, valPaymentType;
  final _formKey = GlobalKey<FormState>();
  late ThemeData _theme;

  @override
  void dispose() {
    super.dispose();
  }

  void _selectAmount(String value) {
    amount.text = value;
  }

  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);
    return new Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: _theme.scaffoldBackgroundColor,
        appBar: AppBar(
          title: Text('title.cash_out'.tr(),style: _theme.textTheme.headline3,),
          backgroundColor: _theme.appBarTheme.backgroundColor,
          iconTheme: _theme.iconTheme,
          elevation: 0.0,
          leading: Utils.backArrow(),
          titleSpacing: 0,
        ),
        body: _body());
  }

  FutureBuilder<Response> _body() {
    return FutureBuilder<Response>(
      future: Provider.of<PostApiService>(context)
          .getTemplate('transfer', groupId: widget.groupId.toString(), groupType: widget.groupType.toString()),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final Map map = json.decode(snapshot.data!.bodyString);
          final List<dynamic> _loans = map['loanTypes'];
          final List<dynamic> _payments = map['paymentTypes'];
          final List<dynamic> _members = map['members'];
          List<JsonGroupMember> members = _members.map((obj) => JsonGroupMember.fromJson(obj)).toList();
          List<ValueLabel> _paymentTypes = _payments.map((obj) => ValueLabel.fromJson(obj)).toList();
          List<ValueLabel> _loanTypes = _loans.map((obj) => ValueLabel.fromJson(obj)).toList();

          if (map.isEmpty) {
            return NothingFoundWarning();
          } else if (snapshot.hasError) {
            return SomethingWrongHasHappened();
          } else {
            return SingleChildScrollView(
              child:Card(
                shadowColor: Constants.clr_blue,
                margin: EdgeInsets.all(5.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(_borderRadius)),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                              Icons.ac_unit,
                              color: colorPrimary,
                            ),
                          ),
                          title: Text(
                            'message.send_money_from_group'.tr(),
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      //Text('Group name'),
                      Padding(
                          padding: EdgeInsets.all(25.0),
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'title.to_number'.tr(),
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Container(
                                    padding: EdgeInsets.all(0.0),
                                    child: DropdownButtonFormField(
                                      value: _value,
                                      selectedItemBuilder: (BuildContext context) {
                                        return members
                                            .map<Widget>((JsonGroupMember member) {
                                          return Text('${member.firstName} ${member.familyName}', style: _theme.textTheme.headline3,);
                                        }).toList();
                                      },
                                      items: members.map((JsonGroupMember member) {
                                        return DropdownMenuItem<String>(
                                          child:  ListTile(title:Text('${member.firstName} ${member.familyName}'),
                                            subtitle: Text('${member.msisdn}', style: _theme.textTheme.headline3,),
                                            dense: true,),
                                          value: member.msisdn,
                                        );
                                      }).toList(),
                                      onChanged: (value) {
                                        _msisdn = value;
                                        JsonGroupMember? _member = members.firstWhere(
                                              (item) => item.msisdn == _msisdn,
                                        );
                                        _memberName =
                                        '${_member.firstName} ${_member.familyName}';
                                        print(_memberName);
                                      },
                                      validator: (value) {
                                        if (value == null) {
                                          return 'warning.field_required'.tr();
                                        }
                                      },
                                      hint: Text('selection.member'.tr()),
                                      style: TextStyle(
                                          color: colorPrimary,
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal),
                                      icon: Icon(Icons.keyboard_arrow_down),
                                      isExpanded: true,
                                      isDense: true,
                                    )),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Container(
                                    padding: EdgeInsets.all(0.0),
                                    child: DropdownButtonFormField(
                                      value: _value,
                                      selectedItemBuilder: (BuildContext context) {
                                        return _paymentTypes
                                            .map<Widget>((ValueLabel item) {
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
                                        _payment = value;
                                        ValueLabel v=  _paymentTypes.firstWhere((el) => el.value == value );
                                        valPaymentType = v.label.toString();
                                        print(value.toString());
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
                                SizedBox(
                                  height: 20.0,
                                ),
                                Visibility(
                                  visible: widget.groupType==2,
                                  child: Container(
                                    padding: EdgeInsets.all(0.0),
                                    child: DropdownButtonFormField(
                                      value: _value,
                                      selectedItemBuilder: (BuildContext context) {
                                        return _loanTypes.map<Widget>((ValueLabel item) {
                                          return Text('${item.label}', style: _theme.textTheme.headline3,);
                                        }).toList();
                                      },
                                      items: _loanTypes.map((ValueLabel item) {
                                        return DropdownMenuItem<String>(
                                          child: Text('${item.label}', style: _theme.textTheme.headline3,),
                                          value: item.value,
                                        );
                                      }).toList(),
                                      onChanged: (value) {
                                        _loanType = value;
                                        ValueLabel v=  _loanTypes.firstWhere((el) => el.value == value );
                                        valLoanType = v.label.toString();
                                      },
                                      validator: (value) {
                                        if (value == null) {
                                          return 'warning.field_required'.tr();
                                        }
                                      },
                                      hint: Text('selection.loan_type'.tr()),
                                      style: TextStyle(
                                          color: colorPrimary,
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal),
                                      icon: Icon(Icons.keyboard_arrow_down),
                                      isExpanded: true,
                                      isDense: true,
                                    )),),
                                SizedBox(
                                  height: 20.0,
                                ),
                                TextFormField(
                                  controller: amount,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      labelText: 'label.amount'.tr(),
                                      hintText: '1000.0'),

                                  inputFormatters: [
                                    CurrencyTextInputFormatter(
                                      decimalDigits: 0,
                                      locale: 'sw',
                                    )
                                  ],
                                ),
                                SizedBox(height: 20.0,),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: values.map((text) => GestureDetector(
                                      onTap: (){
                                        _selectAmount(text);
                                      },
                                      child: Card(
                                          shape: RoundedRectangleBorder(
                                              side: amount.text == text ?  BorderSide(
                                                color: Colors.black,
                                                width: 2.0,
                                              ): BorderSide(
                                                color: Constants.clr_blue,
                                                width: 1.0,
                                              ),
                                              borderRadius: BorderRadius.circular(4.0)
                                          ),
                                          elevation: 0.8,
                                          child: Padding(
                                            padding: EdgeInsets.all(10.0),
                                            child: Center(
                                              child: Text(
                                                '$text \n TZS',
                                                textAlign: TextAlign.center,
                                                textScaleFactor: 1.2,
                                                style: TextStyle(fontSize: 12.0),
                                              ),
                                            ),
                                          )
                                      ),
                                    )
                                    ).toList()
                                ),
                                SizedBox(
                                  height: 50.0,
                                ),
                                ElevatedButton(
                                  style: Utils.buttonStyle(),
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      SharedPreference sharedPref = SharedPreference.getInstance();
                                      String _mobileNumber = await sharedPref.getStringValuesSF(currentUserEnum.M_SSD_IN.toString());
                                      TransferRequest _transferRequest =
                                      TransferRequest.from(widget.groupId.toString(), _mobileNumber, _msisdn, int.parse(amount.text.toString().replaceAll(new RegExp(r"\D"), "")), _payment,
                                          widget.groupType==2 ? _loanType: 'TRANSFER');
                                      Navigator.of(context).push(MaterialPageRoute(
                                          builder: (context) =>
                                              ScreenCheckAndConfirmTransfer(_transferRequest, _memberName, widget.groupType, loanType: valLoanType,  paymentType: valPaymentType,)));
                                    }
                                  },
                                  child: Text('button.continue'.tr(),
                                      style: TextStyle(color: Colors.white)),
                                ),
                              ]))
                    ],
                  ),
                )));
          }
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Future<String> openContactBook() async {
    final PhoneContact contact = await FlutterContactPicker.pickPhoneContact();
    var phoneNumber = contact.phoneNumber!.number
        .toString()
        .replaceAll(new RegExp(r"\s+"), "");
    return phoneNumber;
  }
}
