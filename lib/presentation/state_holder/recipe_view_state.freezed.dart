// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe_view_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RecipeViewState {

 List<Recipe> get recipes; bool get isLoading;
/// Create a copy of RecipeViewState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecipeViewStateCopyWith<RecipeViewState> get copyWith => _$RecipeViewStateCopyWithImpl<RecipeViewState>(this as RecipeViewState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecipeViewState&&const DeepCollectionEquality().equals(other.recipes, recipes)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(recipes),isLoading);

@override
String toString() {
  return 'RecipeViewState(recipes: $recipes, isLoading: $isLoading)';
}


}

/// @nodoc
abstract mixin class $RecipeViewStateCopyWith<$Res>  {
  factory $RecipeViewStateCopyWith(RecipeViewState value, $Res Function(RecipeViewState) _then) = _$RecipeViewStateCopyWithImpl;
@useResult
$Res call({
 List<Recipe> recipes, bool isLoading
});




}
/// @nodoc
class _$RecipeViewStateCopyWithImpl<$Res>
    implements $RecipeViewStateCopyWith<$Res> {
  _$RecipeViewStateCopyWithImpl(this._self, this._then);

  final RecipeViewState _self;
  final $Res Function(RecipeViewState) _then;

/// Create a copy of RecipeViewState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? recipes = null,Object? isLoading = null,}) {
  return _then(_self.copyWith(
recipes: null == recipes ? _self.recipes : recipes // ignore: cast_nullable_to_non_nullable
as List<Recipe>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [RecipeViewState].
extension RecipeViewStatePatterns on RecipeViewState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecipeViewState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecipeViewState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecipeViewState value)  $default,){
final _that = this;
switch (_that) {
case _RecipeViewState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecipeViewState value)?  $default,){
final _that = this;
switch (_that) {
case _RecipeViewState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Recipe> recipes,  bool isLoading)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecipeViewState() when $default != null:
return $default(_that.recipes,_that.isLoading);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Recipe> recipes,  bool isLoading)  $default,) {final _that = this;
switch (_that) {
case _RecipeViewState():
return $default(_that.recipes,_that.isLoading);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Recipe> recipes,  bool isLoading)?  $default,) {final _that = this;
switch (_that) {
case _RecipeViewState() when $default != null:
return $default(_that.recipes,_that.isLoading);case _:
  return null;

}
}

}

/// @nodoc


class _RecipeViewState implements RecipeViewState {
  const _RecipeViewState({final  List<Recipe> recipes = const [], this.isLoading = false}): _recipes = recipes;
  

 final  List<Recipe> _recipes;
@override@JsonKey() List<Recipe> get recipes {
  if (_recipes is EqualUnmodifiableListView) return _recipes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recipes);
}

@override@JsonKey() final  bool isLoading;

/// Create a copy of RecipeViewState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecipeViewStateCopyWith<_RecipeViewState> get copyWith => __$RecipeViewStateCopyWithImpl<_RecipeViewState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecipeViewState&&const DeepCollectionEquality().equals(other._recipes, _recipes)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_recipes),isLoading);

@override
String toString() {
  return 'RecipeViewState(recipes: $recipes, isLoading: $isLoading)';
}


}

/// @nodoc
abstract mixin class _$RecipeViewStateCopyWith<$Res> implements $RecipeViewStateCopyWith<$Res> {
  factory _$RecipeViewStateCopyWith(_RecipeViewState value, $Res Function(_RecipeViewState) _then) = __$RecipeViewStateCopyWithImpl;
@override @useResult
$Res call({
 List<Recipe> recipes, bool isLoading
});




}
/// @nodoc
class __$RecipeViewStateCopyWithImpl<$Res>
    implements _$RecipeViewStateCopyWith<$Res> {
  __$RecipeViewStateCopyWithImpl(this._self, this._then);

  final _RecipeViewState _self;
  final $Res Function(_RecipeViewState) _then;

/// Create a copy of RecipeViewState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? recipes = null,Object? isLoading = null,}) {
  return _then(_RecipeViewState(
recipes: null == recipes ? _self._recipes : recipes // ignore: cast_nullable_to_non_nullable
as List<Recipe>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
