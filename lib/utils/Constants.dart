import 'dart:ui';

class Constants{
  static const Color clr_purple = const Color(0xFF9C27B0);
  static const Color clr_blue = const Color(0xFF001942);
  static const Color clr_red = const Color(0xFFF44336);
  static const Color clr_orange = const Color(0xFFFF682D);
  static const Color clr_light_grey = const Color(0xAAD3D3D3);

  static String isOnBoard= "IS_ONBOARD";
  static String isLoggedIn= "IS_LOGGED_IN";
  //Validations REGEX
  static final String emailPattern = "^([0-9a-zA-Z]([-.+\\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\\w]*[0-9a-zA-Z]\\.)+[a-zA-Z]{2,9})\$";

  static const BASE_URL = "http://155.12.30.14:9002/epark";
}