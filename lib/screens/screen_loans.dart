import 'package:chopper/chopper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/data/post_api_service.dart';
import 'package:mobile/model/index.dart';
import 'package:mobile/screens/index.dart';
import 'package:mobile/utils/colors.dart';
import 'package:mobile/widgets/index.dart';
import 'package:mobile/widgets/widget_something_happened.dart';
import 'package:provider/provider.dart';
import 'package:built_collection/built_collection.dart';
import 'package:easy_localization/easy_localization.dart';

class ScreenLoanList extends StatefulWidget {
  @override
  _ScreenLoanListState createState() => _ScreenLoanListState();
}

class _ScreenLoanListState extends State<ScreenLoanList> {
  late  ThemeData _theme;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
     _theme = Theme.of(context);
    return Scaffold(
      backgroundColor: _theme.scaffoldBackgroundColor,
      body: _futureBody(context),
    );
  }

  FutureBuilder<Response<BuiltList<LoanResponse>>> _futureBody(
      BuildContext context) {
    return FutureBuilder<Response<BuiltList<LoanResponse>>>(
      future: Provider.of<PostApiService>(context).getLoanList(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          BuiltList<LoanResponse>? _loans = snapshot.data?.body;
          if (_loans!.isEmpty) {
            return NothingFoundWarning(message: 'no_loan',);
          } else if (snapshot.hasError) {
            return SomethingWrongHasHappened();
          } else {
            final BuiltList<LoanResponse> ? loans = snapshot.data?.body;
            return _loansWidget(loans);
          }
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _loansWidget(BuiltList<LoanResponse>? loans){
    return ListView.builder(
      itemCount: loans?.length,
      shrinkWrap: true,
      itemBuilder: (context, index) => Card(
        elevation: 0.8,
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 5.0),
          leading: ClipRRect(
              borderRadius: BorderRadius.circular(50.0),
              child: Container(
                padding: EdgeInsets.all(3.0),
                  decoration: BoxDecoration(color: colorAccent,),
                  child: Image.asset('images/loan.png',)
              )),
          title: Text(loans![index].loanType!, style: _theme.textTheme.headline2,),
          subtitle: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(),
              Text('title.loan_balance'.tr(args: ['${loans[index].loanBalance}']),style: _theme.textTheme.headline3,),
              SizedBox(height: 5.0,),
              Text('title.group_name'.tr(args: [': ${loans[index].groupName}']), style: _theme.textTheme.headline3,),
              SizedBox(height: 5.0,),
              Text('title.loan_type'.tr(args: [': ${loans[index].loanType}']),style: _theme.textTheme.headline3,),
            ],
          ),
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => ScreenViewLoan(loans[index].loanId!, loans[index].groupId!)));
          },
        ),
      ),
    );
  }


}

