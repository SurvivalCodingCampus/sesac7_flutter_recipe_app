// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_recipes_action.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SearchRecipesAction {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchRecipesAction);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SearchRecipesAction()';
}


}

/// @nodoc
class $SearchRecipesActionCopyWith<$Res>  {
$SearchRecipesActionCopyWith(SearchRecipesAction _, $Res Function(SearchRecipesAction) __);
}


/// Adds pattern-matching-related methods to [SearchRecipesAction].
extension SearchRecipesActionPatterns on SearchRecipesAction {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( callFilterBottomSheet value)?  onCallFilterBottomSheet,TResult Function( close value)?  onClose,TResult Function( textValueChange value)?  onTextValueChange,TResult Function( savedFilterStatue value)?  onSavedFilterStatue,TResult Function( fetchRecipes value)?  onFetchRecipes,required TResult orElse(),}){
final _that = this;
switch (_that) {
case callFilterBottomSheet() when onCallFilterBottomSheet != null:
return onCallFilterBottomSheet(_that);case close() when onClose != null:
return onClose(_that);case textValueChange() when onTextValueChange != null:
return onTextValueChange(_that);case savedFilterStatue() when onSavedFilterStatue != null:
return onSavedFilterStatue(_that);case fetchRecipes() when onFetchRecipes != null:
return onFetchRecipes(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( callFilterBottomSheet value)  onCallFilterBottomSheet,required TResult Function( close value)  onClose,required TResult Function( textValueChange value)  onTextValueChange,required TResult Function( savedFilterStatue value)  onSavedFilterStatue,required TResult Function( fetchRecipes value)  onFetchRecipes,}){
final _that = this;
switch (_that) {
case callFilterBottomSheet():
return onCallFilterBottomSheet(_that);case close():
return onClose(_that);case textValueChange():
return onTextValueChange(_that);case savedFilterStatue():
return onSavedFilterStatue(_that);case fetchRecipes():
return onFetchRecipes(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( callFilterBottomSheet value)?  onCallFilterBottomSheet,TResult? Function( close value)?  onClose,TResult? Function( textValueChange value)?  onTextValueChange,TResult? Function( savedFilterStatue value)?  onSavedFilterStatue,TResult? Function( fetchRecipes value)?  onFetchRecipes,}){
final _that = this;
switch (_that) {
case callFilterBottomSheet() when onCallFilterBottomSheet != null:
return onCallFilterBottomSheet(_that);case close() when onClose != null:
return onClose(_that);case textValueChange() when onTextValueChange != null:
return onTextValueChange(_that);case savedFilterStatue() when onSavedFilterStatue != null:
return onSavedFilterStatue(_that);case fetchRecipes() when onFetchRecipes != null:
return onFetchRecipes(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  onCallFilterBottomSheet,TResult Function()?  onClose,TResult Function( String value)?  onTextValueChange,TResult Function( FilterSearchState state)?  onSavedFilterStatue,TResult Function()?  onFetchRecipes,required TResult orElse(),}) {final _that = this;
switch (_that) {
case callFilterBottomSheet() when onCallFilterBottomSheet != null:
return onCallFilterBottomSheet();case close() when onClose != null:
return onClose();case textValueChange() when onTextValueChange != null:
return onTextValueChange(_that.value);case savedFilterStatue() when onSavedFilterStatue != null:
return onSavedFilterStatue(_that.state);case fetchRecipes() when onFetchRecipes != null:
return onFetchRecipes();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  onCallFilterBottomSheet,required TResult Function()  onClose,required TResult Function( String value)  onTextValueChange,required TResult Function( FilterSearchState state)  onSavedFilterStatue,required TResult Function()  onFetchRecipes,}) {final _that = this;
switch (_that) {
case callFilterBottomSheet():
return onCallFilterBottomSheet();case close():
return onClose();case textValueChange():
return onTextValueChange(_that.value);case savedFilterStatue():
return onSavedFilterStatue(_that.state);case fetchRecipes():
return onFetchRecipes();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  onCallFilterBottomSheet,TResult? Function()?  onClose,TResult? Function( String value)?  onTextValueChange,TResult? Function( FilterSearchState state)?  onSavedFilterStatue,TResult? Function()?  onFetchRecipes,}) {final _that = this;
switch (_that) {
case callFilterBottomSheet() when onCallFilterBottomSheet != null:
return onCallFilterBottomSheet();case close() when onClose != null:
return onClose();case textValueChange() when onTextValueChange != null:
return onTextValueChange(_that.value);case savedFilterStatue() when onSavedFilterStatue != null:
return onSavedFilterStatue(_that.state);case fetchRecipes() when onFetchRecipes != null:
return onFetchRecipes();case _:
  return null;

}
}

}

/// @nodoc


class callFilterBottomSheet implements SearchRecipesAction {
  const callFilterBottomSheet();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is callFilterBottomSheet);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SearchRecipesAction.onCallFilterBottomSheet()';
}


}




