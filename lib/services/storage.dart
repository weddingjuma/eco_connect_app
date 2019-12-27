  
import 'package:shared_preferences/shared_preferences.dart';

class Storage {

  static Future<bool> savetoken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
    return prefs.commit();
  }

  static Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String data = prefs.getString('token');
    return data;
  }


}