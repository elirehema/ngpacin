import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/screens/index.dart';
import 'package:provider/provider.dart';
import 'package:mobile/data/post_api_service.dart';
import 'package:mobile/model/index.dart';
import 'package:mobile/routes.dart';
import 'package:mobile/utils/index.dart';
import 'package:mobile/utils/sharedpreference.dart';
import 'package:flutter_settings_ui/flutter_settings_ui.dart';

class ScreenSettings extends StatefulWidget {

  @override
  _ScreenSettingsState createState()=> _ScreenSettingsState();
}

class _ScreenSettingsState extends State<ScreenSettings> {
  bool value = false;
  void _onFingerPrintSetting(bool it) {
    setState(() {
      value = it;
      // MyApp.setLanguage (it ? ThemeMode.dark: ThemeMode.light);
    });
  }
void _showLanguageChangeDialog() async{
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        ThemeData _theme = Theme.of(context);
        return AlertDialog(
          backgroundColor: _theme.scaffoldBackgroundColor,
          contentPadding: EdgeInsets.fromLTRB(10.0, 0,0,0),
          title: Center(child: Text('title.change_language'.tr(), style: _theme.textTheme.headline2,)),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Divider(),
                ListTile(
                  title: Text('English', style: _theme.textTheme.headline3,),
                  subtitle: Text('Select English as a main language',style: _theme.textTheme.headline4,),
                  dense: true,
                  onTap: (){
                    _updateUserProfile(context, 'ENG');
                    //MyApp.setLanguage(context, Locale('en'));
                  },
                ),
                Divider(),
                ListTile(
                  title: Text('Swahili',style: _theme.textTheme.headline3,),
                  subtitle: Text('Changua Kiswahili kama lugha yako ya msingi',style: _theme.textTheme.headline4,),
                  dense: true,
                  onTap: (){
                    _updateUserProfile(context, 'SWA');
                  //MyApp.setLanguage(context, Locale('sw'));
                  },
                ),

              ],
            ),
          ),
        );
      },
    );
  }

  Widget build(BuildContext context) {
  ThemeData _theme = Theme.of(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: _theme.appBarTheme.backgroundColor,
          title: Text('app_bar.settings'.tr(), style: _theme.textTheme.headline3,),
          elevation: 0.0,
        ),
        body: SettingsList(
          lightBackgroundColor: md_theme_light_background,
          darkBackgroundColor: md_theme_dark_background,
          sections: [
            SettingsSection(
              title: 'Common',
              tiles: [
                SettingsTile(
                  title: 'title.language'.tr(),
                  subtitle: 'subtitle.english'.tr(),
                  leading: Icon(Icons.translate_outlined),
                  trailing: Icon(Icons.chevron_right_sharp),
                  onPressed: (BuildContext context){
                    _showLanguageChangeDialog();
                  }
                ),
                SettingsTile(
                    title: 'title.change_password'.tr(),
                    subtitle: 'subtitle.change_password'.tr(),
                    leading: Icon(Icons.lock_outline_rounded),
                    trailing: Icon(Icons.chevron_right_sharp),
                    onPressed: (BuildContext context){
                      Navigator.push(context,    MaterialPageRoute(builder: (context) => new ScreenChangePassword()));
                    }
                ),

                /**SettingsTile.switchTile(
                  title: 'Change theme',
                  leading: Icon(Icons.light_mode_outlined),
                  switchValue: value,
                  onToggle: (bool value) {
                    _onFingerPrintSetting(value);
                  },
                ),
                **/

              ],
            ),
          ],
        )
    );
  }
  Future<void> _logout() async{
    SharedPreference sp = SharedPreference.getInstance();
    sp.clearSF();
  }
}

Future<void> _updateUserProfile(BuildContext context, String lang) async {
  SharedPreference sp = SharedPreference.getInstance();
  String _network = await sp.getStringValuesSF(currentUserEnum.NETWORK.toString());
  UserProfile _body = UserProfile.from( lang);
  final response = await Provider.of<PostApiService>(context, listen: false).updateUserProfile(_body);
  final int statusCode = response.statusCode;
  if (statusCode == 200) {
    MyApp.setLanguage(context, Locale(lang.substring(0, lang.length - 1).toLowerCase()));
  }
}