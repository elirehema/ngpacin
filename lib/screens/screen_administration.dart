import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/data/post_api_service.dart';
import 'package:mobile/model/index.dart';
import 'package:mobile/utils/Constants.dart';
import 'package:mobile/utils/colors.dart';
import 'package:mobile/utils/utils.dart';
import 'package:mobile/widgets/widget_not_found.dart';
import 'package:mobile/widgets/widget_something_happened.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:provider/provider.dart';
import 'package:built_collection/built_collection.dart';
import 'package:easy_localization/easy_localization.dart';


class AdministrationScreen extends StatefulWidget {
  final int groupId;
  final int action;
  final String title;
  final String code;
  var memberNumber, groupType;

  AdministrationScreen(this.groupId, this.action, this.title, this.code,{this.memberNumber, this.groupType});

  @override
  _AdministrationScreenState createState() => _AdministrationScreenState();
}

class _AdministrationScreenState extends State<AdministrationScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isSwitched = false;
  bool _showApprovers = false;
  var  _value, _loanId,_leaderRole,_paymentType,_loanType,_memberNumber, _approvalMode;
  final ValueNotifier<int> _valueNotifier = ValueNotifier<int>(0);
  late ThemeData _theme;



  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
        backgroundColor: _theme.scaffoldBackgroundColor,
        appBar: AppBar(
          title: Text(widget.title.tr(), style: _theme.textTheme.headline3,),
          backgroundColor: _theme.appBarTheme.backgroundColor,
          elevation: 0.0,
          leading: Utils.backArrow(),
          titleSpacing: 0,
        ),
        body: Container(
          padding: EdgeInsets.all(0.0),
        child: _buildChild(widget.action),));
  }


  FutureBuilder<Response<GroupSettings>> _futureBody(BuildContext context) {
    return FutureBuilder<Response<GroupSettings>>(
      future: Provider.of<PostApiService>(context).getGroupSettings(widget.groupId.toString()),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
          GroupSettings? settings = snapshot.data!.body;
          return  _buildChild(widget.action);
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

  Widget _buildChild(int? action) {
    if (action == 0) {
      return _sharePriceWidget();
    }
    if (action == 1) {
      return _loanInterestWidget();
    }
    if (action == 2) {
      return _loanGuaranteeModeWidget();
    }
    if (action == 3) {
      return _setLoanFactorWidget();
    }
    if (action == 4) {
      return _setGroupApprovalModeWidget();
    }
    if (action == 5) {
      return _setGroupGuardian();
    }
    if (action == 6) {
      return _setGroupName();
    }
    if (action == 7) {
      return _setMemberBankAccount();
    }
    if (action == 8) {
      return _changeGroupLeaderWidget();
    }
    if (action == 9) {
      return _setGroupGuarantorWidget();
    }
    if (action == 10) {
      return _removeMemberFromGroupWidget();
    }
    if (action == 11) {
      return _setPenaltyWidget();
    }
    if (action == 12) {
      return _payLoanForOthersWidget();
    }
    return Center(
      child: Text('warning.unknown_operation'.tr()),
    );
  }

  Widget _sharePriceWidget() {
    final _price = TextEditingController();
    return Form(
    key: _formKey,
        child:Card(
        margin: EdgeInsets.all(10.0),
        shadowColor: _theme.cardTheme.shadowColor,
        shape: _theme.cardTheme.shape,
        child:  Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Text('Group name'),
              SizedBox(
                height: 8.0,
              ),
              Text('message.how_much_for_share'.tr(args: ['']), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),),
              SizedBox(height: 20.0,),

              Text('title.share_prices'.tr(),style: TextStyle(fontWeight: FontWeight.bold),),

              SizedBox(
                height: 15.0,
              ),
              TextFormField(
                controller: _price,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'input.share_amount'.tr()),
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'warning.amount_null'.tr();
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
              Spacer(),
              ElevatedButton(
                style: Utils.buttonStyle(),
                onPressed: () async {
                  if(_formKey.currentState!.validate()) {
                    Administration _administration = Administration
                        .sharePrice(widget.groupId.toString(), int.parse(_price.text.toString().replaceAll(new RegExp(r"\D"), "")));
                    _submitAdministrationAction(context, _administration, 'shareprice');
                  }
                },
                child:
                Text('button.submit'.tr(), style: TextStyle(color: Colors.white)),
              ),

            ],
          ),
        ),));
  }
  FutureBuilder<Response>  _loanInterestWidget() {
    final _price = TextEditingController();
   String _interest ='';
   var _value;
    return FutureBuilder<Response>(
      future: Provider.of<PostApiService>(context).getTemplate('loaninteresttypes'),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final List<dynamic> _list = json.decode(snapshot.data!.bodyString) ;
          List<ValueLabel> _loanInterestTypes = _list.map((obj) => ValueLabel.fromJson(obj)).toList();

          if (_loanInterestTypes.isEmpty) {
            return NothingFoundWarning();
          } else if (snapshot.hasError) {
            return SomethingWrongHasHappened();
          } else {
            // final List<ValueLabel> ? roles = json.decode(snapshot.data?.body);
            return Form(
                key: _formKey,
                child:Card(
                  margin: EdgeInsets.all(10.0),
                  shadowColor: Constants.clr_blue,
                  shape: Utils.cardShapeRound(),
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //Text('Group name'),
                        SizedBox(
                          height: 8.0,
                        ),
                        Text('message.how_much_for_loan_interest'.tr(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),),
                        SizedBox(height: 20.0,),

                        Text('title.interest'.tr(),style: TextStyle(fontWeight: FontWeight.bold),),

                        SizedBox(
                          height: 15.0,
                        ),
                        TextFormField(
                          controller: _price,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(labelText: "Enter interest "),
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'warning.null_interest'.tr();
                            }
                            return null;
                          },
                        ),


                        Container(
                            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 0.0),
                            child: DropdownButtonFormField(
                              value: _value,
                              selectedItemBuilder: (BuildContext context) {
                                return _loanInterestTypes.map<Widget>((ValueLabel item) {
                                  return Text('${item.label}', style: _theme.textTheme.headline3,);
                                }).toList();
                              },
                              items: _loanInterestTypes.map((ValueLabel item) {
                                return DropdownMenuItem<String>(
                                  child: Text('${item.label}', style: _theme.textTheme.headline3,),
                                  value: item.value,
                                );
                              }).toList(),
                              onChanged: (value) {
                                _interest = value.toString();
                              },
                              validator: (value) {
                                if (value == null) {
                                  return 'warning.field_required'.tr();
                                }
                              },
                              hint: Text('selection.select_interest'.tr()),
                              style: TextStyle(color: colorPrimary, fontSize: 16, fontWeight: FontWeight.normal),
                              icon: Icon(Icons.keyboard_arrow_down),
                              isExpanded: true,
                              isDense: true,
                            )),
                        Spacer(),
                        ElevatedButton(
                          style:  Utils.buttonStyle(),
                          onPressed: () async {
                            if(_formKey.currentState!.validate()) {
                              Administration _administration = Administration.loanInterest(widget.groupId.toString(), int.parse(_price.text),_interest);
                              _submitAdministrationAction(context, _administration, 'loaninterest');
                            }
                          },
                          child:
                          Text('button.submit'.tr(), style: TextStyle(color: Colors.white)),
                        ),

                      ],
                    ),
                  ),
                ));
          }
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
  Widget _loanGuaranteeModeWidget() {

    return Card(
      margin: EdgeInsets.all(10.0),
      shadowColor: _theme.cardTheme.shadowColor,
      shape: _theme.cardTheme.shape,
      child:Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Text('Group name'),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(isSwitched ? 'title.activate_guarantee_mode'.tr(): 'title.de_activate_guarantee_mode'.tr(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),),
                    SizedBox(height: 20.0,),

                    //Text(isSwitched ? 'title.activate_guarantee_mode'.tr(): 'title.de_activate_guarantee_mode'.tr(),style: TextStyle(fontWeight: FontWeight.bold),),

                    SizedBox(
                      height: 15.0,
                    ),
                    Switch(
                      value: isSwitched,
                      onChanged: (value) {
                        setState(() {
                          isSwitched = value;
                        });
                      },
                      activeTrackColor: Colors.yellow,
                      activeColor: Colors.orangeAccent,
                    ),
                    Spacer(),
                    ElevatedButton(
                      style: Utils.buttonStyle(),
                      onPressed: () async {
                        Administration _administration = Administration.setLoanGuaranteeMode(widget.groupId.toString(), isSwitched.toString().toUpperCase());
                        _submitAdministrationAction(context, _administration, 'loanguaranteemode');

                      },
                      child:
                      Text('button.submit'.tr(), style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ),
            );
  }
  Widget _setLoanFactorWidget() {
    final _price = TextEditingController();
    return Form(
        key: _formKey,
        child:Card(
            margin: EdgeInsets.all(10.0),
            shadowColor: Constants.clr_blue,
            shape: Utils.cardShapeRound(),
            child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Text('Group name'),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text('title.set_loan_factor'.tr(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),),
                    SizedBox(height: 20.0,),

                    Text('title.loan_factor'.tr(),style: TextStyle(fontWeight: FontWeight.bold),),

                    SizedBox(
                      height: 15.0,
                    ),
                    TextFormField(
                      controller: _price,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: 'title.enter_loan_factor'.tr()),
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'warning.null_loan_factor'.tr();
                        }
                        return null;
                      },
                    ),
                    Spacer(),
                    ElevatedButton(
                      style: Utils.buttonStyle(),
                      onPressed: () async {
                        if(_formKey.currentState!.validate()) {
                      Administration _administration = Administration.loanFactor(widget.groupId.toString(), _price.text.toString());
                      _submitAdministrationAction(context, _administration, 'loanfactor');
                    }
                  },
                  child:
                  Text('button.submit'.tr(), style: TextStyle(color: Colors.white)),
                ),

                  ],
                ),

            )));
  }
  FutureBuilder<Response> _setGroupApprovalModeWidget() {
    final _price = TextEditingController();
   var _value;
    return FutureBuilder<Response>(
      future: Provider.of<PostApiService>(context).getTemplate('approvalmodes'),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final List<dynamic> _list = json.decode(snapshot.data!.bodyString) ;
          List<ValueLabel> _approvalModes = _list.map((obj) => ValueLabel.fromJson(obj)).toList();

          if (_approvalModes.isEmpty) {
            return NothingFoundWarning();
          } else if (snapshot.hasError) {
            return SomethingWrongHasHappened();
          } else {
            // final List<ValueLabel> ? roles = json.decode(snapshot.data?.body);
            return Form(
                key: _formKey,
                child:Card(
                  margin: EdgeInsets.all(10.0),
                  shadowColor: Constants.clr_blue,
                  shape: Utils.cardShapeRound(),
                  child:  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //Text('Group name'),
                        SizedBox(
                          height: 8.0,
                        ),
                        Text('title.set_approval_mode'.tr(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),),
                        SizedBox(height: 20.0,),

                        SizedBox(
                          height: 30.0,
                        ),
                        Text('title.approval_mode'.tr(),style: TextStyle(fontWeight: FontWeight.bold),),

                        Container(
                            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 5.0),
                            child: DropdownButtonFormField(
                              value: _value,
                              selectedItemBuilder: (BuildContext context) {
                                return _approvalModes.map<Widget>((ValueLabel item) {
                                  return Text('${item.label}', style: _theme.textTheme.headline3,);
                                }).toList();
                              },
                              items: _approvalModes.map((ValueLabel item) {
                                return DropdownMenuItem<String>(
                                  child: Text('${item.label}', style: _theme.textTheme.headline3,),
                                  value: item.value,
                                );
                              }).toList(),
                              onChanged: (value) {
                                   _approvalMode = value.toString();
                                   bool showApproves = value.toString() != 'LEADERS';
                                   print(showApproves);
                                   print(_approvalMode);
                                   _showApprovers = showApproves;
                                   _valueNotifier.value = int.parse(value.toString().length.toString());
                              },
                              validator: (value) {
                                if (value == null) {
                                  return 'warning.field_required'.tr();
                                }
                              },
                              hint: Text('title.approval_mode'.tr()),
                              style: TextStyle(color: colorPrimary, fontSize: 16, fontWeight: FontWeight.normal),
                              icon: Icon(Icons.keyboard_arrow_down),
                              isExpanded: true,
                              isDense: true,
                            )),

                        Visibility(
                          visible: _showApprovers,
                          child: Text('title.member_approver'.tr(),style: TextStyle(fontWeight: FontWeight.bold),),),

                        SizedBox(
                          height: 15.0,
                        ),
                        ValueListenableBuilder(valueListenable: _valueNotifier, builder: (context, value, child) {
                        return Visibility(
                            visible: _showApprovers,
                            child:  TextFormField(
                              controller: _price,
                              autofocus: false,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(labelText: 'input.member_approver'.tr()),
                              validator: (text) {
                                if (text == null || text.isEmpty) {
                                  return 'title.null_loan_factor'.tr();
                                }
                                return null;
                              },
                            ));}),

                        Spacer(),
                        ElevatedButton(
                          style: Utils.buttonStyle(),
                          onPressed: () async {
                            if(_formKey.currentState!.validate()) {
                              print(_approvalMode.toString() );
                              Administration _administration = Administration.setApprovalMode(widget.groupId.toString(), _approvalMode.toString(), _price.text.toString());
                              _submitAdministrationAction(context, _administration, 'approvalmode');
                            }
                          },
                          child:
                          Text('button.submit'.tr(), style: TextStyle(color: Colors.white)),
                        ),

                      ],
                    ),
                  ),
                ));
          }
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
  Widget _setGroupGuardian() {
    final _price = TextEditingController();
    return Form(
        key: _formKey,
        child:Card(
            margin: EdgeInsets.all(10.0),
            shadowColor: Constants.clr_blue,
            shape: Utils.cardShapeRound(),
            child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Text('Group name'),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text('title.guardian'.tr(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),),
                    SizedBox(height: 20.0,),

                    Text('title.guardian_code'.tr(),style: TextStyle(fontWeight: FontWeight.bold),),

                    SizedBox(
                      height: 15.0,
                    ),
                    TextFormField(
                      controller: _price,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: 'input.guardian_code'.tr()),
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'warning.null_guardian_code'.tr();
                        }
                        return null;
                      },
                    ),
                    Spacer(),
                    ElevatedButton(
                      style: Utils.buttonStyle(),
                      onPressed: () async {
                        if(_formKey.currentState!.validate()) {
                          Administration _administration = Administration.setGuardianCode(widget.groupId.toString(), _price.text);
                          _submitAdministrationAction(context, _administration, 'guardian');
                        }
                      },
                      child:
                      Text('button.submit'.tr(), style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),

            )));
  }
  Widget _setGroupName() {
    final _price = TextEditingController();
    return Form(
        key: _formKey,
        child:Card(
            margin: EdgeInsets.all(10.0),
            shadowColor: Constants.clr_blue,
            shape: Utils.cardShapeRound(),
            child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Text('Group name'),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text('title.update_group_name'.tr(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),),
                    SizedBox(height: 20.0,),

                    Text('title.group_name'.tr(),style: TextStyle(fontWeight: FontWeight.bold),),

                    SizedBox(
                      height: 15.0,
                    ),
                    TextFormField(
                      controller: _price,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(labelText: 'input.group_name'.tr()),
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'warning.null_group_name'.tr();
                        }
                        return null;
                      },
                    ),
                    Spacer(),
                    ElevatedButton(
                      style: Utils.buttonStyle(),
                      onPressed: () async {
                        if(_formKey.currentState!.validate()) {
                          Administration _administration = Administration.setGroupName(widget.groupId.toString(), _price.text);
                          _submitAdministrationAction(context, _administration, 'groupname');
                        }
                      },
                      child:
                      Text('button.submit'.tr(), style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
            )));
  }
  FutureBuilder<Response>  _setMemberBankAccount() {
    final _account =TextEditingController();
   String _bankname = '';
   var _value;
    return FutureBuilder<Response>(
      future: Provider.of<PostApiService>(context).getTemplate('banknames'),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final List<dynamic> _list = json.decode(snapshot.data!.bodyString) ;
          List<ValueLabel> _bankNames = _list.map((obj) => ValueLabel.fromJson(obj)).toList();
          if (_bankNames.isEmpty) {
            return NothingFoundWarning();
          } else if (snapshot.hasError) {
            return SomethingWrongHasHappened();
          } else {
            // final List<ValueLabel> ? roles = json.decode(snapshot.data?.body);
            return Form(
                key: _formKey,
                child:Card(
                  margin: EdgeInsets.all(10.0),
                  shadowColor: Constants.clr_blue,
                  shape: Utils.cardShapeRound(),
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //Text('Group name'),
                        SizedBox(
                          height: 8.0,
                        ),
                        Text('title.member_bank_account'.tr(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),),
                        SizedBox(height: 20.0,),

                        Text('title.bank_name'.tr(),style: TextStyle(fontWeight: FontWeight.bold),),

                        Container(
                            padding: EdgeInsets.all(10.0),
                            child: DropdownButtonFormField(
                              value: _value,
                              selectedItemBuilder: (BuildContext context) {
                                return _bankNames.map<Widget>((ValueLabel item) {
                                  return Text('${item.label}', style: _theme.textTheme.headline3,);
                                }).toList();
                              },
                              items: _bankNames.map((ValueLabel item) {
                                return DropdownMenuItem<String>(
                                  child: Text('${item.label}', style: _theme.textTheme.headline3,),
                                  value: item.value,
                                );
                              }).toList(),
                              onChanged: (value) {
                                _bankname = value.toString();
                              },
                              validator: (value) {
                                if (value == null ) {
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
                          height: 15.0,
                        ),
                        Text('title.bank_acc_no'.tr(),style: TextStyle(fontWeight: FontWeight.bold),),

                        SizedBox(
                          height: 15.0,
                        ),
                        TextFormField(
                          controller: _account,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(labelText: 'input.bank_acc_no'.tr()),
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'warning.null_bank_acc'.tr();
                            }
                            return null;
                          },
                        ),
                        Spacer(),
                        ElevatedButton(
                          style: Utils.buttonStyle(),
                          onPressed: () async {
                            if(_formKey.currentState!.validate()) {
                              showDialog<void>(
                                context: context,
                                barrierColor: Colors.black54,
                                barrierLabel: 'Barrier',
                                barrierDismissible:  true, // user must tap button!
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    titlePadding: EdgeInsets.zero,
                                    title: Container(
                                      color: colorPrimary,
                                      child: Padding(padding: EdgeInsets.symmetric(vertical: 20.0),
                                        child: Center(child:  Text('title.check_and_confirm'.tr(), style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),),),
                                    ),
                                    content: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          ListTile(
                                            title:Text('title.bank_name'.tr()),
                                            subtitle: Text(_bankname),),
                                          ListTile(
                                            title: Text('title.bank_acc_no'.tr()),
                                            subtitle: Text(_account.text.toString().toUpperCase()),
                                          ),
                                        ],
                                      ),
                                    ),
                                    actions: <Widget>[
                                      ElevatedButton(
                                        style: Utils.buttonStyle(),
                                        child: Text('button.submit'.tr()),
                                        onPressed: () {
                                          Administration _administration = Administration.setBankAccount(widget.groupId.toString(), _bankname, _account.text);
                                          _submitAdministrationAction(context, _administration, 'banaccount');
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );

                            }
                          },
                          child:
                          Text('button.check_and_confirm'.tr(), style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                  ),
                ));
          }
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );

  }
  FutureBuilder<Response>  _changeGroupLeaderWidget() {
    final _number = TextEditingController();
    String _leaderRole = '';
    var _value;
    _number.text = widget.memberNumber;
      return FutureBuilder<Response>(
          future: Provider.of<PostApiService>(context).getTemplate('roletypes'),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              final List<dynamic> _list = json.decode(snapshot.data!.bodyString) ;
              List<ValueLabel> roles = _list.map((obj) => ValueLabel.fromJson(obj)).toList();
              print("Selected Roles");
              print(roles[0].value);
              if (roles.isEmpty) {
                return NothingFoundWarning();
              } else if (snapshot.hasError) {
                return SomethingWrongHasHappened();
              } else {
               // final List<ValueLabel> ? roles = json.decode(snapshot.data?.body);
                return Form(
                    key: _formKey,
                    child:Card(
                        margin: EdgeInsets.all(10.0),
                        shadowColor: Constants.clr_blue,
                        shape: Utils.cardShapeRound(),
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //Text('Group name'),
                              SizedBox(
                                height: 8.0,
                              ),
                              Text('title.change_group_leader'.tr(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),),
                              SizedBox(height: 20.0,),

                              Text('title.leader_no'.tr(),style: TextStyle(fontWeight: FontWeight.bold),),

                              SizedBox(
                                height: 15.0,
                              ),
                              TextFormField(
                                controller: _number,
                                readOnly: true,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(labelText: 'input.group_leader_no'.tr()),
                                validator: (text) {
                                  if (text == null || text.isEmpty) {
                                    return 'warning.null_group_leader'.tr();
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: 40.0,
                              ),
                              Text('title.leader_role'.tr(),style: TextStyle(fontWeight: FontWeight.bold),),
                              Container(
                                  padding: EdgeInsets.only(top: 10.0),
                                  child: DropdownButtonFormField(
                                    value: _value,
                                    selectedItemBuilder: (BuildContext context) {
                                      return roles.map<Widget>((ValueLabel role) {
                                        return Text('${role.label}');
                                      }).toList();
                                    },
                                    items: roles.map((ValueLabel role) {
                                      return DropdownMenuItem<String>(
                                        child: Text('${role.label}'),
                                        value: role.value,
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      _leaderRole = value.toString();
                                    },
                                    validator: (value) {
                                      if (value == null) {
                                        return 'warning.field_required'.tr();
                                      }
                                    },
                                    hint: Text('selection.leader_role'.tr()),
                                    style: TextStyle(color: colorPrimary, fontSize: 16, fontWeight: FontWeight.normal),
                                    icon: Icon(Icons.keyboard_arrow_down),
                                    isExpanded: true,
                                    isDense: true,
                                  )),

                              Spacer(),
                              ElevatedButton(
                                style: Utils.buttonStyle(),
                                onPressed: () async {
                                  if(_formKey.currentState!.validate()) {
                                    Administration _administration = Administration.changeGroupLeader(widget.groupId.toString(), _leaderRole, '0',_number.text.toString());
                                    _submitAdministrationAction(context, _administration, 'changeleader');
                                  }
                                },
                                child:
                                Text('button.submit'.tr(), style: TextStyle(color: Colors.white)),
                              ),

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
  Widget _setGroupGuarantorWidget() {
    final _price = TextEditingController();

    return Form(
        key: _formKey,
        child:Card(
            margin: EdgeInsets.all(10.0),
            shadowColor: Constants.clr_blue,
            shape: Utils.cardShapeRound(),
            child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Text('Group name'),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text('title.change_group_guarantor'.tr(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),),
                    SizedBox(height: 20.0,),

                    Text('title.guarantor_number'.tr(),style: TextStyle(fontWeight: FontWeight.bold),),

                    SizedBox(
                      height: 15.0,
                    ),
                    TextFormField(
                      controller: _price,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: 'input.guarantor_number'.tr()),
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'warning.null_guarantor'.tr();
                        }
                        return null;
                      },
                    ),
                    Spacer(),
                    ElevatedButton(
                      style: Utils.buttonStyle(),
                      onPressed: () async {
                        if(_formKey.currentState!.validate()) {
                          Administration _administration = Administration.setGroupGuarantor(widget.groupId.toString(), _price.text.toString());
                          _submitAdministrationAction(context, _administration, 'guarantor');
                        }
                      },
                      child:
                      Text('button.submit'.tr(), style: TextStyle(color: Colors.white)),
                    ),


                  ],
                ),
            )));
  }
  Widget _removeMemberFromGroupWidget() {
    final _number = TextEditingController();
    _number.text = widget.memberNumber;

    return Form(
        key: _formKey,
        child:Card(
            margin: EdgeInsets.all(10.0),
            shadowColor: Constants.clr_blue,
            shape: Utils.cardShapeRound(),
            child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Text('Group name'),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text('title.remove_member'.tr(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),),
                    SizedBox(height: 20.0,),

                    Text('title.member_number'.tr(),style: TextStyle(fontWeight: FontWeight.bold),),

                    SizedBox(
                      height: 15.0,
                    ),
                    TextFormField(
                      controller: _number,
                      readOnly: true,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: 'input.member_number'.tr()),
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'warning.null_member_number'.tr();
                        }
                        return null;
                      },
                    ),
                    Spacer(),
                    ElevatedButton(
                      style: Utils.buttonStyle(),
                      onPressed: () async {
                        if(_formKey.currentState!.validate()) {
                          Administration _administration = Administration.removeMember(widget.groupId.toString(), _number.text.toString());
                          _submitAdministrationAction(context, _administration, 'removeMember');
                        }
                      },
                      child:
                      Text('button.remove_member'.tr(), style: TextStyle(color: Colors.white)),
                    ),


                  ],
                ),

            )));
  }
  Widget _setPenaltyWidget() {
    final _price = TextEditingController();
    final _number = TextEditingController();
    _number.text = widget.memberNumber;

    return Form(
        key: _formKey,
        child:Card(
            margin: EdgeInsets.all(10.0),
            shadowColor: Constants.clr_blue,
            shape: Utils.cardShapeRound(),
            child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Text('Group name'),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text('title.add_penalty_member'.tr(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),),
                    SizedBox(height: 20.0,),

                    Text('title.member_number'.tr(),style: TextStyle(fontWeight: FontWeight.bold),),

                    SizedBox(
                      height: 15.0,
                    ),
                    TextFormField(
                      controller: _number,
                      keyboardType: TextInputType.number,
                      readOnly: true,
                      style: TextStyle(fontWeight: FontWeight.bold),
                      decoration: InputDecoration(labelText: 'input.member_number.'.tr()),
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'warning.null_member_number'.tr();
                        }
                        return null;
                      },
                    ),

                    SizedBox(
                      height: 10.0,
                    ),
                    Text('label.amount'.tr(),style: TextStyle(fontWeight: FontWeight.bold),),

                    SizedBox(
                      height: 5.0,
                    ),
                    TextFormField(
                      controller: _price,
                      keyboardType: TextInputType.number,
                      autofocus: true,
                      decoration: InputDecoration(labelText: 'input.enter_amount'.tr()),
                      inputFormatters: [
                        CurrencyTextInputFormatter(
                          decimalDigits: 0,
                          locale: 'sw',
                        )
                      ],
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'warning.null_amount'.tr();
                        }
                        return null;
                      },
                    ),
                    Spacer(),
                    ElevatedButton(
                      style: Utils.buttonStyle(),
                      onPressed: () async {
                        if(_formKey.currentState!.validate()) {
                          Administration _administration = Administration.setPenalty(widget.groupId.toString(),int.parse(_price.text.toString().replaceAll(new RegExp(r"\D"), "")), _number.text);
                          _submitAdministrationAction(context, _administration, 'setpenalty');
                        }
                      },
                      child:
                      Text('button.set_penalty'.tr(), style: TextStyle(color: Colors.white)),
                    ),


                  ],
                ),
              ),));
  }
  FutureBuilder<Response> _payLoanForOthersWidget() {
    final _amount = TextEditingController();
    FutureBuilder<Response<BuiltList<LoanResponse>>> _memberLoanList(BuildContext context, int groupId, String _msisdn) {
      return FutureBuilder<Response<BuiltList<LoanResponse>>>(
        future:
        Provider.of<PostApiService>(context).getLoanById(groupId: widget.groupId.toString(), forOthers: '1', bParty: _msisdn),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {

            final BuiltList<LoanResponse>?  loans = snapshot.data!.body;
            return Container(
                padding: EdgeInsets.all(10.0),
                child: DropdownButtonFormField(
                  value: _value,
                  selectedItemBuilder: (BuildContext context) {
                    return loans!.map<Widget>((LoanResponse loan) {
                      return  Text('${loan.loanType} ${loan.loanBalance}');
                    }).toList();
                  },
                  items: loans?.map((LoanResponse loan) {
                    return DropdownMenuItem<String>(
                      child: ListTile(
                        title: Text('${loan.loanType} ',style: TextStyle(fontWeight: FontWeight.w400),),
                        trailing: Text('Balance: ${loan.loanBalance}'),
                      ),
                      value: loan.loanId.toString(),
                    );
                  }).toList(),
                  onChanged: (value) async{
                    _memberNumber = value;
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'warning.field_required'.tr();
                    }
                  },
                  hint: Text( loans!.length > 0 ? 'title.loan_to_pay'.tr(): 'selection.no_loan'.tr()),
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
      return FutureBuilder<Response>(
        future: Provider.of<PostApiService>(context)
            .getTemplate('payloanforother', groupId: widget.groupId.toString()),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final Map map = json.decode(snapshot.data!.bodyString);

            final List<dynamic> _payments = map['paymentTypes'];
            final List<dynamic> _members = map['members'];
            List<JsonGroupMember> members = _members.map((obj) => JsonGroupMember.fromJson(obj)).toList();
            List<ValueLabel> _paymentTypes = _payments.map((obj) => ValueLabel.fromJson(obj)).toList();
           

            if (map.isEmpty) {
              return NothingFoundWarning();
            } else if (snapshot.hasError) {
              return SomethingWrongHasHappened();
            } else {
              return Form(
                  key: _formKey,
                  child:Card(
                    margin: EdgeInsets.all(10.0),
                    shadowColor: Constants.clr_blue,
                    shape: Utils.cardShapeRound(),
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //Text('Group name'),
                          SizedBox(
                            height: 8.0,
                          ),
                          Text('title.pay_loan_for_other'.tr(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),),
                          Container(
                          padding: EdgeInsets.all(10.0),
                          child: DropdownButtonFormField(
                            value: _value,
                            selectedItemBuilder: (BuildContext context) {
                              return members.map<Widget>((JsonGroupMember member) {
                                return  Text('${member.firstName} ${member.familyName}');
                              }).toList();
                            },
                            items: members.map((JsonGroupMember member) {
                              return DropdownMenuItem<String>(
                                child:  ListTile(title:Text('${member.firstName} ${member.familyName}'),
                                  subtitle: Text('${member.msisdn}'),
                                  dense: true,),
                                value: member.msisdn,
                              );
                            }).toList(),
                            onChanged: (value) async{
                              widget.memberNumber = value;
                              _valueNotifier.value = int.parse(value.toString());
                              _memberNumber = value;

                            },
                            validator: (value) {
                              if (value == null) {
                                return 'warning.field_required'.tr();
                              }
                            },
                            hint: Text('selection.member'.tr()),
                            style: TextStyle(color: colorPrimary, fontSize: 16, fontWeight: FontWeight.normal),
                            icon: Icon(Icons.keyboard_arrow_down),
                            isExpanded: true,
                            isDense: true,
                          )),

                          ValueListenableBuilder(valueListenable: _valueNotifier, builder: (context, value, child) {
                            return _memberLoanList(context, widget.groupId, value.toString());
                          },),

                          Container(
                              padding: EdgeInsets.all(10.0),
                              child: DropdownButtonFormField(
                                value: _value,
                                selectedItemBuilder: (BuildContext context) {
                                  return _paymentTypes.map<Widget>((ValueLabel item) {
                                    return  Text('${item.label}', style: _theme.textTheme.headline3,);
                                  }).toList();
                                },
                                items: _paymentTypes.map((ValueLabel item) {
                                  return DropdownMenuItem<String>(
                                    child: Text('${item.label}', style: _theme.textTheme.headline3,),
                                    value: item.value,
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  _paymentType = value;
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
                            height: 15.0,
                          ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.0),
                          child: TextFormField(
                          controller: _amount,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(labelText: 'input.enter_amount'.tr()),
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'warning.null_amount'.tr();
                            }
                            return null;
                          },
                        ),),
                          Spacer(),
                          ElevatedButton(
                            style: Utils.buttonStyle(),
                            onPressed: () async {
                              if(_formKey.currentState!.validate()) {
                                LoanPayload payload = LoanPayload.withId(widget.groupId.toString(), _memberNumber.toString(), int.parse(_amount.text.toString()), _paymentType, null,_loanId.toString(), '1' );
                                ProgressDialog pr = new ProgressDialog(context,isDismissible:false);
                                pr.update(
                                  progress: 50.0,
                                  message: 'dialog.progress_wait'.tr(),

                                  progressWidget: Container(padding: EdgeInsets.all(8.0), child: CircularProgressIndicator()),
                                  maxProgress: 100.0,
                                  progressTextStyle: TextStyle(color: Constants.clr_blue, fontSize: 13.0, fontWeight: FontWeight.w400),
                                  messageTextStyle: TextStyle(color: Constants.clr_blue, fontSize: 19.0, fontWeight: FontWeight.w600),
                                );
                                pr.show();

                                var response = await Provider.of<PostApiService>(context,listen: false).payLoan(payload);

                                Changes? changes = response.body;
                                //String httpClientResponse = response;
                                final int statusCode = response.statusCode;
                                if (statusCode == 200) {
                                  pr.hide();
                                  showDialog(
                                      context: context,
                                      builder: (_) => new CupertinoAlertDialog(
                                        title: new Text('dialog.msg.notification'.tr()),
                                        content: new Text('${changes!.description}'),
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
                            },
                            child:
                            Text('button.pay_loan'.tr(), style: TextStyle(color: Colors.white)),
                          ),


                        ],
                      ),
                    ),));
            }
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      );
    }


  }


Future<void> _submitAdministrationAction(BuildContext context,Administration body, String endpoint) async {
  ProgressDialog pr = new ProgressDialog(context,isDismissible:true);
  pr.update(
    progress: 50.0,
    message: 'dialog.progress_wait'.tr(),

    progressWidget: Container(padding: EdgeInsets.all(8.0), child: CircularProgressIndicator()),
    maxProgress: 100.0,
    progressTextStyle: TextStyle(color: Constants.clr_blue, fontSize: 13.0, fontWeight: FontWeight.w400),
    messageTextStyle: TextStyle(color: Constants.clr_blue, fontSize: 19.0, fontWeight: FontWeight.w600),
  );
  pr.show();

  var response = await Provider.of<PostApiService>(context,listen: false).administration(endpoint, body);

  Changes? changes = response.body;
  //String httpClientResponse = response;
  final int statusCode = response.statusCode;
  if (statusCode == 200) {
    pr.hide();
    showDialog(
        context: context,
        builder: (_) => new CupertinoAlertDialog(
          title: new Text('dialog.msg.notification'.tr()),
          content: new Text('${changes!.description}'),
          actions: <Widget>[
            TextButton(
              child: Text('dialog.btn.close'.tr()),
              onPressed: () {
                var _navigator = Navigator.of(context);
                _navigator.pop();
                _navigator.pop();
                _navigator.pop();
              },
            )
          ],
        ));
  }
}