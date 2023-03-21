import 'dart:io';

class DetailsApiModel {
  int? code;
  final String? message;
  final bool status;

  DetailsApiModel(this.code, this.message, this.status);

  DetailsApiModel.fromJson(Map<String, dynamic> json)
      : message = json['status_message'] as String,
        status = json['success'] as bool,
        code = json['status_code'] as int;

  static DetailsApiModel getJsonMessage() {
    return DetailsApiModel(6001, "Json Parse Exception", false);
  }

  static DetailsApiModel getHttpException(HttpException error) {
    return DetailsApiModel(6002, error.message, false);
  }

  static DetailsApiModel getDecodeError() {
    return DetailsApiModel(
        6003, "Json Decode Error ... Api may be not send Json", false);
  }

  static DetailsApiModel getNoSuchMethodError() {
    return DetailsApiModel(
        6003, "You have Error ... your request may be not send Json", false);
  }

  static DetailsApiModel getUnknownError() {
    return DetailsApiModel(6004, "Unknown Error", false);
  }

  static DetailsApiModel getTypeError(TypeError error) {
    return getJsonMessage();
  }

  static DetailsApiModel getSocketError(SocketException exception) {
    if (exception.osError!.errorCode == 7) {
      return DetailsApiModel(6016, exception.message, false);
    }
    return DetailsApiModel(6005, exception.message, false);
  }
}

/// reference
/// https://flutter.dev/docs/development/data-and-backend/json
/// https://www.raywenderlich.com/4038868-parsing-json-in-flutter
