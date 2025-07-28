// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RecipeModel {

 String get id;// 레시피 ID
 String get title;// 레시피 제목
 String get imageUrl;// 레시피 대표 이미지 URL
 String get description;// 간단한 레시피 설명
 List<IngredientModel> get ingredients; List<StepInfo> get steps;// 조리설명 및 순서
 int get cookTimeMinutes;// 조리시간(분)
 int get servings;// 인분
 String get authorName;// 작성자 ID
 double get averageRating;// 평균별점
 int get reviewCount;// 리뷰 개수
 String get category;// 레시피 카테고리(한식, 양식 등)
 bool get isSavedByUser;
/// Create a copy of RecipeModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecipeModelCopyWith<RecipeModel> get copyWith => _$RecipeModelCopyWithImpl<RecipeModel>(this as RecipeModel, _$identity);

  /// Serializes this RecipeModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecipeModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.ingredients, ingredients)&&const DeepCollectionEquality().equals(other.steps, steps)&&(identical(other.cookTimeMinutes, cookTimeMinutes) || other.cookTimeMinutes == cookTimeMinutes)&&(identical(other.servings, servings) || other.servings == servings)&&(identical(other.authorName, authorName) || other.authorName == authorName)&&(identical(other.averageRating, averageRating) || other.averageRating == averageRating)&&(identical(other.reviewCount, reviewCount) || other.reviewCount == reviewCount)&&(identical(other.category, category) || other.category == category)&&(identical(other.isSavedByUser, isSavedByUser) || other.isSavedByUser == isSavedByUser));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,imageUrl,description,const DeepCollectionEquality().hash(ingredients),const DeepCollectionEquality().hash(steps),cookTimeMinutes,servings,authorName,averageRating,reviewCount,category,isSavedByUser);

@override
String toString() {
  return 'RecipeModel(id: $id, title: $title, imageUrl: $imageUrl, description: $description, ingredients: $ingredients, steps: $steps, cookTimeMinutes: $cookTimeMinutes, servings: $servings, authorName: $authorName, averageRating: $averageRating, reviewCount: $reviewCount, category: $category, isSavedByUser: $isSavedByUser)';
}


}

