import 'package:swypex/prefs/pref_manager.dart';

class ApiKeys {
  /// Headers

  static Future<Map<String, String>> getHeaders() async {
    return {
      accept: applicationJson,
      locale: (await PrefManager.getLang() ?? "en")
    };
  }

  /// Keys
  static const authorization = "Authorization";
  static const accept = "Accept";
  static const applicationJson = "application/json";
  static const locale = "X-LOCALE";
  static const keyBearer = "Bearer";

  /// URLs
  static const baseUrl = 'https://api.themoviedb.org';
  static const baseApiUrl = '$baseUrl/3';

  static const discoverUrl =
      "$baseApiUrl/movie/popular?api_key=521ba0e90a4812223258ac9c62c75f94";
  static const baseImageUrl = "https://image.tmdb.org/t/p/w500/";

  static String discoverWithQueryUrl(int pageNum) {
    String discoverQueryUrl = "$discoverUrl&page=$pageNum";
    return discoverQueryUrl;
  }
}
