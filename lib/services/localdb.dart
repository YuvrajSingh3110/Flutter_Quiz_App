import 'package:shared_preferences/shared_preferences.dart';

class LocalDB{
  static final uidkey = "nigeagfogwwab";
  static Future<bool> saveUserId(String uid) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(uidkey, uid);
  }

  //gets uid of user
  static Future<String?> getUserId() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(uidkey);
  }
}