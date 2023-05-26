import 'package:shared_preferences/shared_preferences.dart';

class LocalDB{
  static const uidkey = "";
  static const lKey = "iiawbbuevbndmvbds";
  static const mKey = "huiuigpauwe";
  static const rKey = "bhuavbkhvbhdsv";
  static const nKey = "huewahjkbvndmbvh";
  static const pKey = "niueiaghjbvnmdb";
  static const audKey = "baeoabhfeiuubv";
  static const jKey = "nshjkwmvivn";
  static const ddKey = "awkehfanekvjsv";
  static const expKey = "amicohweibsmvdsmv";


  static Future<bool> saveUserId(String uid) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(uidkey, uid);
  }

  //gets uid of user
  static Future<String?> getUserId() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(uidkey);
  }

  static Future<bool> saveMoney(String money) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(mKey, money);
  }

  //gets money of user
  static Future<String?> getMoney() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(mKey);
  }

  static Future<bool> saveName(String name) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(nKey, name);
  }

  //gets name of user
  static Future<String?> getName() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(nKey);
  }

  static Future<bool> saveUrl(String profileUrl) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(pKey, profileUrl);
  }

  //gets URL of user
  static Future<String?> getUrl() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(pKey);
  }

  static Future<bool> saveLevel(String level) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(lKey, level);
  }

  //gets level of user
  static Future<String?> getLevel() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(lKey);
  }

  static Future<bool> saveRank(String rank) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(rKey, rank);
  }

  //gets rank of user
  static Future<String?> getRank() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(rKey);
  }

  static Future<bool> saveAudPoll(bool isAvailable) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setBool(audKey, isAvailable);
  }

  static Future<bool?> getAudPoll() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool(audKey);
  }

  static Future<bool> saveJoker(bool isAvailable) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setBool(jKey, isAvailable);
  }

  static Future<bool?> getJoker() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool(jKey);
  }

  static Future<bool> save50(bool isAvailable) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setBool(ddKey, isAvailable);
  }

  static Future<bool?> get50() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool(ddKey);
  }

  static Future<bool> saveExp(bool isAvailable) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setBool(expKey, isAvailable);
  }

  static Future<bool?> getExp() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool(expKey);
  }
}