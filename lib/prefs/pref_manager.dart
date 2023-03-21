import 'package:swypex/prefs/pref_keys.dart';
import 'package:swypex/prefs/pref_util.dart';

class PrefManager {
  static Future<bool> setLang(String? data) async {
    return await PrefUtils.setString(PrefKeys.lang, data!);
  }

  static Future<String?> getLang() async {
    return await PrefUtils.getString(PrefKeys.lang);
  }

  static Future<void> setToken(String? data) async {
    await PrefUtils.setString(PrefKeys.token, data!);
  }

  static Future<String?> getToken() async {
    return await PrefUtils.getString(PrefKeys.token);
  }

  static Future<void> setSearchHistory(List<String> data) async {
    await PrefUtils.setStringsList(PrefKeys.searchHistory, data);
  }

  static Future<List<String>> getSearchHistory() async {
    return await PrefUtils.getStringsList(PrefKeys.searchHistory);
  }

  static Future<void> clearAllData() async {
    await PrefUtils.clearData();
  }
}
