import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  @override
  final int id;
  @override
  final String email;
  @override
  final String name;
  @override
  final String address;
  @override
  final String profileImage;
  @override
  final List<int> savedRecipes;
  @override
  final List<int> myRecipes;
  @override
  final List<String> followers;
  @override
  final List<String> following;
  @override
  final String job;
  @override
  final String introduce;
  @override
  final List<int> notifications;

  const User({
    required this.id,
    required this.email,
    required this.name,
    required this.address,
    required this.profileImage,
    required this.savedRecipes,
    required this.myRecipes,
    required this.followers,
    required this.following,
    required this.job,
    required this.introduce,
    required this.notifications,
  });
}
