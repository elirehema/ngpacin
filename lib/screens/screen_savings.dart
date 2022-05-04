import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/data/post_api_service.dart';
import 'package:mobile/model/index.dart';
import 'package:mobile/screens/index.dart';
import 'package:mobile/utils/colors.dart';
import 'package:mobile/utils/util.dart';
import 'package:mobile/widgets/widget_not_found.dart';
import 'package:mobile/widgets/widget_something_happened.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:provider/provider.dart';
import 'package:built_collection/built_collection.dart';

class ScreenSavingsList extends StatefulWidget {
  @override
  _ScreenSavingsListState createState() => new _ScreenSavingsListState();
}

class _ScreenSavingsListState extends State<ScreenSavingsList> {
  var _value, _savingPeriod, _savingFrequency;

  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  var codeDialog;
  String valueText = '';
  late ThemeData _theme;

  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);
    return Scaffold(
        backgroundColor:  _theme.scaffoldBackgroundColor,
        body: _futureBody(context),
        floatingActionButton: new Builder(builder: (BuildContext context) {
          return Visibility(
              child: FloatingActionButton(
                  tooltip: 'Create new saving account',
                  elevation: 2.0,
                  highlightElevation: 3.0,
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  backgroundColor: _theme.floatingActionButtonTheme.backgroundColor,
                  hoverColor: _theme.floatingActionButtonTheme.hoverColor,
                  onPressed: () {
                    _displayTextInputDialog(context);
                  }));
        }));
  }

  FutureBuilder<Response<BuiltList<SavingAccount>>> _futureBody(
      BuildContext context) {
    return FutureBuilder<Response<BuiltList<SavingAccount>>>(
      future: Provider.of<PostApiService>(context).getSavingAccount(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          BuiltList<SavingAccount>? _savings = snapshot.data!.body;
          if (_savings!.isEmpty) {
            return NothingFoundWarning(
              message: 'no_saving',
            );
          } else if (snapshot.hasError) {
            return SomethingWrongHasHappened();
          } else {
            final BuiltList<SavingAccount>? savings = snapshot.data!.body;
            return _savingsWidget(savings);
          }
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _savingsWidget(BuiltList<SavingAccount>? savings) {
    return ListView.builder(
      itemCount: savings?.length,
      shrinkWrap: true,
      itemBuilder: (context, index) => Card(
        elevation: 0.8,
        child: Card(
          shape: Utils.cardShapeRound(),
          shadowColor: colorPrimary,
          child:ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
          leading: ClipRRect(
              borderRadius: BorderRadius.circular(50.0),
              child: Container(
                  padding: EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                    color: _theme.cardTheme.shadowColor,
                  ),
                  child: Image.asset(
                    'images/money.png',
                  ))),
          title: Text(savings![index].description!, style: _theme.textTheme.headline2),
          subtitle: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(color: _theme.dividerTheme.color,),
              Text('title.saving_account_balance'.tr(args: ['${savings[index].balance}']),style: _theme.textTheme.headline3),
            ],
          ),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ScreenViewSaving(savings[index])));
          },
        ),),
      ),
    );
  }

  Future<void> _displayTextInputDialog(BuildContext dialogContext) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Center(
              child: Text('title.create_saving_acc'.tr(), style: TextStyle(fontWeight: FontWeight.bold),),
            ),
            content: _savingPeriods(),
            actions: <Widget>[
              ElevatedButton(
                style: Utils.coloredButtonStyleWithWidth(colorPrimary, 100.0),

                child: Text('CANCEL'),
                onPressed: () {
                  setState(() {
                    Navigator.pop(context);
                  });
                },
              ),
              ElevatedButton(
                style: Utils.coloredButtonStyleWithWidth(colorOne, 100.0),
                child: Text('Create'),

                onPressed: () {
                  if(_formKey.currentState!.validate()) {
                    var savingPayload = SavingPayload.createSavingAccount(_savingFrequency, _savingPeriod, int.parse(_amountController.text.toString().replaceAll(new RegExp(r"\D"), "")));

                    _confirmCreateSaving(dialogContext, savingPayload);
                  }
                },
              ),
            ],
          );
        });
  }

  FutureBuilder<Response> _savingPeriods() {
    return FutureBuilder<Response>(
      future: Provider.of<PostApiService>(context).getTemplate('savingperiod'),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final List<dynamic> savingPeriods =
              json.decode(snapshot.data!.bodyString);
          List<ValueLabel> _savingPeriods =
              savingPeriods.map((obj) => ValueLabel.fromJson(obj)).toList();
          if (savingPeriods.isEmpty) {
            return NothingFoundWarning();
          } else if (snapshot.hasError) {
            return SomethingWrongHasHappened();
          } else {
            // final List<ValueLabel> ? roles = json.decode(snapshot.data?.body);
            return Form(
                key: _formKey,
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(

                    autofocus: false,
                    keyboardType: TextInputType.numberWithOptions(decimal: false),
                    decoration: InputDecoration(
                        labelText: 'input.amount_to_start'.tr(),
                        hintText: '1000.0', suffixText: 'TZS'),

                    controller: _amountController,
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
                  Container(
                      child: DropdownButtonFormField(
                        value: _value,
                        selectedItemBuilder: (BuildContext context) {
                          return _savingPeriods.map<Widget>((ValueLabel item) {
                            return Text('${item.label}', style: _theme.textTheme.headline3,);
                          }).toList();
                        },
                        items: _savingPeriods.map((ValueLabel item) {
                          return DropdownMenuItem<String>(
                            child: Text('${item.label}', style: _theme.textTheme.headline3,),
                            value: item.value,
                          );
                        }).toList(),
                        onChanged: (value) {
                          _savingPeriod = value;
                        },
                        validator: (value) {
                          if (value == null) {
                            return 'warning.field_required'.tr();
                          }
                        },
                        hint: Text('selection.saving_period'.tr()),
                        style: TextStyle(
                            color: colorPrimary,
                            fontSize: 16,
                            fontWeight: FontWeight.normal),
                        icon: Icon(Icons.keyboard_arrow_down),
                        isExpanded: true,
                        isDense: true,
                      )),
                  _savingFrequencies(),
                ]));
          }
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  FutureBuilder<Response> _savingFrequencies() {
    return FutureBuilder<Response>(
      future:
          Provider.of<PostApiService>(context).getTemplate('savingfrequency'),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final List<dynamic> savingFrequencies =
              json.decode(snapshot.data!.bodyString);
          List<ValueLabel> _savingFrequencies =
              savingFrequencies.map((obj) => ValueLabel.fromJson(obj)).toList();
          if (savingFrequencies.isEmpty) {
            return NothingFoundWarning();
          } else if (snapshot.hasError) {
            return SomethingWrongHasHappened();
          } else {
            // final List<ValueLabel> ? roles = json.decode(snapshot.data?.body);
            return Container(
                child: DropdownButtonFormField(
              value: _value,
              selectedItemBuilder: (BuildContext context) {
                return _savingFrequencies.map<Widget>((ValueLabel item) {
                  return Text('${item.label}', style: _theme.textTheme.headline3,);
                }).toList();
              },
              items: _savingFrequencies.map((ValueLabel item) {
                return DropdownMenuItem<String>(
                  child: Text('${item.label}', style: _theme.textTheme.headline3,),
                  value: item.value,
                );
              }).toList(),
              onChanged: (value) {
                _savingFrequency = value;
              },
              validator: (value) {
                if (value == null) {
                  return 'warning.field_required'.tr();
                }
              },
              hint: Text('selection.saving_frequency'.tr()),
              style: TextStyle(
                  color: colorPrimary,
                  fontSize: 16,
                  fontWeight: FontWeight.normal),
              icon: Icon(Icons.keyboard_arrow_down),
              isExpanded: true,
              isDense: true,
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

  Future<void> _confirmCreateSaving(BuildContext context, SavingPayload body) async {
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
    print(body);
    final response = await Provider.of<PostApiService>(context,listen: false).savingActions('savingaccount', body);

    final Changes? changes = response.body;
    final int statusCode = response.statusCode;
    if (statusCode == 200) {
      pr.hide();
      Navigator.of(context).pop();
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
                },
              )
            ],
          ));
    }
  }

}
