import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/screens/index.dart';
import 'package:mobile/screens/screen_groups.dart';
import 'package:mobile/screens/help/screen_what_is_mkoba.dart';
import 'package:mobile/utils/colors.dart';
import 'package:mobile/utils/sharedpreference.dart';

class ScreenServicesView extends StatefulWidget {
  @override
  _ServiceScreenViewState createState() => _ServiceScreenViewState();
}

class _ServiceScreenViewState extends State<ScreenServicesView> {
  final sp = SharedPreference.getInstance();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorAccent,
      appBar: AppBar(
        backgroundColor: colorPrimary,
        automaticallyImplyLeading: false,
        title: Center(
          child: Text("Services"),
        ),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: 3,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return Container(
                width: null,
                margin: const EdgeInsets.all(0.0),
                alignment: Alignment.center,
               child: Flex(
                 direction: Axis.horizontal,
                 children: [
                    Expanded(
                     child: GestureDetector(
                         onTap: () async{
                           bool whatIsMkoba = await sp.getBoolValuesSF(enumKey.HAS_READ_WHAT_IS_MKOBA.toString()) ?? false;
                           bool acceptedTerms = await sp.getBoolValuesSF(enumKey.HAS_ACCEPTED_TERMS_AND_CONDITIONS.toString()) ?? false;
                           if(whatIsMkoba && acceptedTerms) {
                             Navigator.of(context).push(MaterialPageRoute(
                                 builder: (context) => ScreenGroups()));
                           }else{
                             Navigator.of(context).push(MaterialPageRoute(
                                 builder: (context) => ScreenWhatIsMkoba()));
                           }
                         },
                         child: Card(
                           margin: EdgeInsets.all(12.0),
                           clipBehavior: Clip.antiAlias,
                           child: Column(
                             children: [
                               Image.asset('images/group.png'),
                               Padding(
                                 padding: const EdgeInsets.all(16.0),
                                 child: ListTile(
                                   title: Padding(
                                       padding:
                                       EdgeInsets.only(top: 8.0, bottom: 5.0),
                                       child: Text('Welcome to M-Koba')),
                                   subtitle: Text(
                                     'Start saving funds together with friends and family',
                                     style: TextStyle(
                                         fontWeight: FontWeight.bold,
                                         fontSize: 20.0,
                                         color: Colors.black.withOpacity(0.6)),
                                   ),
                                 ),
                               ),
                             ],
                           ),
                         )),
                   ),
                 ],
               ),
              );
            }),
      ),
    );
  }
}
