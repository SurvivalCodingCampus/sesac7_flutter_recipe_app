class UserEntity {
  int id;
  String email;
  String name;
  String address;
  String profileImage;
  String savedRecipes;
  String myRecipes;
  String followers;
  String following;
  String job;
  String introduce;
  String notifications;

  UserEntity({
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

  factory UserEntity.fromJson(Map<String, dynamic> map) {
    return UserEntity(
      id: map['id'],
      email: map['email'],
      name: map['name'],
      address: map['address'],
      profileImage: map['profileImage'],
      savedRecipes: map['savedRecipes'],
      myRecipes: map['myRecipes'],
      followers: map['followers'],
      following: map['following'],
      job: map['job'],
      introduce: map['introduce'],
      notifications: map['notifications'],
    );
  }
}
