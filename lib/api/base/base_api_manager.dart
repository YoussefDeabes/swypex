import 'dart:io';

import 'package:dio/dio.dart';
import 'package:swypex/api/api_keys.dart';
import 'package:swypex/api/models/base/details_api_model.dart';
import 'package:swypex/prefs/pref_manager.dart';
import 'package:swypex/util/general.dart';

class BaseApi extends BaseOptions {
  static String? accessToken;
  static String? langKey;

  static Dio get dio {
    if (isDebugMode()) {
      return _dioInstance()
        ..interceptors.add(
            LogInterceptor(responseBody: true, requestBody: true, error: true));
    } else {
      return _dioInstance();
    }
  }

  static Future<void> updateHeader() async {
    accessToken = await PrefManager.getToken();
    langKey = await PrefManager.getLang();
  }

  static Dio _dioInstance() {
    return Dio(BaseApi());
  }

  @override
  Map<String, dynamic> get headers {
    Map<String, dynamic> header = {};
    header.putIfAbsent(ApiKeys.accept, () => ApiKeys.applicationJson);
    header.putIfAbsent(
        ApiKeys.authorization, () => '${ApiKeys.keyBearer} $accessToken');
    header.putIfAbsent(ApiKeys.locale, () => langKey ?? 'en');
    return header;
  }

  @override
  String get contentType => super.contentType!;

  @override
  String get baseUrl => ApiKeys.baseUrl;

  static DetailsApiModel checkErrorType(Object error) {
    if (error is HttpException) {
      return DetailsApiModel.getHttpException(error);
    } else if (error is SocketException) {
      return DetailsApiModel.getSocketError(error);
    } else if (error is TypeError) {
      return DetailsApiModel.getTypeError(error);
    } else if (error is NoSuchMethodError) {
      return DetailsApiModel.getNoSuchMethodError();
    } else {
      return DetailsApiModel.getUnknownError();
    }
  }
}
