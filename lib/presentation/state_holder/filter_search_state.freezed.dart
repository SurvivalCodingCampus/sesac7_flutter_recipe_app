// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filter_search_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FilterSearchState {

 String get time; int get rate; String get category;
/// Create a copy of FilterSearchState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FilterSearchStateCopyWith<FilterSearchState> get copyWith => _$FilterSearchStateCopyWithImpl<FilterSearchState>(this as FilterSearchState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FilterSearchState&&(identical(other.time, time) || other.time == time)&&(identical(other.rate, rate) || other.rate == rate)&&(identical(other.category, category) || other.category == category));
}


@override
int get hashCode => Object.hash(runtimeType,time,rate,category);

@override
String toString() {
  return 'FilterSearchState(time: $time, rate: $rate, category: $category)';
}


}

/// @nodoc
abstract mixin class $FilterSearchStateCopyWith<$Res>  {
  factory $FilterSearchStateCopyWith(FilterSearchState value, $Res Function(FilterSearchState) _then) = _$FilterSearchStateCopyWithImpl;
@useResult
$Res call({
 String time, int rate, String category
});




}
/// @nodoc
class _$FilterSearchStateCopyWithImpl<$Res>
    implements $FilterSearchStateCopyWith<$Res> {
  _$FilterSearchStateCopyWithImpl(this._self, this._then);

  final FilterSearchState _self;
  final $Res Function(FilterSearchState) _then;

/// Create a copy of FilterSearchState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? time = null,Object? rate = null,Object? category = null,}) {
  return _then(_self.copyWith(
time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String,rate: null == rate ? _self.rate : rate // ignore: cast_nullable_to_non_nullable
as int,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [FilterSearchState].
extension FilterSearchStatePatterns on FilterSearchState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FilterSearchState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FilterSearchState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FilterSearchState value)  $default,){
final _that = this;
switch (_that) {
case _FilterSearchState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FilterSearchState value)?  $default,){
final _that = this;
switch (_that) {
case _FilterSearchState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String time,  int rate,  String category)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FilterSearchState() when $default != null:
return $default(_that.time,_that.rate,_that.category);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String time,  int rate,  String category)  $default,) {final _that = this;
switch (_that) {
case _FilterSearchState():
return $default(_that.time,_that.rate,_that.category);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String time,  int rate,  String category)?  $default,) {final _that = this;
switch (_that) {
case _FilterSearchState() when $default != null:
return $default(_that.time,_that.rate,_that.category);case _:
  return null;

}
}

}

/// @nodoc


class _FilterSearchState implements FilterSearchState {
  const _FilterSearchState({this.time = 'All', this.rate = 0, this.category = 'All'});
  

@override@JsonKey() final  String time;
@override@JsonKey() final  int rate;
@override@JsonKey() final  String category;

/// Create a copy of FilterSearchState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FilterSearchStateCopyWith<_FilterSearchState> get copyWith => __$FilterSearchStateCopyWithImpl<_FilterSearchState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FilterSearchState&&(identical(other.time, time) || other.time == time)&&(identical(other.rate, rate) || other.rate == rate)&&(identical(other.category, category) || other.category == category));
}


@override
int get hashCode => Object.hash(runtimeType,time,rate,category);

@override
String toString() {
  return 'FilterSearchState(time: $time, rate: $rate, category: $category)';
}


}

/// @nodoc
abstract mixin class _$FilterSearchStateCopyWith<$Res> implements $FilterSearchStateCopyWith<$Res> {
  factory _$FilterSearchStateCopyWith(_FilterSearchState value, $Res Function(_FilterSearchState) _then) = __$FilterSearchStateCopyWithImpl;
@override @useResult
$Res call({
 String time, int rate, String category
});




}
/// @nodoc
class __$FilterSearchStateCopyWithImpl<$Res>
    implements _$FilterSearchStateCopyWith<$Res> {
  __$FilterSearchStateCopyWithImpl(this._self, this._then);

  final _FilterSearchState _self;
  final $Res Function(_FilterSearchState) _then;

/// Create a copy of FilterSearchState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? time = null,Object? rate = null,Object? category = null,}) {
  return _then(_FilterSearchState(
time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String,rate: null == rate ? _self.rate : rate // ignore: cast_nullable_to_non_nullable
as int,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