/// @nodoc
abstract mixin class $RecipeModelCopyWith<$Res>  {
  factory $RecipeModelCopyWith(RecipeModel value, $Res Function(RecipeModel) _then) = _$RecipeModelCopyWithImpl;
@useResult
$Res call({
 String id, String title, String imageUrl, String description, List<IngredientModel> ingredients, List<StepInfo> steps, int cookTimeMinutes, int servings, String authorName, double averageRating, int reviewCount, String category, bool isSavedByUser
});




}
/// @nodoc
class _$RecipeModelCopyWithImpl<$Res>
    implements $RecipeModelCopyWith<$Res> {
  _$RecipeModelCopyWithImpl(this._self, this._then);

  final RecipeModel _self;
  final $Res Function(RecipeModel) _then;

/// Create a copy of RecipeModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? imageUrl = null,Object? description = null,Object? ingredients = null,Object? steps = null,Object? cookTimeMinutes = null,Object? servings = null,Object? authorName = null,Object? averageRating = null,Object? reviewCount = null,Object? category = null,Object? isSavedByUser = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,ingredients: null == ingredients ? _self.ingredients : ingredients // ignore: cast_nullable_to_non_nullable
as List<IngredientModel>,steps: null == steps ? _self.steps : steps // ignore: cast_nullable_to_non_nullable
as List<StepInfo>,cookTimeMinutes: null == cookTimeMinutes ? _self.cookTimeMinutes : cookTimeMinutes // ignore: cast_nullable_to_non_nullable
as int,servings: null == servings ? _self.servings : servings // ignore: cast_nullable_to_non_nullable
as int,authorName: null == authorName ? _self.authorName : authorName // ignore: cast_nullable_to_non_nullable
as String,averageRating: null == averageRating ? _self.averageRating : averageRating // ignore: cast_nullable_to_non_nullable
as double,reviewCount: null == reviewCount ? _self.reviewCount : reviewCount // ignore: cast_nullable_to_non_nullable
as int,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,isSavedByUser: null == isSavedByUser ? _self.isSavedByUser : isSavedByUser // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [RecipeModel].
extension RecipeModelPatterns on RecipeModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecipeModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecipeModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecipeModel value)  $default,){
final _that = this;
switch (_that) {
case _RecipeModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecipeModel value)?  $default,){
final _that = this;
switch (_that) {
case _RecipeModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String imageUrl,  String description,  List<IngredientModel> ingredients,  List<StepInfo> steps,  int cookTimeMinutes,  int servings,  String authorName,  double averageRating,  int reviewCount,  String category,  bool isSavedByUser)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecipeModel() when $default != null:
return $default(_that.id,_that.title,_that.imageUrl,_that.description,_that.ingredients,_that.steps,_that.cookTimeMinutes,_that.servings,_that.authorName,_that.averageRating,_that.reviewCount,_that.category,_that.isSavedByUser);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String imageUrl,  String description,  List<IngredientModel> ingredients,  List<StepInfo> steps,  int cookTimeMinutes,  int servings,  String authorName,  double averageRating,  int reviewCount,  String category,  bool isSavedByUser)  $default,) {final _that = this;
switch (_that) {
case _RecipeModel():
return $default(_that.id,_that.title,_that.imageUrl,_that.description,_that.ingredients,_that.steps,_that.cookTimeMinutes,_that.servings,_that.authorName,_that.averageRating,_that.reviewCount,_that.category,_that.isSavedByUser);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String imageUrl,  String description,  List<IngredientModel> ingredients,  List<StepInfo> steps,  int cookTimeMinutes,  int servings,  String authorName,  double averageRating,  int reviewCount,  String category,  bool isSavedByUser)?  $default,) {final _that = this;
switch (_that) {
case _RecipeModel() when $default != null:
return $default(_that.id,_that.title,_that.imageUrl,_that.description,_that.ingredients,_that.steps,_that.cookTimeMinutes,_that.servings,_that.authorName,_that.averageRating,_that.reviewCount,_that.category,_that.isSavedByUser);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RecipeModel implements RecipeModel {
  const _RecipeModel({required this.id, required this.title, required this.imageUrl, required this.description, required final  List<IngredientModel> ingredients, required final  List<StepInfo> steps, required this.cookTimeMinutes, required this.servings, required this.authorName, required this.averageRating, required this.reviewCount, required this.category, required this.isSavedByUser}): _ingredients = ingredients,_steps = steps;
  factory _RecipeModel.fromJson(Map<String, dynamic> json) => _$RecipeModelFromJson(json);

@override final  String id;
// 레시피 ID
@override final  String title;
// 레시피 제목
@override final  String imageUrl;
// 레시피 대표 이미지 URL
@override final  String description;
// 간단한 레시피 설명
 final  List<IngredientModel> _ingredients;
// 간단한 레시피 설명
@override List<IngredientModel> get ingredients {
  if (_ingredients is EqualUnmodifiableListView) return _ingredients;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ingredients);
}

 final  List<StepInfo> _steps;
@override List<StepInfo> get steps {
  if (_steps is EqualUnmodifiableListView) return _steps;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_steps);
}

// 조리설명 및 순서
@override final  int cookTimeMinutes;
// 조리시간(분)
@override final  int servings;
// 인분
@override final  String authorName;
// 작성자 ID
@override final  double averageRating;
// 평균별점
@override final  int reviewCount;
// 리뷰 개수
@override final  String category;
// 레시피 카테고리(한식, 양식 등)
@override final  bool isSavedByUser;

/// Create a copy of RecipeModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecipeModelCopyWith<_RecipeModel> get copyWith => __$RecipeModelCopyWithImpl<_RecipeModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RecipeModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecipeModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._ingredients, _ingredients)&&const DeepCollectionEquality().equals(other._steps, _steps)&&(identical(other.cookTimeMinutes, cookTimeMinutes) || other.cookTimeMinutes == cookTimeMinutes)&&(identical(other.servings, servings) || other.servings == servings)&&(identical(other.authorName, authorName) || other.authorName == authorName)&&(identical(other.averageRating, averageRating) || other.averageRating == averageRating)&&(identical(other.reviewCount, reviewCount) || other.reviewCount == reviewCount)&&(identical(other.category, category) || other.category == category)&&(identical(other.isSavedByUser, isSavedByUser) || other.isSavedByUser == isSavedByUser));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,imageUrl,description,const DeepCollectionEquality().hash(_ingredients),const DeepCollectionEquality().hash(_steps),cookTimeMinutes,servings,authorName,averageRating,reviewCount,category,isSavedByUser);

@override
String toString() {
  return 'RecipeModel(id: $id, title: $title, imageUrl: $imageUrl, description: $description, ingredients: $ingredients, steps: $steps, cookTimeMinutes: $cookTimeMinutes, servings: $servings, authorName: $authorName, averageRating: $averageRating, reviewCount: $reviewCount, category: $category, isSavedByUser: $isSavedByUser)';
}


}

/// @nodoc
abstract mixin class _$RecipeModelCopyWith<$Res> implements $RecipeModelCopyWith<$Res> {
  factory _$RecipeModelCopyWith(_RecipeModel value, $Res Function(_RecipeModel) _then) = __$RecipeModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String imageUrl, String description, List<IngredientModel> ingredients, List<StepInfo> steps, int cookTimeMinutes, int servings, String authorName, double averageRating, int reviewCount, String category, bool isSavedByUser
});




}
/// @nodoc
class __$RecipeModelCopyWithImpl<$Res>
    implements _$RecipeModelCopyWith<$Res> {
  __$RecipeModelCopyWithImpl(this._self, this._then);

  final _RecipeModel _self;
  final $Res Function(_RecipeModel) _then;

/// Create a copy of RecipeModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? imageUrl = null,Object? description = null,Object? ingredients = null,Object? steps = null,Object? cookTimeMinutes = null,Object? servings = null,Object? authorName = null,Object? averageRating = null,Object? reviewCount = null,Object? category = null,Object? isSavedByUser = null,}) {
  return _then(_RecipeModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,ingredients: null == ingredients ? _self._ingredients : ingredients // ignore: cast_nullable_to_non_nullable
as List<IngredientModel>,steps: null == steps ? _self._steps : steps // ignore: cast_nullable_to_non_nullable
as List<StepInfo>,cookTimeMinutes: null == cookTimeMinutes ? _self.cookTimeMinutes : cookTimeMinutes // ignore: cast_nullable_to_non_nullable
as int,servings: null == servings ? _self.servings : servings // ignore: cast_nullable_to_non_nullable
as int,authorName: null == authorName ? _self.authorName : authorName // ignore: cast_nullable_to_non_nullable
as String,averageRating: null == averageRating ? _self.averageRating : averageRating // ignore: cast_nullable_to_non_nullable
as double,reviewCount: null == reviewCount ? _self.reviewCount : reviewCount // ignore: cast_nullable_to_non_nullable
as int,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,isSavedByUser: null == isSavedByUser ? _self.isSavedByUser : isSavedByUser // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
