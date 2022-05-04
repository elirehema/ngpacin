import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile/screens/index.dart';
import 'package:mobile/screens/help/screen_accept_terms.dart';
import 'package:mobile/utils/colors.dart';
import 'package:mobile/utils/sharedpreference.dart';

class ScreenWhatIsMkoba extends StatelessWidget{
  final sp = SharedPreference.getInstance();
  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);
    return new Scaffold(
        backgroundColor: _theme.appBarTheme.foregroundColor,
      appBar: AppBar(

        actions: [
          Padding(
              padding: EdgeInsets.only(right: 5.0),
              child: IconButton(
                icon:  Icon(Icons.close, color: _theme.appBarTheme.iconTheme!.color,),
                tooltip: 'Decline Terms & Conditions',
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )),
        ],
        automaticallyImplyLeading: false,
        backgroundColor:  _theme.appBarTheme.foregroundColor,
        iconTheme: _theme.appBarTheme.iconTheme,
        elevation: 0.0,
      ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(height: 80.0,  image: AssetImage('images/question.png')),
              SizedBox(height: 10),
              Text('What is M-Koba ?', style: _theme.textTheme.headline2,),
              SizedBox(height: 10),
              Padding(padding: EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
              child: Text('Vodacom in partnership with TPB Bank have introduced a new mechanism '
                  'to save money, access loans and share earnings to groups like family and friends, VICOBA,'
                  ' VSLA, along with different groups with the intention of saving money and give each other loans.',
                textAlign: TextAlign.justify, style:  _theme.textTheme.headline3,),),
              SizedBox(height: 10),
              Padding(padding: EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
                child: Text('This service is called M-KOBA, M-KOBA is a new digital form of '
                    'saving that provides security of the groups’ money, transparency and simplicity '
                    'for members to contribute from anywhere through Vodacom M-Pesa.',
                  textAlign: TextAlign.justify, style:  _theme.textTheme.headline3,),),
              SizedBox(height: 10),
              Padding(padding: EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
                child: Text('M-Koba has been designed to resolve current challenges faced by groups with cash'
                    ' based mechanism like safely collecting contributions from group members, giving out loans'
                    ' and share earnings. M-Koba is another milestone to take Tanzania into the Digital economy as '
                    'it eliminates the necessity to carry cash in regards to group activities.',
                  textAlign: TextAlign.justify, style:  _theme.textTheme.headline3,),),
           ],
          ),
        ),

    );
  }

  Future<void>  _hasReadTermsAndConditions(BuildContext context) async{
    bool n = await sp.getBoolValuesSF(enumKey.HAS_READ_WHAT_IS_MKOBA.toString()) ?? false;
    bool acceptedTerms = await sp.getBoolValuesSF(enumKey.HAS_ACCEPTED_TERMS_AND_CONDITIONS.toString()) ?? false;
    print(n.toString());
    print(acceptedTerms.toString());

    if(!n){
      await sp.setBooleanToSF(enumKey.HAS_READ_WHAT_IS_MKOBA.toString(), true);
    }
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => acceptedTerms ? ScreenNoGroupFound() :ScreenAcceptTermsAndConditions()));
  }

}