import 'package:chopper/chopper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/data/post_api_service.dart';
import 'package:mobile/model/loan_response.dart';
import 'package:mobile/screens/index.dart';
import 'package:mobile/utils/Constants.dart';
import 'package:mobile/utils/colors.dart';
import 'package:mobile/utils/util.dart';
import 'package:mobile/widgets/widget_something_happened.dart';
import 'package:provider/provider.dart';
import 'package:built_collection/built_collection.dart';
import 'package:easy_localization/easy_localization.dart';

class ScreenViewLoan extends StatefulWidget{
  final String loanId;
  final String groupId;
  ScreenViewLoan(this.loanId, this.groupId);
  @override
  _ScreenViewLoanState createState()=>_ScreenViewLoanState();

}

class _ScreenViewLoanState extends State<ScreenViewLoan>{
  final _borderRadius = 10.0;
  late ThemeData _theme;
  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: _theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text('title.view_loan'.tr(args:['${widget.loanId}']), style: _theme.textTheme.headline3, ),
        elevation: 0.0,
        backgroundColor: _theme.appBarTheme.backgroundColor,
        leading: Utils.backArrow(),
        titleSpacing: 0,
      ),
      body: _futureBody(context),

    );
  }

  FutureBuilder<Response<BuiltList<LoanResponse>>> _futureBody(BuildContext context) {
    return FutureBuilder<Response<BuiltList<LoanResponse>>>(
      future: Provider.of<PostApiService>(context).getLoanById(groupId: widget.groupId.toString(),loanId: widget.loanId.toString(), forOthers: '0'),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
          final LoanResponse? loans = snapshot.data!.body?.first;
          return _viewLoan(loans);
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
  Widget _viewLoan(LoanResponse? loanResponse){
    return Card(
      shadowColor: Constants.clr_blue,
      margin: EdgeInsets.all(5.0),
      shape: _theme.cardTheme.shape,
      color: _theme.cardTheme.color,
      child: Padding(
        padding: EdgeInsets.all(_borderRadius),
        child:  Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ListTile(
              title:  Text('title.loan_type'.tr(args: ['${loanResponse!.loanType}']), style: TextStyle( fontWeight: FontWeight.bold),),
              subtitle:  Text('title.loan_id'.tr(args:['${loanResponse.loanId}'])),
              trailing:  ClipRRect(
                  borderRadius: BorderRadius.circular(1.0),
                  child: Container(
                      decoration: BoxDecoration(color: Colors.transparent,),
                      child: Image.asset('images/loan.png', height: 40.0,)
                  )),
            ),
            ListTile(
              title: Text('title.loan_amount'.tr()),
              subtitle: Text('${loanResponse.loanAmount} ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23.0),),
            ),
            ListTile(
              title: Text('title.loan_balance_'.tr()),
              subtitle: Text('${loanResponse.loanBalance} TZS', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23.0),),
            ),
            ListTile(
              title: Text('title.group_name'.tr(args: [''])),
              subtitle: Text('${loanResponse.groupName}'),
            ),
            SizedBox(height: 50.0,),
            Visibility(
              visible: !loanResponse.loanBalance!.isNaN,
              child:  ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))),
                  elevation: MaterialStateProperty.all(0.0), minimumSize: MaterialStateProperty.all(Size(double.infinity, 30)),
                ),
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ScreenLoanRepayment(loanResponse.loanId!, loanResponse.groupId!, loanResponse.loanType!, balance: loanResponse.loanBalance,)));
                },
                child: Text('button.create_repayment'.tr(), style: TextStyle(color: Colors.white)),
              ),
            )
          ],
        ),
      )
    );
  }

}