class Response {
  final int statusCode;
  final Map<String, String> header;
  final String body;

  const Response({
    required this.statusCode,
    required this.header,
    required this.body,
  });
}