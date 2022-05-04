import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile/data/post_api_service.dart';
import 'package:mobile/model/index.dart';
import 'package:mobile/screens/screen_loan_confirm.dart';
import 'package:mobile/utils/colors.dart';
import 'package:mobile/utils/index.dart';
import 'package:mobile/utils/utils.dart';
import 'package:mobile/widgets/widget_not_found.dart';
import 'package:mobile/widgets/widget_something_happened.dart';
import 'package:built_collection/built_collection.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

final _actions = ['title.loan_application', 'title.pay_loan'];

class LoanOperationScreen extends StatefulWidget {
  final int groupId;
  final int action;
  final int groupType;
  final String groupName;
  LoanOperationScreen(this.groupId, this.action, this.groupType, this.groupName);
  @override
  _LoanOperationScreenState createState() => _LoanOperationScreenState();
}

class _LoanOperationScreenState extends State<LoanOperationScreen> {
  var values = {'1000', '2000', '5000', '10000'};
  final amount = TextEditingController();
  var _payment , _loanType,_value, lLoanType, pPaymentType,_msisdn, _otherMemberName;
  final _borderRadius = 10.0;
  bool isSwitched = false;
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
      resizeToAvoidBottomInset: false,
      backgroundColor: scaffoldBackgroundColor,
      appBar: AppBar(

        title: Text(_actions[widget.action].tr()),
        backgroundColor: colorPrimary,
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0.0,
      ),
      body: _body()
    );
  }
  FutureBuilder<Response> _body() {
    return FutureBuilder<Response>(
      future: Provider.of<PostApiService>(context).getTemplate('loanapplication', groupType: widget.groupType.toString()),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final Map map = json.decode(snapshot.data!.bodyString);
          final List<dynamic> _loans = map['loanTypes'];
          final List<dynamic> _payments = map['paymentTypes'];
          List<ValueLabel> _paymentTypes = _payments.map((obj) => ValueLabel.fromJson(obj)).toList();
          List<ValueLabel> _loanTypes = _loans.map((obj) => ValueLabel.fromJson(obj)).toList();

          if (map.isEmpty) {
            return NothingFoundWarning();
          } else if (snapshot.hasError) {
            return SomethingWrongHasHappened();
          } else {
            // final List<ValueLabel> ? roles = json.decode(snapshot.data?.body);
            return  SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Card(
                    shadowColor: Constants.clr_blue,
                    margin: EdgeInsets.all(5.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(_borderRadius)
                    ),
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
                              child: Icon(Icons.ac_unit, color: colorPrimary,),
                            ),
                            title: Text('message.how_much_for_loan_application'.tr(), style: TextStyle(color: Colors.white,),),

                          ),
                        ),
                        Padding(padding: EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [

                              Container(
                                  padding: EdgeInsets.symmetric(vertical: 10.0),
                                  child: DropdownButtonFormField(
                                    value: _value,
                                    selectedItemBuilder: (BuildContext context) {
                                      return _paymentTypes.map<Widget>((ValueLabel item) {
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
                                      pPaymentType = _paymentTypes.firstWhere((element) => element.value == value).label;
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

                              Container(
                                  padding: EdgeInsets.symmetric(vertical: 10.0, ),
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
                                      lLoanType = _loanTypes.firstWhere((element) => element.value == value).label;
                                    },
                                    validator: (value) {
                                      if (value == null) {
                                        return 'warning.field_required'.tr();
                                      }
                                    },
                                    hint: Text('selection.loan_type'.tr()),
                                    style: TextStyle(color: colorPrimary, fontSize: 16, fontWeight: FontWeight.normal),
                                    icon: Icon(Icons.keyboard_arrow_down),
                                    isExpanded: true,
                                    isDense: true,
                                  )),
                              SizedBox(
                                height: 10.0,
                              ),
                              TextFormField(
                                controller: amount,
                                decoration: InputDecoration( suffixText: 'TZS', hintText: 'Loan amount'),
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value == null) {
                                    return 'warning.field_required'.tr();
                                  }
                                },
                                inputFormatters: [
                                  CurrencyTextInputFormatter(
                                    decimalDigits: 0,
                                    locale: 'sw',
                                  )
                                ],
                              ),
                              SizedBox(height: 15.0,),
                              Visibility(
                                visible: isSwitched,
                                child: Text('title.other_member'.tr(),style: TextStyle(fontWeight: FontWeight.bold),),),

                              Visibility(
                                visible: isSwitched,
                                child: _memberList(context, widget.groupId),),
                              SizedBox(
                                height: 15.0,
                              ),
                              ListTile(title: Text(isSwitched? 'button.for_oneself'.tr() : 'button.for_other'.tr()),
                                trailing: Switch(
                                  value: isSwitched,
                                  onChanged: (value) {
                                    setState(() {
                                      isSwitched = value;
                                    });
                                  },
                                  activeTrackColor: Colors.yellow,
                                  activeColor: Colors.orangeAccent,
                                ),),
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
                                              color: Colors.grey,
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

                              SizedBox(height: 30.0,),
                              Center(child:    Padding(
                                padding: EdgeInsets.all(10.0),
                                child:  ElevatedButton(
                                  style: Utils.buttonStyle(),
                                  onPressed:  () async{
                                    SharedPreference sp = SharedPreference.getInstance();
                                    if(_formKey.currentState!.validate()) {
                                      var _spMsisdn = await sp.getStringValuesSF(currentUserEnum.M_SSD_IN.toString());
                                      String msisdn = isSwitched ? _msisdn :  _spMsisdn;
                                      String _forOther = isSwitched ? "1":"0";
                                      LoanPayload _loanPayload = LoanPayload.from(widget.groupId.toString(),  msisdn, int.parse(amount.text.toString().replaceAll(new RegExp(r"\D"), "")), _payment, _loanType, forOthers: _forOther);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => new ScreenLoanApplicationConfirm(_loanPayload, loanType: lLoanType, paymentType: pPaymentType,groupName: widget.groupName,otherMemberName: isSwitched ? _otherMemberName: null,)));
                                    }
                                  },
                                  child: Text('button.check_and_confirm'.tr(), style: TextStyle(color: Colors.white)),
                                ),
                              ),)

                            ],
                          ),)

                      ],
                    ),
                  ),
                )
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
  FutureBuilder<Response<BuiltList<GroupMember>>> _memberList(BuildContext context, int groupId) {
    return FutureBuilder<Response<BuiltList<GroupMember>>>(
      future:
      Provider.of<PostApiService>(context).getGroupMembers(groupId.toString()),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {

          final BuiltList<GroupMember>?  members = snapshot.data!.body;
          return Container(
              padding: EdgeInsets.all(0.0),
              child: DropdownButtonFormField(
                value: _value,
                selectedItemBuilder: (BuildContext context) {
                  return members!.map<Widget>((GroupMember member) {
                    return  Text('${member.firstName} ${member.familyName}');
                  }).toList();
                },
                items: members?.map((GroupMember member) {
                  return DropdownMenuItem<String>(
                    child:  ListTile(title:Text('${member.firstName} ${member.familyName}'),
                      subtitle: Text('${member.msisdn}'),
                      dense: true,),
                    value: member.msisdn,
                  );
                }).toList(),
                onChanged: (value) {
                  _msisdn = value;
                  GroupMember? member = members?.firstWhere((el) => el.msisdn == value );

                  _otherMemberName = '${member?.firstName}'+' ${member?.familyName}';
                  print(_otherMemberName);
                },
                validator: (value) {
                  if (value == null) {
                    return  'warning.field_required'.tr();
                  }
                },
                hint: Text('selection.member'.tr()),
                style: TextStyle(color: colorPrimary, fontSize: 16, fontWeight: FontWeight.normal),
                icon: Icon(Icons.keyboard_arrow_down),
                isExpanded: true,
                isDense: true,
              ));
        } else if (snapshot.hasError) {
          return SomethingWrongHasHappened();
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }


}