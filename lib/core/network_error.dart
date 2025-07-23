enum NetworkError {
  requestTimeout,
  unauthorized,
  notFound,
  serverError,
  unknown,
  parseError,
}

NetworkError statusCodeToError(int? statusCode) {
  switch (statusCode) {
    case 401:
      return NetworkError.unauthorized;
    case 404:
      return NetworkError.notFound;
    case 500:
    case 501:
    case 502:
    case 503:
      return NetworkError.serverError;
    default:
      return NetworkError.unknown;
  }
}