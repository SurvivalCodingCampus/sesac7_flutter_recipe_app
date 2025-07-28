enum NetworkError {
  requestTimeout('Request Timeout'), // 408
  unauthorized('Unauthorized'), // 401
  notFound('Not Found'), // 404
  serverError('Server Error'), // 500~600
  unKnown('UnKnown Error'), //
  jsonParsingError('Json Parsing Error');

  final String message;

  const NetworkError(this.message);
}

extension StatusCodeToNetworkErrorType on int {
  NetworkError? statusCodeToNetworkErrorType() {
    if (this >= 200 && this < 300) {
      return null;
    } else if (this >= 400 && this < 500) {
      switch (this) {
        case 401:
          return NetworkError.unauthorized;
        case 404:
          return NetworkError.notFound;
        case 408:
          return NetworkError.requestTimeout;
        default:
          return NetworkError.unKnown;
      }
    } else if (this >= 500 && this < 600) {
      return NetworkError.serverError;
    } else {
      return NetworkError.unKnown;
    }
  }
}
