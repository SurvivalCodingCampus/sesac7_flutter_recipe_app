// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main_screen_action.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MainScreenAction {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MainScreenAction);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MainScreenAction()';
}


}

/// @nodoc
class $MainScreenActionCopyWith<$Res>  {
$MainScreenActionCopyWith(MainScreenAction _, $Res Function(MainScreenAction) __);
}


/// Adds pattern-matching-related methods to [MainScreenAction].
extension MainScreenActionPatterns on MainScreenAction {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SelectCategory value)?  onSelectCategory,TResult Function( ToggleFavorite value)?  onToggleFavorite,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SelectCategory() when onSelectCategory != null:
return onSelectCategory(_that);case ToggleFavorite() when onToggleFavorite != null:
return onToggleFavorite(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SelectCategory value)  onSelectCategory,required TResult Function( ToggleFavorite value)  onToggleFavorite,}){
final _that = this;
switch (_that) {
case SelectCategory():
return onSelectCategory(_that);case ToggleFavorite():
return onToggleFavorite(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SelectCategory value)?  onSelectCategory,TResult? Function( ToggleFavorite value)?  onToggleFavorite,}){
final _that = this;
switch (_that) {
case SelectCategory() when onSelectCategory != null:
return onSelectCategory(_that);case ToggleFavorite() when onToggleFavorite != null:
return onToggleFavorite(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String category)?  onSelectCategory,TResult Function( Recipe recipe)?  onToggleFavorite,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SelectCategory() when onSelectCategory != null:
return onSelectCategory(_that.category);case ToggleFavorite() when onToggleFavorite != null:
return onToggleFavorite(_that.recipe);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String category)  onSelectCategory,required TResult Function( Recipe recipe)  onToggleFavorite,}) {final _that = this;
switch (_that) {
case SelectCategory():
return onSelectCategory(_that.category);case ToggleFavorite():
return onToggleFavorite(_that.recipe);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String category)?  onSelectCategory,TResult? Function( Recipe recipe)?  onToggleFavorite,}) {final _that = this;
switch (_that) {
case SelectCategory() when onSelectCategory != null:
return onSelectCategory(_that.category);case ToggleFavorite() when onToggleFavorite != null:
return onToggleFavorite(_that.recipe);case _:
  return null;

}
}

}

/// @nodoc


class SelectCategory implements MainScreenAction {
  const SelectCategory(this.category);
  

 final  String category;

/// Create a copy of MainScreenAction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SelectCategoryCopyWith<SelectCategory> get copyWith => _$SelectCategoryCopyWithImpl<SelectCategory>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SelectCategory&&(identical(other.category, category) || other.category == category));
}


@override
int get hashCode => Object.hash(runtimeType,category);

@override
String toString() {
  return 'MainScreenAction.onSelectCategory(category: $category)';
}


}

/// @nodoc
abstract mixin class $SelectCategoryCopyWith<$Res> implements $MainScreenActionCopyWith<$Res> {
  factory $SelectCategoryCopyWith(SelectCategory value, $Res Function(SelectCategory) _then) = _$SelectCategoryCopyWithImpl;
@useResult
$Res call({
 String category
});




}
/// @nodoc
class _$SelectCategoryCopyWithImpl<$Res>
    implements $SelectCategoryCopyWith<$Res> {
  _$SelectCategoryCopyWithImpl(this._self, this._then);

  final SelectCategory _self;
  final $Res Function(SelectCategory) _then;

/// Create a copy of MainScreenAction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? category = null,}) {
  return _then(SelectCategory(
null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ToggleFavorite implements MainScreenAction {
  const ToggleFavorite(this.recipe);
  

 final  Recipe recipe;

/// Create a copy of MainScreenAction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ToggleFavoriteCopyWith<ToggleFavorite> get copyWith => _$ToggleFavoriteCopyWithImpl<ToggleFavorite>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ToggleFavorite&&(identical(other.recipe, recipe) || other.recipe == recipe));
}


@override
int get hashCode => Object.hash(runtimeType,recipe);

@override
String toString() {
  return 'MainScreenAction.onToggleFavorite(recipe: $recipe)';
}


}

/// @nodoc
abstract mixin class $ToggleFavoriteCopyWith<$Res> implements $MainScreenActionCopyWith<$Res> {
  factory $ToggleFavoriteCopyWith(ToggleFavorite value, $Res Function(ToggleFavorite) _then) = _$ToggleFavoriteCopyWithImpl;
@useResult
$Res call({
 Recipe recipe
});


$RecipeCopyWith<$Res> get recipe;

}
/// @nodoc
class _$ToggleFavoriteCopyWithImpl<$Res>
    implements $ToggleFavoriteCopyWith<$Res> {
  _$ToggleFavoriteCopyWithImpl(this._self, this._then);

  final ToggleFavorite _self;
  final $Res Function(ToggleFavorite) _then;

/// Create a copy of MainScreenAction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? recipe = null,}) {
  return _then(ToggleFavorite(
null == recipe ? _self.recipe : recipe // ignore: cast_nullable_to_non_nullable
as Recipe,
  ));
}

/// Create a copy of MainScreenAction
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RecipeCopyWith<$Res> get recipe {
  
  return $RecipeCopyWith<$Res>(_self.recipe, (value) {
    return _then(_self.copyWith(recipe: value));
  });
}
}

// dart format on
