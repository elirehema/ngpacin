import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:mobile/data/post_api_service.dart';
import 'package:mobile/screens/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/utils/navigation_service.dart';
import 'package:mobile/utils/theme_class.dart';
import 'package:provider/provider.dart';
import 'package:logging/logging.dart';
import 'package:easy_localization/easy_localization.dart';

class Routes {
  Routes(){
    _setupLogging();
    FlutterError.onError = (FlutterErrorDetails details) {
      FlutterError.dumpErrorToConsole(details);
      if (kReleaseMode)
        exit(1);
    };
    runApp(
      EasyLocalization(
          supportedLocales: [Locale('en'), Locale('sw')],
          path: 'assets/translations', // <-- change the path of the translation files
          fallbackLocale: Locale('en'),
          useOnlyLangCode: true,
          child:  MyApp()
      ),
    );

  }
}


void _setupLogging(){
  Logger.root.level  = Level.ALL;
  Logger.root.onRecord.listen((rec){
    print('${rec.level.name}: ${rec.time} : ${rec.message}');
  });
}



class MyApp extends StatefulWidget {


  @override
  _MyAppState createState()=>_MyAppState();
}
class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.system;
  final routes = <String, WidgetBuilder>{
      '/scanner': (context) => ScannerScreen(),
      '/signup': (BuildContext context) => ScreenSignUp(),
      '/welcome': (BuildContext context) => ScreenWelcome(),
    };

  void changeTheme(ThemeMode themeMode){
    setState(() {
      _themeMode =  themeMode;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Provider(
        create:(_) => PostApiService.create() ,
        dispose: (_, PostApiService service) => service.client.dispose(),
        child:  MaterialApp(
          navigatorKey: NavigationService.instance.navigationKey,
          theme: ThemeClass.lightTheme,
          darkTheme: ThemeClass.darkTheme,
          themeMode: _themeMode,
          debugShowCheckedModeBanner: false,
          routes: routes,
          title: 'EgScanner',
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          home: SplashScreen(),
        )
    );
  }

}