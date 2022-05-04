import 'package:chopper/chopper.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile/data/post_api_service.dart';
import 'package:mobile/model/contribution.dart';
import 'package:mobile/model/index.dart';
import 'package:mobile/screens/index.dart';
import 'package:mobile/screens/screen_check_confirm.dart';
import 'package:mobile/utils/colors.dart';
import 'package:mobile/utils/index.dart';
import 'package:mobile/utils/utils.dart';
import 'package:mobile/widgets/index.dart';
import 'package:mobile/widgets/widget_something_happened.dart';
import 'package:provider/provider.dart';
import 'package:built_collection/built_collection.dart';
import 'package:easy_localization/easy_localization.dart';

final _actions = ['title.contribute', 'title.buy_share', 'title.pay_social_fund','title.pay_penalty'];

class ScreenContribute extends StatefulWidget {
  final int groupId;
  final int action;
  final int? sharePrice;
  final int? groupType;
  ScreenContribute(this.groupId, this.action,{ this.groupType, this.sharePrice});
  @override
  _ScreenContributeState createState() => _ScreenContributeState();
}

class _ScreenContributeState extends State<ScreenContribute> {
  var values = {'1000', '2000', '5000', '10000'};
  final _formKey = GlobalKey<FormState>();
  late bool showOther = false;
  final _borderRadius = 10.0;
  var _value,_msisdn,_memberName;
  final ValueNotifier<int> _valueNotifier = ValueNotifier<int>(0);
  late ThemeData _theme;

  final amount = TextEditingController();

  @override
  void initState() {
    if(widget.sharePrice != null) {
      amount.text = widget.sharePrice!.toString();
    }
    _selectAmount();
    super.initState();
  }
  @override
  void dispose() {
    super.dispose();
    showOther = true;
  }

