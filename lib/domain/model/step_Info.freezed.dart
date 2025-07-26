// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'step_Info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StepInfo {

 int get stepNumber; String get description;
/// Create a copy of StepInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StepInfoCopyWith<StepInfo> get copyWith => _$StepInfoCopyWithImpl<StepInfo>(this as StepInfo, _$identity);

  /// Serializes this StepInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StepInfo&&(identical(other.stepNumber, stepNumber) || other.stepNumber == stepNumber)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,stepNumber,description);

@override
String toString() {
  return 'StepInfo(stepNumber: $stepNumber, description: $description)';
}


}

/// @nodoc
abstract mixin class $StepInfoCopyWith<$Res>  {
  factory $StepInfoCopyWith(StepInfo value, $Res Function(StepInfo) _then) = _$StepInfoCopyWithImpl;
@useResult
$Res call({
 int stepNumber, String description
});




}
/// @nodoc
class _$StepInfoCopyWithImpl<$Res>
    implements $StepInfoCopyWith<$Res> {
  _$StepInfoCopyWithImpl(this._self, this._then);

  final StepInfo _self;
  final $Res Function(StepInfo) _then;

/// Create a copy of StepInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? stepNumber = null,Object? description = null,}) {
  return _then(_self.copyWith(
stepNumber: null == stepNumber ? _self.stepNumber : stepNumber // ignore: cast_nullable_to_non_nullable
as int,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [StepInfo].
extension StepInfoPatterns on StepInfo {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StepInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StepInfo() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StepInfo value)  $default,){
final _that = this;
switch (_that) {
case _StepInfo():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StepInfo value)?  $default,){
final _that = this;
switch (_that) {
case _StepInfo() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int stepNumber,  String description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StepInfo() when $default != null:
return $default(_that.stepNumber,_that.description);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int stepNumber,  String description)  $default,) {final _that = this;
switch (_that) {
case _StepInfo():
return $default(_that.stepNumber,_that.description);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int stepNumber,  String description)?  $default,) {final _that = this;
switch (_that) {
case _StepInfo() when $default != null:
return $default(_that.stepNumber,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StepInfo implements StepInfo {
  const _StepInfo({required this.stepNumber, required this.description});
  factory _StepInfo.fromJson(Map<String, dynamic> json) => _$StepInfoFromJson(json);

@override final  int stepNumber;
@override final  String description;

/// Create a copy of StepInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StepInfoCopyWith<_StepInfo> get copyWith => __$StepInfoCopyWithImpl<_StepInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StepInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StepInfo&&(identical(other.stepNumber, stepNumber) || other.stepNumber == stepNumber)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,stepNumber,description);

@override
String toString() {
  return 'StepInfo(stepNumber: $stepNumber, description: $description)';
}


}

/// @nodoc
abstract mixin class _$StepInfoCopyWith<$Res> implements $StepInfoCopyWith<$Res> {
  factory _$StepInfoCopyWith(_StepInfo value, $Res Function(_StepInfo) _then) = __$StepInfoCopyWithImpl;
@override @useResult
$Res call({
 int stepNumber, String description
});




}
/// @nodoc
class __$StepInfoCopyWithImpl<$Res>
    implements _$StepInfoCopyWith<$Res> {
  __$StepInfoCopyWithImpl(this._self, this._then);

  final _StepInfo _self;
  final $Res Function(_StepInfo) _then;

/// Create a copy of StepInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? stepNumber = null,Object? description = null,}) {
  return _then(_StepInfo(
stepNumber: null == stepNumber ? _self.stepNumber : stepNumber // ignore: cast_nullable_to_non_nullable
as int,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
