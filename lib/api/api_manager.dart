import 'package:swypex/api/api_keys.dart';
import 'package:swypex/api/base/base_api_manager.dart';
import 'package:swypex/api/errors/network_exceptions.dart';
import 'package:swypex/api/models/base/details_api_model.dart';
import 'package:swypex/api/models/movies/MoviesList.dart';
import 'package:swypex/api/models/movies/MoviesList.dart';

class ApiManager {
  static Future<void> moviesListApi(
      int pageNumber,
      void Function(MoviesList) success,
      void Function(NetworkExceptions) fail) async {
    await BaseApi.updateHeader();
    await BaseApi.dio
        .get(ApiKeys.discoverWithQueryUrl(pageNumber))
        .then((response) {
      Map<String, dynamic> extractedData =
          response.data as Map<String, dynamic>;
      MoviesList wrapper = MoviesList.fromJson(extractedData);
      if (response.statusCode == 200) {
        success(wrapper);
      } else {
        NetworkExceptions details = NetworkExceptions.fromJson(response.data);
        fail(details);
      }
    }).catchError((onError) {
      fail(NetworkExceptions.getDioException(onError));
    });
  }
}
