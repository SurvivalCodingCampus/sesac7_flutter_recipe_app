// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_recipes_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SearchRecipesState {

 List<Recipe> get orgRecipes; List<Recipe> get recipes; bool get isLoading; String get keyword; FilterSearchState? get filterSearchState;
/// Create a copy of SearchRecipesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchRecipesStateCopyWith<SearchRecipesState> get copyWith => _$SearchRecipesStateCopyWithImpl<SearchRecipesState>(this as SearchRecipesState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchRecipesState&&const DeepCollectionEquality().equals(other.orgRecipes, orgRecipes)&&const DeepCollectionEquality().equals(other.recipes, recipes)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.keyword, keyword) || other.keyword == keyword)&&(identical(other.filterSearchState, filterSearchState) || other.filterSearchState == filterSearchState));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(orgRecipes),const DeepCollectionEquality().hash(recipes),isLoading,keyword,filterSearchState);

@override
String toString() {
  return 'SearchRecipesState(orgRecipes: $orgRecipes, recipes: $recipes, isLoading: $isLoading, keyword: $keyword, filterSearchState: $filterSearchState)';
}


}

/// @nodoc
abstract mixin class $SearchRecipesStateCopyWith<$Res>  {
  factory $SearchRecipesStateCopyWith(SearchRecipesState value, $Res Function(SearchRecipesState) _then) = _$SearchRecipesStateCopyWithImpl;
@useResult
$Res call({
 List<Recipe> orgRecipes, List<Recipe> recipes, bool isLoading, String keyword, FilterSearchState? filterSearchState
});


$FilterSearchStateCopyWith<$Res>? get filterSearchState;

}
/// @nodoc
class _$SearchRecipesStateCopyWithImpl<$Res>
    implements $SearchRecipesStateCopyWith<$Res> {
  _$SearchRecipesStateCopyWithImpl(this._self, this._then);

  final SearchRecipesState _self;
  final $Res Function(SearchRecipesState) _then;

/// Create a copy of SearchRecipesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? orgRecipes = null,Object? recipes = null,Object? isLoading = null,Object? keyword = null,Object? filterSearchState = freezed,}) {
  return _then(_self.copyWith(
orgRecipes: null == orgRecipes ? _self.orgRecipes : orgRecipes // ignore: cast_nullable_to_non_nullable
as List<Recipe>,recipes: null == recipes ? _self.recipes : recipes // ignore: cast_nullable_to_non_nullable
as List<Recipe>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,keyword: null == keyword ? _self.keyword : keyword // ignore: cast_nullable_to_non_nullable
as String,filterSearchState: freezed == filterSearchState ? _self.filterSearchState : filterSearchState // ignore: cast_nullable_to_non_nullable
as FilterSearchState?,
  ));
}
/// Create a copy of SearchRecipesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FilterSearchStateCopyWith<$Res>? get filterSearchState {
    if (_self.filterSearchState == null) {
    return null;
  }

  return $FilterSearchStateCopyWith<$Res>(_self.filterSearchState!, (value) {
    return _then(_self.copyWith(filterSearchState: value));
  });
}
}


/// Adds pattern-matching-related methods to [SearchRecipesState].
extension SearchRecipesStatePatterns on SearchRecipesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchRecipesState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchRecipesState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchRecipesState value)  $default,){
final _that = this;
switch (_that) {
case _SearchRecipesState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchRecipesState value)?  $default,){
final _that = this;
switch (_that) {
case _SearchRecipesState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Recipe> orgRecipes,  List<Recipe> recipes,  bool isLoading,  String keyword,  FilterSearchState? filterSearchState)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchRecipesState() when $default != null:
return $default(_that.orgRecipes,_that.recipes,_that.isLoading,_that.keyword,_that.filterSearchState);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Recipe> orgRecipes,  List<Recipe> recipes,  bool isLoading,  String keyword,  FilterSearchState? filterSearchState)  $default,) {final _that = this;
switch (_that) {
case _SearchRecipesState():
return $default(_that.orgRecipes,_that.recipes,_that.isLoading,_that.keyword,_that.filterSearchState);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Recipe> orgRecipes,  List<Recipe> recipes,  bool isLoading,  String keyword,  FilterSearchState? filterSearchState)?  $default,) {final _that = this;
switch (_that) {
case _SearchRecipesState() when $default != null:
return $default(_that.orgRecipes,_that.recipes,_that.isLoading,_that.keyword,_that.filterSearchState);case _:
  return null;

}
}

}

