import 'package:flutter_recipe_app/core/network_error.dart';
import 'package:flutter_recipe_app/core/result.dart';
import 'package:flutter_recipe_app/core/response.dart';

Result<D, NetworkError> handleResponse<D, TBody>(
    Response<TBody> response,
    D Function(TBody body) dataMapper,
    ) {
  final int statusCode = response.statusCode;

  if (statusCode >= 200 && statusCode < 300) {
    try {
      final D data = dataMapper(response.body);
      return Result.success(data);
    } catch (e) {
      return Result.error(NetworkError.parseError);
    }
  } else {
    switch (statusCode) {
      case 401:
        return Result.error(NetworkError.unauthorized);
      case 404:
        return Result.error(NetworkError.notFound);
      case 504:
        return Result.error(NetworkError.requestTimeout);
      case int code when code >= 500 && code < 600:
        return Result.error(NetworkError.serverError);
      default:
        return Result.error(NetworkError.unknown);
    }
  }
}

Result<D, NetworkError> handleRepositoryException<D>(dynamic error) {
  if (error is FormatException) {
    return Result.error(NetworkError.parseError);
  }
  return Result.error(NetworkError.unknown);
}