import 'package:chopper/chopper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile/data/post_api_service.dart';
import 'package:mobile/model/index.dart';
import 'package:mobile/utils/Constants.dart';
import 'package:mobile/utils/colors.dart';
import 'package:mobile/utils/utils.dart';
import 'package:mobile/widgets/widget_something_happened.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

class ScreenReviewGroup extends StatefulWidget {
  final GroupPost groupPost;

  ScreenReviewGroup(this.groupPost);

  @override
  _ScreenReviewGroupState createState() => _ScreenReviewGroupState();
}

class _ScreenReviewGroupState extends State<ScreenReviewGroup> {
  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: scaffoldBackgroundColor,
      appBar: AppBar(

        title: Text('title.check_and_confirm'.tr()),
        backgroundColor: colorPrimary,
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0.0,
      ),
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        padding: EdgeInsets.all(2.0),
        child: Card(
            elevation: 1,
            shadowColor: Constants.clr_blue,
            margin: EdgeInsets.all(5.0),
            shape: Utils.cardShapeRound(),
            child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Text('Group name'),
                    ListTile(
                      dense: true,
                      leading: Text('title.group_name'.tr(args: [''])),
                      trailing: Text(
                        widget.groupPost.groupName,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Divider(
                      color: Colors.black,
                      thickness: 0.5,
                    ),
                    ListTile(
                      dense: true,
                      leading: Text('title.group_balance'.tr()),
                      trailing: Text( widget.groupPost.amount,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),

                    Divider(
                      color: Colors.black,
                      thickness: 0.5,
                    ),
                    ListTile(
                      dense: true,
                      leading: Text('title.group_type'.tr()),
                      trailing: Text( Constants.GROUP_TYPES[widget.groupPost.groupType - 1],
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),

                    Divider(
                      color: Colors.black,
                      thickness: 0.5,
                    ),

                    Spacer(),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                    style: Utils.buttonStyle(),
                    onPressed: () async{
                      Future<Response<Fees>> response = Provider.of<PostApiService>(context, listen: false).getFeesByType('groupfee');
                      Fees? fee;
                      response.then((value) => {
                        fee = value.body,
                        if(int.parse(fee!.charge!)>int.parse(widget.groupPost.amount)){
                          showDialog(context: context, builder: (BuildContext context) => RedeemConfirmationScreen(widget.groupPost))
                        }else{
                          _createNewGroup(context, widget.groupPost)
                        }

                      });
                      //
                    },
                    child: Text('button.create_group'.tr(),
                        style: TextStyle(color: Colors.white)),
                  ),
                )
                  ],
                ),
              ),
            ),
      ),
    );
  }
}
class RedeemConfirmationScreen extends StatelessWidget {
  final GroupPost groupPost;
  RedeemConfirmationScreen(this.groupPost);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white.withOpacity(0.0), // this is the main reason of transparency at next screen. I am ignoring rest implementation but what i have achieved is you can see.
        body: FutureBuilder<Response<Fees>>(
          future: Provider.of<PostApiService>(context).getFeesByType('groupfee'),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
              Fees? fee = snapshot.data!.body;
              return CustomDialog(fee!.charge, groupPost);
            } else if (snapshot.hasError) {
              return SomethingWrongHasHappened();
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        )
    );
  }
}

class CustomDialog extends StatelessWidget {
  final String? amount;
  final GroupPost groupPost;

  CustomDialog(this.amount, this.groupPost);

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0)),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        child: Container(
          margin: EdgeInsets.only(left: 0.0, right: 0.0),
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                  top: 18.0,
                ),
                margin: EdgeInsets.only(top: 13.0, right: 8.0),
                decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(16.0),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 0.0,
                        offset: Offset(0.0, 0.0),
                      ),
                    ]),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(
                      height: 20.0,
                    ),
                    Center(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: new Text(
                            'dialog.msg.group_min_balance'.tr(args: ['$amount']),
                            style: TextStyle(
                                fontSize: 19.0, color: Colors.white),
                            textAlign: TextAlign.center,),
                        ) //
                    ),
                    SizedBox(height: 24.0),
                    InkWell(
                      child: Container(
                        padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(16.0),
                              bottomRight: Radius.circular(16.0)),
                        ),
                        child: Text(
                          'dialog.btn.proceed'.tr(),
                          style: TextStyle(color: Colors.blue, fontSize: 25.0),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        _createNewGroup(context, groupPost);
                      },
                    )
                  ],
                ),
              ),
              Positioned(
                right: 0.0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Align(
                    alignment: Alignment.topRight,
                    child: CircleAvatar(
                      radius: 14.0,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.close, color: Colors.red),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}
  Future<void> _createNewGroup(BuildContext context, GroupPost group) async {
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
  final response = await Provider.of<PostApiService>(context, listen: false)
      .createGroup(group);

  Changes? change = response.body;

  //String httpClientResponse = response;
  final int statusCode = response.statusCode;
  print("Status code: $statusCode");
  if (statusCode == 200 || change?.code == "0") {
   pr.hide();

   showDialog(
       context: context,
       builder: (_) => new CupertinoAlertDialog(
         title: new Text('dialog.msg.notification'.tr()),
         content: new Text('${change!.description}'),
         actions: <Widget>[
           TextButton(
             child: Text('dialog.btn.close'.tr()),
             onPressed: () {
               Navigator.of(context).pop();
               Navigator.popAndPushNamed(context,'/welcome');
             },
           )
         ],
       ));
  } else if (statusCode == 500) {
    //pr.hide();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.redAccent,
      content: Text("Invalid username or password. Try again ..."),
    ));
  } else {
    //pr.hide();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.redAccent,
      content: Text("Internal server error. Please try again later..."),
    ));
    Navigator.of(context).pop();
  }
}
