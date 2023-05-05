import 'package:shared_preferences/shared_preferences.dart';

class LocalDB{
  static final uidkey = "nigeagfogwwab";
  static final lKey = "iiawbbuevbndmvbds";
  static final mKey = "huiuigpauwe";
  static final rKey = "bhuavbkhvbhdsv";
  static final nKey = "huewahjkbvndmbvh";
  static final pKey = "niueiaghjbvnmdb";


  static Future<bool> saveUserId(String uid) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(uidkey, uid);
  }

  //gets uid of user
  static Future<String?> getUserId() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(uidkey);
  }

  static Future<bool> saveMoney(String money) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(mKey, money);
  }

  //gets uid of user
  static Future<String?> getMoney() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(mKey);
  }

  static Future<bool> saveName(String name) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(nKey, name);
  }

  //gets uid of user
  static Future<String?> getName() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(nKey);
  }

  static Future<bool> saveUrl(String profileUrl) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(uidkey, profileUrl);
  }

  //gets uid of user
  static Future<String?> getUrl() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(pKey);
  }

  static Future<bool> saveLevel(String level) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(uidkey, level);
  }

  //gets uid of user
  static Future<String?> getLevel() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(lKey);
  }

  static Future<bool> saveRank(String rank) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(uidkey, rank);
  }

  //gets uid of user
  static Future<String?> getRank() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(rKey);
  }
}