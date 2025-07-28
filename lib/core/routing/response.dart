class Response<T> {
  final int statusCode;
  final Map<String, String> header;
  final T body;

  const Response({
    required this.statusCode,
    required this.header,
    required this.body,
  });
}