  void _selectAmount() async {
    SharedPreference sp = SharedPreference.getInstance();
    String _mobileNumber = await sp.getStringValuesSF(currentUserEnum.M_SSD_IN.toString());
    _valueNotifier.value = int.parse(_mobileNumber);
  }
  void _selectAmountValue(String value) {
    amount.text = value;
  }



  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: _theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(_actions[widget.action].tr(), style: _theme.textTheme.headline3,),
        backgroundColor: _theme.appBarTheme.backgroundColor,
        iconTheme: _theme.iconTheme,
        elevation: 0.0,
        leading: Utils.backArrow(),
        titleSpacing: 0,
      ),
      body:SingleChildScrollView(
          child:  Card(
        shadowColor: Constants.clr_blue,
          margin: EdgeInsets.all(5.0),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(_borderRadius)
          ),
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
                      child: Icon(Icons.ac_unit, color: colorPrimary,),
                    ),
                    title: Text('message.action_message'.tr(args: ['${_actions[widget.action]}'.tr()]), style: TextStyle(color: Colors.white,),),

                  ),
                ),
                //Text('Group name'),
                Padding(padding: EdgeInsets.all(20.0),
                  child:  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 20.0,),

                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: Text(''),
                          ),
                          Expanded(
                            child: Visibility(
                              visible: widget.action == 1 && widget.groupType != 1,
                              child: Text('title.share_price'.tr(args: ['TZS '+widget.sharePrice.toString()]), style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),),
                            )
                          ),
                        ],
                      ),
                      Visibility(
                        visible: widget.action == 3,
                        child: ValueListenableBuilder(valueListenable: _valueNotifier, builder: (context, value, child) {
                        return _penaltyInput(context, bParty: _valueNotifier.value.toString());}),),
                      SizedBox(height: 25.0,),
                  Visibility(
                    visible: widget.action != 3,
                    child: TextFormField(
                          controller: amount,
                          autofocus: true,

                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(labelText: 'label.amount'.tr(), hintText: 'TZS 10,000'),
                          inputFormatters: [
                            CurrencyTextInputFormatter(
                              decimalDigits: 0,
                              locale: 'sw',
                            )
                          ],
                          validator: (value) {
                            if (value == null) {
                              return 'warning.field_required'.tr();
                            }else if(widget.action == 1 && (int.parse(value.toString().replaceAll(new RegExp(r"\D"), "")) % num.parse(widget.sharePrice.toString())) != 0){
                              return 'warning.share_price_multiple'.tr(args: [widget.sharePrice.toString()]);
                            }
                          },
                        ),),

                      Visibility(
                          visible: showOther,
                          child: _memberList(context, widget.groupId)
                      ),
                      SizedBox(height: 20.0,),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: values.map((text) => GestureDetector(
                            onTap: (){
                              _selectAmountValue(text);
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

                      SizedBox(height: 10.0,),
                      Center(
                        child: TextButton(child: Text(showOther? 'button.for_oneself'.tr(): 'button.for_other'.tr(),  style: TextStyle( color: Colors.blueAccent, fontWeight: FontWeight.normal),
                        ),
                          onPressed: (){
                            setState(() {
                              showOther = !showOther;
                            });
                          },
                        ),
                      ),
                      SizedBox(height: 40.0,),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child:  ElevatedButton(
                          style: Utils.buttonStyle(),
                          onPressed: () async{
                            if(_formKey.currentState!.validate()) {
                              SharedPreference sp = SharedPreference.getInstance();
                              String _mobileNumber = await sp.getStringValuesSF(currentUserEnum.M_SSD_IN.toString());
                              var _forOther =  showOther?'1':'0';
                              Contribution _contribution = Contribution.from(widget.groupId.toString(), _mobileNumber, showOther ?_msisdn.toString():'0', int.parse(amount.text.toString().replaceAll(new RegExp(r"\D"), "")), _forOther);
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => ScreenCheckAndConfirm(_contribution, widget.action, name: _memberName,)));
                          }},
                          child: Text('button.continue'.tr(), style: TextStyle(color: Colors.white)),
                        ),

                      ),

                    ],
                  ),)


              ],
            ),
          )

        ))


    );
  }
  FutureBuilder<Response<BuiltList<Penalty>>> _penaltyInput(BuildContext context, {String? bParty}) {
    return FutureBuilder<Response<BuiltList<Penalty>>>(
      future: Provider.of<PostApiService>(context).getMemberPenalty(groupId: widget.groupId.toString(), forOthers: showOther ? '1':'0', bParty: bParty ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
          final BuiltList<Penalty>?  penalties = snapshot.data!.body;

          if(penalties!.length > 0 && penalties.first.amount != '0'){
            Penalty penalty = penalties.first;
            amount.text = penalty.amount!;
            return Container(
              padding: EdgeInsets.all(0.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child:   Text('title.penalty_balance'.tr(args: [penalty.amount.toString()]), style: TextStyle(color: colorPrimary, fontWeight: FontWeight.w800),),
                  ),
                  TextFormField(
                    controller: amount,
                    autofocus: false,

                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: 'label.amount'.tr(), hintText: 'TZS 10,000'),
                    inputFormatters: [
                      CurrencyTextInputFormatter(
                        decimalDigits: 0,
                        locale: 'sw',
                      )
                    ],
                    validator: (value) {
                      if (value == null) {
                        return 'warning.field_required'.tr();
                      }
                    },
                  )
                ],
              ),);
          }else{
            return NoPenaltyFoundScreen();
          }
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

  FutureBuilder<Response<BuiltList<GroupMember>>> _memberList(BuildContext context, int groupId) {
    return FutureBuilder<Response<BuiltList<GroupMember>>>(
      future:
      Provider.of<PostApiService>(context).getGroupMembers(groupId.toString()),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {

          final BuiltList<GroupMember>?  members = snapshot.data!.body;
          return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: DropdownButtonFormField(
                value: _value,
                selectedItemBuilder: (BuildContext context) {
                  return members!.map<Widget>((GroupMember member) {
                    return  Text('${member.firstName} ${member.familyName}', style: _theme.textTheme.headline3,);
                  }).toList();
                },
                items: members?.map((GroupMember member) {
                  return DropdownMenuItem<String>(
                    child: ListTile(title:Text('${member.firstName} ${member.familyName}'),
                    subtitle: Text('${member.msisdn}', style: _theme.textTheme.headline3,),
                    dense: true,),
                    value: member.msisdn,
                  );
                }).toList(),
                onChanged: (value) {
                  _msisdn = value;
                  GroupMember? _member = members!.firstWhere((item) => item.msisdn == _msisdn, );
                  _memberName = '${_member.firstName} ${_member.familyName}';
                  _valueNotifier.value = int.parse(_member.msisdn);
                },
                validator: (value) {
                  if (value == null && showOther) {
                    return 'warning.field_required'.tr();
                  }
                },
                hint: Text('selection.member'.tr(), style: _theme.textTheme.headline3,),
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
