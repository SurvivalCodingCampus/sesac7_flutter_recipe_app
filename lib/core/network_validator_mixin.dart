import 'package:flutter_recipe_app/core/network_error.dart';

mixin class NetworkValidatorMixin {
  NetworkError? checkStatusCodeError(int code) {
    switch (code) {
      case >= 200 && < 300:
        return null;
      case 401:
        return NetworkError.unauthorized;
      case 404:
        return NetworkError.notFound;
      case >= 500 && < 600:
        return NetworkError.serverError;
      default:
        return NetworkError.unknown;
    }
  }
}
