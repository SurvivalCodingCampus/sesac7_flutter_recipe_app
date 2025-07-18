class ApiResponse<T> {
  final T? data; // 성공 시 데이터 (nullable)
  final String? errorMessage; // 실패 시 에러 메시지 (nullable)
  final int? statusCode; // HTTP 상태 코드 (선택 사항)

  // 성공 응답을 생성하는 팩토리 생성자
  ApiResponse.success({required this.data, this.statusCode})
      : errorMessage = null;

  // 실패 응답을 생성하는 팩토리 생성자
  ApiResponse.failure({required this.errorMessage, this.statusCode, this.data})
      : assert(errorMessage != null || data != null); // 에러 메시지 또는 데이터 둘 중 하나는 있어야 함

  // 응답이 성공했는지 여부를 반환
  bool get isSuccess => data != null && errorMessage == null;

  // 응답이 실패했는지 여부를 반환
  bool get isFailure => !isSuccess;

  @override
  String toString() {
    if (isSuccess) {
      return 'ApiResponse.success(data: $data, statusCode: $statusCode)';
    } else {
      return 'ApiResponse.failure(errorMessage: $errorMessage, statusCode: $statusCode, data: $data)';
    }
  }
}