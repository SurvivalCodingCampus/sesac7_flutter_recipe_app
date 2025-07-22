sealed class Result<S, F> {
  const Result();
}

final class Success<S, F> extends Result<S, F> {
  const Success({required this.value});
  final S value;
}

final class Failure<S, F> extends Result<S, F> {
  const Failure({required this.exception});
  final F exception;
}