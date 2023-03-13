class UserModel {
  UserModel({
    required this.id,
    this.name,
    this.lastName,
    this.password,
  });

  final String id;
  final String? name;
  final String? lastName;
  final String? password;
}
