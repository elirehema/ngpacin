import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile/data/post_api_service.dart';
import 'package:mobile/model/index.dart';
import 'package:mobile/screens/index.dart';
import 'package:mobile/utils/Constants.dart';
import 'package:mobile/utils/colors.dart';
import 'package:mobile/utils/index.dart';
import 'package:mobile/utils/util.dart';
import 'package:mobile/widgets/widget_not_found.dart';
import 'package:mobile/widgets/widget_something_happened.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

class ScreenCreateGroup extends StatefulWidget {
  @override
  _ScreenCreateGroupState createState() => _ScreenCreateGroupState();
}

class _ScreenCreateGroupState extends State<ScreenCreateGroup> {

  final _formKey = GlobalKey<FormState>();
  var values = {'1000', '2000', '5000', '10000'};
  var name = TextEditingController();
  var amount = TextEditingController();
  var _value, _groupType;

  final focus = FocusNode();
  late ProgressDialog pd;
  late ThemeData _theme;

  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: _theme.scaffoldBackgroundColor,
      appBar: AppBar(

        title: Text('title.create_group'.tr(), style: _theme.textTheme.headline3,),
        backgroundColor: _theme.appBarTheme.backgroundColor,
        iconTheme: _theme.appBarTheme.iconTheme,
        leading: Utils.backArrow(),
        elevation: 0.0,
      ),
      body: _body(),

    );
  }
  FutureBuilder<Response>  _body() {
    return FutureBuilder<Response>(
      future: Provider.of<PostApiService>(context).getTemplate('grouptypes'),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final List<dynamic> groupTypes = json.decode(snapshot.data!.bodyString) ;
          List<ValueLabel> _groupTypes = groupTypes.map((obj) => ValueLabel.fromJson(obj)).toList();
          if (groupTypes.isEmpty) {
            return NothingFoundWarning();
          } else if (snapshot.hasError) {
            return SomethingWrongHasHappened();
          } else {
            // final List<ValueLabel> ? roles = json.decode(snapshot.data?.body);
            return  Form(
              key: _formKey,
              child:Container(
                  height: double.maxFinite,
                  width: double.maxFinite,
                  padding: EdgeInsets.all(2.0),
                  child: Card(
                      elevation: 1,
                      shadowColor: Constants.clr_blue,
                      shape: Utils.cardShapeRound(),
                      child:  Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            //Text('Group name'),

                            TextFormField(
                              controller:  name,
                              maxLength: 16,
                              maxLines: 1,
                              autofocus: true,
                              decoration: InputDecoration(labelText: 'title.group_name'.tr(args: [''])),
                              textInputAction: TextInputAction.next,
                              onFieldSubmitted: (v) {
                                FocusScope.of(context)
                                    .requestFocus(focus);
                              },
                              validator: (text) {
                                if (text == null || text.isEmpty) {
                                  return 'warning.field_required'.tr();
                                }
                                return null;
                              },
                            ),


                            //Text('Amount to start'),
                            TextFormField(
                              controller: amount,
                              keyboardType: TextInputType.numberWithOptions(decimal: false),
                              decoration: InputDecoration(
                                  labelText: 'input.amount_to_start'.tr(),
                                  hintText: '1000.0', suffixText: 'TZS'),
                              textInputAction: TextInputAction.go,
                              focusNode: focus,
                              onFieldSubmitted: (v) {
                                print('Go');
                              },
                              validator: (text) {
                                if (text == null || text.isEmpty) {
                                  return 'warning.field_required'.tr();
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
                            SizedBox(height: 30.0,),

                            Container(
                                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                                child: DropdownButtonFormField(
                                  value: _value,
                                  selectedItemBuilder: (BuildContext context) {
                                    return _groupTypes.map<
                                        Widget>((ValueLabel item) {
                                      return Text('${item.label}', style: _theme.textTheme.headline3,);
                                    }).toList();
                                  },
                                  items: _groupTypes.map((ValueLabel item) {
                                    return DropdownMenuItem<String>(
                                      child: Text('${item.label}', style: _theme.textTheme.headline3,),
                                      value: item.value,
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    _groupType = value;
                                  },
                                  validator: (value) {
                                    if (value == null) {
                                      return 'warning.field_required'.tr();
                                    }
                                  },
                                  hint: Text('selection.group_type'.tr()),
                                  style: TextStyle(
                                      color: colorPrimary,
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal),
                                  icon: Icon(Icons.keyboard_arrow_down),
                                  isExpanded: true,
                                  isDense: true,
                                )),

                            Spacer(),
                            ElevatedButton(
                              style: Utils.buttonStyle(),
                              onPressed: () async{
                                if(_formKey.currentState!.validate()) {
                                  SharedPreference sp = SharedPreference.getInstance();

                                  var _groupAdminMobileNumber = await sp.getStringValuesSF(currentUserEnum.M_SSD_IN.toString());

                                  var group = GroupPost.from(name.text.toString(), _groupAdminMobileNumber, amount.text.toString().replaceAll(new RegExp(r"\D"), ""), int.parse(_groupType));
                                  _verifyGroupInformation(context, group);
                                }
                              },
                              child:
                              Text('button.preview'.tr() ,style: TextStyle(color:  Colors.white)),
                            )
                          ],
                        ),
                      )


                  )),

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
}

void _verifyGroupInformation(BuildContext context, GroupPost body) {
  Navigator.push(context,    MaterialPageRoute(builder: (context) => new ScreenReviewGroup(body)));
}
