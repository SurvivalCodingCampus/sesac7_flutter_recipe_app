// 요구사항: Freezed를 사용해서 Result<T, E> 클래스를 만드세요
// Success와 Error 케이스를 가져야 함
// JSON 직렬화 불필요

import 'package:freezed_annotation/freezed_annotation.dart';
part 'result.freezed.dart';

@freezed
sealed class Result<T, E> with _$Result<T, E> {
  const factory Result.success(T value) = Success<T, E>;
  const factory Result.failure(E error) = Failure<T, E>;
}

// @freezed
// sealed class Result<T> with _$Result<T> {
//   const factory Result.success(T value) = Success;
//   const factory Result.failure(String message) = Failure;
// }
