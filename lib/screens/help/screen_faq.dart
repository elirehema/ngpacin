import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile/utils/Constants.dart';
import 'package:mobile/utils/colors.dart';
import 'package:mobile/utils/util.dart';

class FAQ {
  const FAQ(this.question, this.answers);

  final String question;
  final List<String> answers;
}
class ScreenFrequentlyAskedQuestions extends StatelessWidget {
  late ThemeData _theme;
  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);
    return Scaffold(
      backgroundColor: _theme.appBarTheme.foregroundColor,
      appBar: AppBar(
        title: Text('menu.faq'.tr(), style: _theme.textTheme.headline3,),
        backgroundColor: _theme.appBarTheme.backgroundColor,
        iconTheme: IconThemeData(color:  _theme.appBarTheme.iconTheme!.color,),
        elevation: 0.0,
        leading: Utils.backArrow(),
      ),
      body: SingleChildScrollView(
        child:ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: Constants.faqs.length,
            itemBuilder: (context, index) {
              return _buildExpandableTile(Constants.faqs[index]);
            }),

      ),
    );
  }

  Widget _buildExpandableTile(FAQ faq){
    return ExpansionTile(
      collapsedBackgroundColor: _theme.appBarTheme.foregroundColor,
      collapsedIconColor: _theme.iconTheme.color,
      backgroundColor: _theme.scaffoldBackgroundColor,
      title: Text('Qn: ${faq.question}'.trim(), style: _theme.textTheme.headline3,),
      children: faq.answers.map((String element) {
        return ListTile(
          dense: true,
          minLeadingWidth: -2,
          leading: Icon(Icons.grain_outlined, color: Colors.lightGreen,size: 12.0,),
          title: Text(element),
        );
      }).toList(),
    );

  }
}