/// @nodoc


class close implements SearchRecipesAction {
  const close();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is close);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SearchRecipesAction.onClose()';
}


}




/// @nodoc


class textValueChange implements SearchRecipesAction {
  const textValueChange(this.value);
  

 final  String value;

/// Create a copy of SearchRecipesAction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$textValueChangeCopyWith<textValueChange> get copyWith => _$textValueChangeCopyWithImpl<textValueChange>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is textValueChange&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'SearchRecipesAction.onTextValueChange(value: $value)';
}


}

/// @nodoc
abstract mixin class $textValueChangeCopyWith<$Res> implements $SearchRecipesActionCopyWith<$Res> {
  factory $textValueChangeCopyWith(textValueChange value, $Res Function(textValueChange) _then) = _$textValueChangeCopyWithImpl;
@useResult
$Res call({
 String value
});




}
/// @nodoc
class _$textValueChangeCopyWithImpl<$Res>
    implements $textValueChangeCopyWith<$Res> {
  _$textValueChangeCopyWithImpl(this._self, this._then);

  final textValueChange _self;
  final $Res Function(textValueChange) _then;

/// Create a copy of SearchRecipesAction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(textValueChange(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class savedFilterStatue implements SearchRecipesAction {
  const savedFilterStatue(this.state);
  

 final  FilterSearchState state;

/// Create a copy of SearchRecipesAction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$savedFilterStatueCopyWith<savedFilterStatue> get copyWith => _$savedFilterStatueCopyWithImpl<savedFilterStatue>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is savedFilterStatue&&(identical(other.state, state) || other.state == state));
}


@override
int get hashCode => Object.hash(runtimeType,state);

@override
String toString() {
  return 'SearchRecipesAction.onSavedFilterStatue(state: $state)';
}


}

/// @nodoc
abstract mixin class $savedFilterStatueCopyWith<$Res> implements $SearchRecipesActionCopyWith<$Res> {
  factory $savedFilterStatueCopyWith(savedFilterStatue value, $Res Function(savedFilterStatue) _then) = _$savedFilterStatueCopyWithImpl;
@useResult
$Res call({
 FilterSearchState state
});


$FilterSearchStateCopyWith<$Res> get state;

}
/// @nodoc
class _$savedFilterStatueCopyWithImpl<$Res>
    implements $savedFilterStatueCopyWith<$Res> {
  _$savedFilterStatueCopyWithImpl(this._self, this._then);

  final savedFilterStatue _self;
  final $Res Function(savedFilterStatue) _then;

/// Create a copy of SearchRecipesAction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? state = null,}) {
  return _then(savedFilterStatue(
null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as FilterSearchState,
  ));
}

/// Create a copy of SearchRecipesAction
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FilterSearchStateCopyWith<$Res> get state {
  
  return $FilterSearchStateCopyWith<$Res>(_self.state, (value) {
    return _then(_self.copyWith(state: value));
  });
}
}

/// @nodoc


class fetchRecipes implements SearchRecipesAction {
  const fetchRecipes();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is fetchRecipes);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SearchRecipesAction.onFetchRecipes()';
}


}




// dart format on
