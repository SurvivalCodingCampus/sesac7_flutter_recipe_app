// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filter_holder_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FilterHolderInfo {

 bool get isSelected; String get itemName;
/// Create a copy of FilterHolderInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FilterHolderInfoCopyWith<FilterHolderInfo> get copyWith => _$FilterHolderInfoCopyWithImpl<FilterHolderInfo>(this as FilterHolderInfo, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FilterHolderInfo&&(identical(other.isSelected, isSelected) || other.isSelected == isSelected)&&(identical(other.itemName, itemName) || other.itemName == itemName));
}


@override
int get hashCode => Object.hash(runtimeType,isSelected,itemName);

@override
String toString() {
  return 'FilterHolderInfo(isSelected: $isSelected, itemName: $itemName)';
}


}

/// @nodoc
abstract mixin class $FilterHolderInfoCopyWith<$Res>  {
  factory $FilterHolderInfoCopyWith(FilterHolderInfo value, $Res Function(FilterHolderInfo) _then) = _$FilterHolderInfoCopyWithImpl;
@useResult
$Res call({
 bool isSelected, String itemName
});




}
/// @nodoc
class _$FilterHolderInfoCopyWithImpl<$Res>
    implements $FilterHolderInfoCopyWith<$Res> {
  _$FilterHolderInfoCopyWithImpl(this._self, this._then);

  final FilterHolderInfo _self;
  final $Res Function(FilterHolderInfo) _then;

/// Create a copy of FilterHolderInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isSelected = null,Object? itemName = null,}) {
  return _then(_self.copyWith(
isSelected: null == isSelected ? _self.isSelected : isSelected // ignore: cast_nullable_to_non_nullable
as bool,itemName: null == itemName ? _self.itemName : itemName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [FilterHolderInfo].
extension FilterHolderInfoPatterns on FilterHolderInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FilterHolderInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FilterHolderInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FilterHolderInfo value)  $default,){
final _that = this;
switch (_that) {
case _FilterHolderInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FilterHolderInfo value)?  $default,){
final _that = this;
switch (_that) {
case _FilterHolderInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isSelected,  String itemName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FilterHolderInfo() when $default != null:
return $default(_that.isSelected,_that.itemName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isSelected,  String itemName)  $default,) {final _that = this;
switch (_that) {
case _FilterHolderInfo():
return $default(_that.isSelected,_that.itemName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isSelected,  String itemName)?  $default,) {final _that = this;
switch (_that) {
case _FilterHolderInfo() when $default != null:
return $default(_that.isSelected,_that.itemName);case _:
  return null;

}
}

}

/// @nodoc


class _FilterHolderInfo implements FilterHolderInfo {
  const _FilterHolderInfo({this.isSelected = false, required this.itemName});
  

@override@JsonKey() final  bool isSelected;
@override final  String itemName;

/// Create a copy of FilterHolderInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FilterHolderInfoCopyWith<_FilterHolderInfo> get copyWith => __$FilterHolderInfoCopyWithImpl<_FilterHolderInfo>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FilterHolderInfo&&(identical(other.isSelected, isSelected) || other.isSelected == isSelected)&&(identical(other.itemName, itemName) || other.itemName == itemName));
}


@override
int get hashCode => Object.hash(runtimeType,isSelected,itemName);

@override
String toString() {
  return 'FilterHolderInfo(isSelected: $isSelected, itemName: $itemName)';
}


}

/// @nodoc
abstract mixin class _$FilterHolderInfoCopyWith<$Res> implements $FilterHolderInfoCopyWith<$Res> {
  factory _$FilterHolderInfoCopyWith(_FilterHolderInfo value, $Res Function(_FilterHolderInfo) _then) = __$FilterHolderInfoCopyWithImpl;
@override @useResult
$Res call({
 bool isSelected, String itemName
});




}
/// @nodoc
class __$FilterHolderInfoCopyWithImpl<$Res>
    implements _$FilterHolderInfoCopyWith<$Res> {
  __$FilterHolderInfoCopyWithImpl(this._self, this._then);

  final _FilterHolderInfo _self;
  final $Res Function(_FilterHolderInfo) _then;

/// Create a copy of FilterHolderInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isSelected = null,Object? itemName = null,}) {
  return _then(_FilterHolderInfo(
isSelected: null == isSelected ? _self.isSelected : isSelected // ignore: cast_nullable_to_non_nullable
as bool,itemName: null == itemName ? _self.itemName : itemName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