/// @nodoc


class _SearchRecipesState extends SearchRecipesState {
  const _SearchRecipesState({final  List<Recipe> orgRecipes = const [], final  List<Recipe> recipes = const [], this.isLoading = false, this.keyword = '', this.filterSearchState}): _orgRecipes = orgRecipes,_recipes = recipes,super._();
  

 final  List<Recipe> _orgRecipes;
@override@JsonKey() List<Recipe> get orgRecipes {
  if (_orgRecipes is EqualUnmodifiableListView) return _orgRecipes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_orgRecipes);
}

 final  List<Recipe> _recipes;
@override@JsonKey() List<Recipe> get recipes {
  if (_recipes is EqualUnmodifiableListView) return _recipes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recipes);
}

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  String keyword;
@override final  FilterSearchState? filterSearchState;

/// Create a copy of SearchRecipesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchRecipesStateCopyWith<_SearchRecipesState> get copyWith => __$SearchRecipesStateCopyWithImpl<_SearchRecipesState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchRecipesState&&const DeepCollectionEquality().equals(other._orgRecipes, _orgRecipes)&&const DeepCollectionEquality().equals(other._recipes, _recipes)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.keyword, keyword) || other.keyword == keyword)&&(identical(other.filterSearchState, filterSearchState) || other.filterSearchState == filterSearchState));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_orgRecipes),const DeepCollectionEquality().hash(_recipes),isLoading,keyword,filterSearchState);

@override
String toString() {
  return 'SearchRecipesState(orgRecipes: $orgRecipes, recipes: $recipes, isLoading: $isLoading, keyword: $keyword, filterSearchState: $filterSearchState)';
}


}

/// @nodoc
abstract mixin class _$SearchRecipesStateCopyWith<$Res> implements $SearchRecipesStateCopyWith<$Res> {
  factory _$SearchRecipesStateCopyWith(_SearchRecipesState value, $Res Function(_SearchRecipesState) _then) = __$SearchRecipesStateCopyWithImpl;
@override @useResult
$Res call({
 List<Recipe> orgRecipes, List<Recipe> recipes, bool isLoading, String keyword, FilterSearchState? filterSearchState
});


@override $FilterSearchStateCopyWith<$Res>? get filterSearchState;

}
/// @nodoc
class __$SearchRecipesStateCopyWithImpl<$Res>
    implements _$SearchRecipesStateCopyWith<$Res> {
  __$SearchRecipesStateCopyWithImpl(this._self, this._then);

  final _SearchRecipesState _self;
  final $Res Function(_SearchRecipesState) _then;

/// Create a copy of SearchRecipesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? orgRecipes = null,Object? recipes = null,Object? isLoading = null,Object? keyword = null,Object? filterSearchState = freezed,}) {
  return _then(_SearchRecipesState(
orgRecipes: null == orgRecipes ? _self._orgRecipes : orgRecipes // ignore: cast_nullable_to_non_nullable
as List<Recipe>,recipes: null == recipes ? _self._recipes : recipes // ignore: cast_nullable_to_non_nullable
as List<Recipe>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,keyword: null == keyword ? _self.keyword : keyword // ignore: cast_nullable_to_non_nullable
as String,filterSearchState: freezed == filterSearchState ? _self.filterSearchState : filterSearchState // ignore: cast_nullable_to_non_nullable
as FilterSearchState?,
  ));
}

/// Create a copy of SearchRecipesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FilterSearchStateCopyWith<$Res>? get filterSearchState {
    if (_self.filterSearchState == null) {
    return null;
  }

  return $FilterSearchStateCopyWith<$Res>(_self.filterSearchState!, (value) {
    return _then(_self.copyWith(filterSearchState: value));
  });
}
}

// dart format on
