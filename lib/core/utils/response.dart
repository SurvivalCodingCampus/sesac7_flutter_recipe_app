class Response<T> {
  final int statusCode;
  final Map<String, String> headers;
  final T body;

  Response({
    required this.statusCode,
    required this.headers,
    required this.body,
  });
}
