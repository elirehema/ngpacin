import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/data/post_api_service.dart';
import 'package:mobile/model/changes.dart';
import 'package:mobile/model/contribution.dart';
import 'package:mobile/utils/Constants.dart';
import 'package:mobile/utils/colors.dart';
import 'package:mobile/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

class ScreenCheckAndConfirm extends StatelessWidget {
  final Contribution contribution;
  final int action;
  var  name;
  late ThemeData _theme;
  ScreenCheckAndConfirm(this.contribution, this.action, {this.name});
  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: _theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text('title.check_and_confirm'.tr(), style: _theme.textTheme.headline3,),
        backgroundColor: _theme.appBarTheme.backgroundColor,
        iconTheme: _theme.iconTheme,
        elevation: 0.0,
      ),
      body: Card(
          shadowColor: _theme.cardTheme.shadowColor,
          shape: _theme.cardTheme.shape,
          child:Container(
          padding: EdgeInsets.all(10.0),
          child:  Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Visibility(
                    visible: contribution.bParty! != '0',
                    child: ListTile(
                    title: ListTile(
                      dense: true,
                      title: Text(
                        'title.to'.tr(), style: _theme.textTheme.headline2,
                      ),
                     trailing: Text('$name', style: _theme.textTheme.headline3,),
                    ),
                    subtitle: Text('title.phone'.tr(args: ['${contribution.bParty}']), style: _theme.textTheme.headline3,),
                    ),),
                  Visibility(
                    visible: contribution.bParty! != '0',
                    child:  Divider(),),
                  ListTile(
                    dense: true,
                    title: Text('title.from'.tr(), style: TextStyle(fontSize: 20.0), ),
                    trailing: Text(
                      contribution.mobileNumber.toString(),
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    dense: true,
                    title:
                    Text('title.amount'.tr(), style: TextStyle(fontSize: 20.0)),
                    trailing: Text(
                      '${Constants.currencyFormat.format(contribution.amount)}',
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                  ),
                  Divider(),
                  Spacer(),
                  ElevatedButton(
                    style: Utils.buttonStyle(),
                    onPressed: () async{
                      await _confirmContribution(context, contribution, action);
                    },
                    child: Text('button.submit'.tr(), style: TextStyle(color: Colors.white)),
                  ),
                  SizedBox(height: 20.0,)
                ],
              ),)),
    );
  }
}

Future<void> _confirmContribution(BuildContext context,Contribution contribution, int action) async {
  //final _formKey = GlobalKey<FormState>();
   var  response;
   switch(action){
     case 0:
       response = await Provider.of<PostApiService>(context,listen: false).contributeToGroup(contribution);
       break;
     case 1:
       response = await Provider.of<PostApiService>(context,listen: false).buyShares(contribution);
       break;
     case 2:
       response = await Provider.of<PostApiService>(context,listen: false).paySocialFund(contribution);
       break;
     case 3:
       response = await Provider.of<PostApiService>(context,listen: false).payPenalty(contribution);
       break;
   }

    Changes? changes = response.body!;
    //String httpClientResponse = response;
    final int statusCode = response.statusCode;
    if (statusCode == 200) {
      showDialog(
          context: context,
          builder: (_) => new CupertinoAlertDialog(
            title: new Text('dialog.msg.notification'.tr()),
            content: new Text('${changes!.description}'),
            actions: <Widget>[
              TextButton(
                child: Text('dialog.btn.close'.tr()),
                onPressed: () {
                 var navigator = Navigator.of(context);
                  navigator.pop();
                  navigator.pop();
                  navigator.pop();
                },
              )
            ],
          ));
    }
}

