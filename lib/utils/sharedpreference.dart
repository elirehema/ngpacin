import 'package:shared_preferences/shared_preferences.dart';

import 'navigation_service.dart';

enum enumKey {
  IS_LOGGED_IN,
  BASE_64_EncodedAuthenticationKey,
  HAS_ACCEPTED_TERMS_AND_CONDITIONS,
  HAS_READ_WHAT_IS_MKOBA,
  TOKEN_REQUIRED
}
enum  currentUserEnum{
   LANGUAGE, NETWORK, M_SSD_IN
}
enum securityEnum{
  USERNAME, PASSWORD, PASSCODE
}

enum tokenEnum{
  TOKEN_MSISDN
}

class SharedPreference {
  late SharedPreferences prefs;
  static final _instance = SharedPreference._internal();

  SharedPreference._internal();

  static SharedPreference getInstance() {
    return _instance;
  }


  setStringToSF(String key, String value) async {
    prefs = await SharedPreferences.getInstance();
    return await prefs.setString(key, value);
  }

  Future<bool> setIntToSF(String key, int value) async {
    prefs = await SharedPreferences.getInstance();
    return await prefs.setInt(key, value);
  }

  setDoubleToSF(String key, double value) async {
    prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(key, value);
  }

  Future<void> setBooleanToSF(String key, bool value) async {
    prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
  }

  setStringList(String key, List<String> value) async {
    prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(key, value);
  }

  Future<String> getStringValuesSF(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.reload();
    return prefs.getString(key).toString();
  }


  Future<bool?> getBoolValuesSF(String key) async {
    prefs = await SharedPreferences.getInstance();
    prefs.reload();
    return prefs.getBool(key);
   
  }

  Future<bool> clearSF() async {
    prefs = await SharedPreferences.getInstance();
    NavigationService.instance.navigateTo("/login");
    return prefs.clear();
  }
  /**
  getIntValuesSF(String key) async {
    int intValue = await getSp().getInt(key);
    return intValue;
  }

  getDoubleValuesSF(String key) async {
    double doubleValue = await getSp().getDouble(key);
    return doubleValue;
  }

  deleteValueSF(String key) async {
    return await getSp().remove(key);
  }
   **/

  contain(String key) async{
    prefs = await SharedPreferences.getInstance();
    return  prefs.containsKey(key);
  }

}
