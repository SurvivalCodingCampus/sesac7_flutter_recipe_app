class Response<T> {
  // 응답은 여러가지 정보(status code, header, body)를 담고 있어서 여러개의 필드를 만들어 사용한다
  // 네트워크 응답을 보다 명확하게 다루기 위해서
  // 제네릭 타입(여러가지 타입을 받을 수 있는 클래스나 함수)
  // 구조가 명확함: 분리된 필드로 가독성이 높음
  // 다양한 API 응답에 같은 구조로 사용 가능
  // 깔끔하게 추상화하여 전달 가능

  final int statusCode;
  final Map<String, String> header;
  final T body;

  const Response({
    required this.statusCode,
    required this.header,
    required this.body,
  });

  @override
  String toString() {
    return 'Response{statusCode: $statusCode, header: $header, body: $body}';
  }
}
