sealed class Result<S, F> {
  const Result();
}

final class Success<S, F> extends Result<S, F> {
  const Success(this.value);
  final S value;
}

final class Failure<S, F> extends Result<S, F> {
  const Failure(this.exception);
  final F exception;
}

// 오류 타입 (예시)
enum DataSourceException {
  networkError,
  serverError,
  invalidApiKey,
  emptyResponse,
  unknownError,
}