import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  /// PUT DATA
  static Future<bool?> putBoolean(
      {required String key, required bool value}) async {
    return await sharedPreferences?.setBool(key, value);
  }

/// GET DATA
  static dynamic getData({required String key}) {
    return sharedPreferences?.get(key);
  }

  /// SAVING DATA
  static Future<bool?> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) {return await sharedPreferences?.setString(key, value);}
    if (value is int) {return await sharedPreferences?.setInt(key, value);}
    if (value is bool) {return await sharedPreferences?.setBool(key, value);}

    return await sharedPreferences?.setDouble(key, value);
  }


  /// REMOVE DATA
  static Future<bool?> removeData({ required String key,})async{
    return await sharedPreferences?.remove(key);
  }
}
