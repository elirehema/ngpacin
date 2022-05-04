import 'package:chopper/chopper.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:mobile/data/post_api_service.dart';
import 'package:mobile/model/index.dart';
import 'package:mobile/utils/Constants.dart';
import 'package:mobile/utils/colors.dart';
import 'package:mobile/utils/util.dart';
import 'package:mobile/widgets/index.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:provider/provider.dart';
import 'package:built_collection/built_collection.dart';

class ScreenViewSaving extends StatefulWidget {
  final SavingAccount savingAccount;

  ScreenViewSaving(this.savingAccount);

  @override
  _ScreenViewSavingState createState() => new _ScreenViewSavingState();
}

class _ScreenViewSavingState extends State<ScreenViewSaving> {
  final _amountController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isDeposit = false;
  bool isWithDraw = false;
  late ThemeData _theme;
  final formatCurrency = new NumberFormat.decimalPattern();

  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);
    return Scaffold(
      backgroundColor: _theme.appBarTheme.backgroundColor,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              title: Center(child: Text('${widget.savingAccount.description}',style: _theme.textTheme.headline3,),),
              pinned: false,
              floating: true,
              forceElevated: innerBoxIsScrolled,
              backgroundColor: _theme.appBarTheme.backgroundColor,
              leading: Utils.backArrow(),
              bottom: PreferredSize(
                  preferredSize:  Size.fromHeight(200),
                  child: Container(
                    color: _theme.appBarTheme.backgroundColor,
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child:  Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('title.available_balance'.tr(), style: TextStyle(color: Colors.white),),
                        SizedBox(height: 1.0,),
                        Text('title.saving_balance_sh'.tr(args: ['${formatCurrency.format(int.parse(widget.savingAccount.balance!))}']),
                            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 30.0, color: Colors.white, fontFamily: 'Mukta')),
                        SizedBox(height: 20.0,),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                                style: Utils.coloredButtonStyleWithWidth(colorPrimary, 150.0, elevetion: 8.0),
                                onPressed: (){
                                  setState(() {
                                    isDeposit = true;
                                    isWithDraw = false;
                                  });
                                },
                                child: RichText(
                                  text: TextSpan(
                                    style: TextStyle( color: Colors.white),
                                    children: [
                                      WidgetSpan(child: Icon(Icons.call_received, size: 14, color: Colors.white,),),
                                      TextSpan(text: ' '),
                                      TextSpan(text: 'button.deposit'.tr()),
                                    ],
                                  ),
                                )
                            ),
                            ElevatedButton(
                                style: Utils.coloredButtonStyleWithWidth(Colors.blue, 150.0, elevetion: 8.0),
                                onPressed: (){
                                  setState(() {
                                    isDeposit = false;
                                    isWithDraw = true;
                                  });
                                },
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      WidgetSpan(child: Icon(Icons.call_made, size: 14),),
                                      TextSpan(text: ' '),
                                      TextSpan(text: 'button.withdraw'.tr()),
                                    ],
                                  ),
                                )
                            ),

                          ],),
                        SizedBox(height: 20.0,)
                      ],
                    ),
                  )

              ),
            ),
          ];
        },
        body:  Container(
          color: _theme.appBarTheme.backgroundColor,
          child: _bodyWidget(context)
        ),
      ),
    );

  }


  Widget _bodyWidget(BuildContext context){
    return  Container(
        height: MediaQuery.of(context).size.height - 10,
        margin: EdgeInsets.only(left: 0.0, right: 0.0, top: 5.0, bottom: 0.0),
        decoration: new BoxDecoration(
            color: _theme.scaffoldBackgroundColor,
            borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(20.0),
              topRight: const Radius.circular(20.0),
            )
        ),
        child: Padding(
            padding: EdgeInsets.only(top: 10.0, left: 3.0, right: 3.0),
            child: _viewSaving()
        )
    );
  }
  Widget _viewSaving(){

    return  (isDeposit==false && isWithDraw==false) ?
        _savingTransactions(context, widget.savingAccount.account!):
    Padding(
      padding: EdgeInsets.only(top: 10.0, left: 3.0, right: 3.0),
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child:
        Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Visibility(
              visible: isDeposit || isWithDraw,
              child: Spacer(),),
            Visibility(
              visible: isDeposit || isWithDraw,
              child: Divider(color: Constants.clr_blue,
            ),),
            Visibility(
              visible: isDeposit,
              child: _depositWidget(),
            ),
            Visibility(visible: isWithDraw, child: _withdrawWidget())
          ],
        ),
      ),
    );
  }

  FutureBuilder<Response<BuiltList<SavingTransaction>>> _savingTransactions(BuildContext context, String savingAccountId) {
    return FutureBuilder<Response<BuiltList<SavingTransaction>>>(
        future: Provider.of<PostApiService>(context).getSavingAccountTransactions(savingAccountId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
            final BuiltList<SavingTransaction>? _transactions = snapshot.data?.body;
            final formatCurrency = new NumberFormat.decimalPattern();
            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 13.0, left: 15.0),
                  child:   ListTile(
                    title: Text('Transactions', style: _theme.textTheme.headline2,),
                    trailing:  Transform(
                      transform: new Matrix4.identity()..scale(0.8),
                      child: new Chip(
                        label: new Icon(MdiIcons.tuneVariant, color: Colors.white,),
                        backgroundColor: colorPrimary,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: _transactions!.length,
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          child: ListTile(
                            title: ListTile(
                              dense: true,
                              leading: ClipRRect(
                                  borderRadius: BorderRadius.circular(50.0),
                                  child: Container(
                                      padding: EdgeInsets.all(3.0),
                                      decoration: BoxDecoration(
                                        color: _transactions[index].transType == 'DEPOSIT'?  colorPrimary : Colors.blue,
                                      ),
                                      child: Icon(_transactions[index].transType == 'DEPOSIT'? Icons.call_received_outlined : Icons.call_made, color: Colors.white,))
                              ),
                              title: Text('${_transactions[index].requestDate}', style: _theme.textTheme.headline3,),
                              subtitle: Text('title.saving_balance_sh'.tr(args: ['${formatCurrency.format(int.parse(_transactions[index].amount!))}']),
                                style: _theme.textTheme.headline2,),
                              trailing: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisSize: MainAxisSize.min,
                                children: [

                                  Text('${_transactions[index].transType}', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green),),
                                  SizedBox(height: 5.0,),
                                  Visibility(
                                    visible: _transactions[index].charge != "0",
                                    child:  Text('+ ${formatCurrency.format(int.parse(_transactions[index].charge!))}', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),),)
                                ],
                              ),
                            ),
                            subtitle: Divider(color: _theme.dividerTheme.color,),
                          ),
                          onTap: ()=>{
                            _viewSavingTransactionInDialog(context, _transactions[index])
                          },
                        );
                      }),
                ),
              ],
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
  Widget _depositWidget() {
    return Container(
        margin: EdgeInsets.only(top: 50.0),
        padding: EdgeInsets.all(10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: _theme.appBarTheme.backgroundColor,
            border: Border.all(color: Constants.clr_blue, width: 1.0),
            // Set border width
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            // Set rounded corner radius
            boxShadow: [
              BoxShadow(
                  blurRadius: 10, color: colorPrimary, offset: Offset(1, 3))
            ] // Make rounded corner of border
            ),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                autofocus: false,
                keyboardType: TextInputType.numberWithOptions(decimal: false),
                decoration: InputDecoration(
                    labelText: 'input.deposit_amount'.tr(),
                    hintText: '1000.0',
                    suffixText: 'TZS'),
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
              SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                style: Utils.buttonStyle(),
                child: Text('button.deposit'.tr()),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    var savingPayload = SavingPayload.deposit(widget.savingAccount.account, int.parse(_amountController.text.toString().replaceAll(new RegExp(r"\D"), "")));
                    _confirmSavingDeposit(context, 'deposit', savingPayload);
                  }
                },
              ),
            ],
          ),
        ));
  }

  Widget _withdrawWidget() {
    return Container(
      margin: EdgeInsets.only(top: 50.0),
      padding: EdgeInsets.all(10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: _theme.appBarTheme.backgroundColor,
          border: Border.all(color: Constants.clr_blue, width: 1.0),
          // Set border width
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          // Set rounded corner radius
          boxShadow: [
            BoxShadow(blurRadius: 10, color: colorPrimary, offset: Offset(1, 3))
          ] // Make rounded corner of border
          ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              autofocus: false,
              keyboardType: TextInputType.numberWithOptions(decimal: false),
              decoration: InputDecoration(
                  labelText: 'input.withdraw_amount'.tr(),
                  hintText: '1000.0',
                  suffixText: 'TZS'),
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
            SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              style: Utils.coloredButtonStyle(Colors.blue),
              child: Text('button.withdraw'.tr()),
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  var savingPayload = SavingPayload.deposit(widget.savingAccount.account, int.parse(_amountController.text.toString().replaceAll(new RegExp(r"\D"), "")));
                  _confirmSavingDeposit(context, 'withdraw', savingPayload);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
  _viewSavingTransactionInDialog(BuildContext dialogContext,  SavingTransaction transaction) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            contentPadding: const EdgeInsets.fromLTRB(0, 2, 0, 2),
            content: GestureDetector(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    title: Text('title.transaction_date'.tr()),
                    subtitle: Text('${transaction.requestDate}'),
                    trailing: Icon(Icons.close),
                  ),
                  Divider(height: 0.0,),
                  ListTile(
                    dense: true,
                    title: Text('title.account'.tr()),
                    subtitle: Text('${transaction.account}'),
                  ),
                  Divider(height: 0.0,),
                  ListTile(
                    dense: true,
                    title: Text('title.account_description'.tr()),
                    subtitle: Text('${transaction.accountDesc}'),
                  ),
                  Divider(height: 0.0,),
                  ListTile(
                    dense: true,
                    title: Text('title.transaction_amount'.tr()),
                    subtitle: Text('${transaction.amount}'),
                  ),
                  Divider(height: 0.0,),
                  ListTile(
                    dense: true,
                    title: Text('title.transaction_charge'.tr()),
                    subtitle: Text('${transaction.charge}'),
                  ),
                  Divider(height: 0.0,),
                  ListTile(
                    dense: true,
                    title: Text('title.current_balance'.tr()),
                    subtitle: Text('${transaction.balance}'),
                  ),
                  Divider(height: 0.0),
                  ListTile(
                    dense: true,
                    title: Text('title.transaction_type'.tr()),
                    subtitle: Text('${transaction.transType}'),
                  ),
                  Divider(height: 0.0,),
                ],
              ),
              onTap: ()=>Navigator.of(dialogContext).pop(),
            )
          );
        });
  }



  Future<void> _confirmSavingDeposit(BuildContext context,String action, SavingPayload body) async {
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
    final response = await Provider.of<PostApiService>(context,listen: false).savingActions(action, body);

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
                  setState(() {
                    isWithDraw = false;
                    isDeposit = false;
                  });
                },
              )
            ],
          ));
    }
  }
}
