class Response {
  final int statusCode;
  final Map<String, String> headers;
  final String body;

  Response({
    required this.statusCode,
    required this.headers,
    required this.body,
  });
}
