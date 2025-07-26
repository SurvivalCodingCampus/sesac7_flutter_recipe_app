// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'saved_recipes_action.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SavedRecipesAction {

 String get recipeId;
/// Create a copy of SavedRecipesAction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SavedRecipesActionCopyWith<SavedRecipesAction> get copyWith => _$SavedRecipesActionCopyWithImpl<SavedRecipesAction>(this as SavedRecipesAction, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SavedRecipesAction&&(identical(other.recipeId, recipeId) || other.recipeId == recipeId));
}


@override
int get hashCode => Object.hash(runtimeType,recipeId);

@override
String toString() {
  return 'SavedRecipesAction(recipeId: $recipeId)';
}


}

/// @nodoc
abstract mixin class $SavedRecipesActionCopyWith<$Res>  {
  factory $SavedRecipesActionCopyWith(SavedRecipesAction value, $Res Function(SavedRecipesAction) _then) = _$SavedRecipesActionCopyWithImpl;
@useResult
$Res call({
 String recipeId
});




}
/// @nodoc
class _$SavedRecipesActionCopyWithImpl<$Res>
    implements $SavedRecipesActionCopyWith<$Res> {
  _$SavedRecipesActionCopyWithImpl(this._self, this._then);

  final SavedRecipesAction _self;
  final $Res Function(SavedRecipesAction) _then;

/// Create a copy of SavedRecipesAction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? recipeId = null,}) {
  return _then(_self.copyWith(
recipeId: null == recipeId ? _self.recipeId : recipeId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SavedRecipesAction].
extension SavedRecipesActionPatterns on SavedRecipesAction {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( callRecipeDetailScreen value)?  onCallRecipeDetailScreen,TResult Function( savedRecipe value)?  onSavedRecipe,required TResult orElse(),}){
final _that = this;
switch (_that) {
case callRecipeDetailScreen() when onCallRecipeDetailScreen != null:
return onCallRecipeDetailScreen(_that);case savedRecipe() when onSavedRecipe != null:
return onSavedRecipe(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( callRecipeDetailScreen value)  onCallRecipeDetailScreen,required TResult Function( savedRecipe value)  onSavedRecipe,}){
final _that = this;
switch (_that) {
case callRecipeDetailScreen():
return onCallRecipeDetailScreen(_that);case savedRecipe():
return onSavedRecipe(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( callRecipeDetailScreen value)?  onCallRecipeDetailScreen,TResult? Function( savedRecipe value)?  onSavedRecipe,}){
final _that = this;
switch (_that) {
case callRecipeDetailScreen() when onCallRecipeDetailScreen != null:
return onCallRecipeDetailScreen(_that);case savedRecipe() when onSavedRecipe != null:
return onSavedRecipe(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String recipeId)?  onCallRecipeDetailScreen,TResult Function( String recipeId)?  onSavedRecipe,required TResult orElse(),}) {final _that = this;
switch (_that) {
case callRecipeDetailScreen() when onCallRecipeDetailScreen != null:
return onCallRecipeDetailScreen(_that.recipeId);case savedRecipe() when onSavedRecipe != null:
return onSavedRecipe(_that.recipeId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String recipeId)  onCallRecipeDetailScreen,required TResult Function( String recipeId)  onSavedRecipe,}) {final _that = this;
switch (_that) {
case callRecipeDetailScreen():
return onCallRecipeDetailScreen(_that.recipeId);case savedRecipe():
return onSavedRecipe(_that.recipeId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String recipeId)?  onCallRecipeDetailScreen,TResult? Function( String recipeId)?  onSavedRecipe,}) {final _that = this;
switch (_that) {
case callRecipeDetailScreen() when onCallRecipeDetailScreen != null:
return onCallRecipeDetailScreen(_that.recipeId);case savedRecipe() when onSavedRecipe != null:
return onSavedRecipe(_that.recipeId);case _:
  return null;

}
}

}

/// @nodoc


class callRecipeDetailScreen implements SavedRecipesAction {
  const callRecipeDetailScreen(this.recipeId);
  

@override final  String recipeId;

/// Create a copy of SavedRecipesAction
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$callRecipeDetailScreenCopyWith<callRecipeDetailScreen> get copyWith => _$callRecipeDetailScreenCopyWithImpl<callRecipeDetailScreen>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is callRecipeDetailScreen&&(identical(other.recipeId, recipeId) || other.recipeId == recipeId));
}


@override
int get hashCode => Object.hash(runtimeType,recipeId);

@override
String toString() {
  return 'SavedRecipesAction.onCallRecipeDetailScreen(recipeId: $recipeId)';
}


}

/// @nodoc
abstract mixin class $callRecipeDetailScreenCopyWith<$Res> implements $SavedRecipesActionCopyWith<$Res> {
  factory $callRecipeDetailScreenCopyWith(callRecipeDetailScreen value, $Res Function(callRecipeDetailScreen) _then) = _$callRecipeDetailScreenCopyWithImpl;
@override @useResult
$Res call({
 String recipeId
});




}
/// @nodoc
class _$callRecipeDetailScreenCopyWithImpl<$Res>
    implements $callRecipeDetailScreenCopyWith<$Res> {
  _$callRecipeDetailScreenCopyWithImpl(this._self, this._then);

  final callRecipeDetailScreen _self;
  final $Res Function(callRecipeDetailScreen) _then;

/// Create a copy of SavedRecipesAction
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? recipeId = null,}) {
  return _then(callRecipeDetailScreen(
null == recipeId ? _self.recipeId : recipeId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class savedRecipe implements SavedRecipesAction {
  const savedRecipe(this.recipeId);
  

@override final  String recipeId;

/// Create a copy of SavedRecipesAction
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$savedRecipeCopyWith<savedRecipe> get copyWith => _$savedRecipeCopyWithImpl<savedRecipe>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is savedRecipe&&(identical(other.recipeId, recipeId) || other.recipeId == recipeId));
}


@override
int get hashCode => Object.hash(runtimeType,recipeId);

@override
String toString() {
  return 'SavedRecipesAction.onSavedRecipe(recipeId: $recipeId)';
}


}

/// @nodoc
abstract mixin class $savedRecipeCopyWith<$Res> implements $SavedRecipesActionCopyWith<$Res> {
  factory $savedRecipeCopyWith(savedRecipe value, $Res Function(savedRecipe) _then) = _$savedRecipeCopyWithImpl;
@override @useResult
$Res call({
 String recipeId
});




}
/// @nodoc
class _$savedRecipeCopyWithImpl<$Res>
    implements $savedRecipeCopyWith<$Res> {
  _$savedRecipeCopyWithImpl(this._self, this._then);

  final savedRecipe _self;
  final $Res Function(savedRecipe) _then;

/// Create a copy of SavedRecipesAction
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? recipeId = null,}) {
  return _then(savedRecipe(
null == recipeId ? _self.recipeId : recipeId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
