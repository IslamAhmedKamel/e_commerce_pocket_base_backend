import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

// اللي راجع من الا api
class UserModel {
  final String message;
  final User user;
  final String token;

  UserModel({required this.message, required this.user, required this.token});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    message: json["message"],
    user: User.fromJson(json["user"]),
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "user": user.toJson(),
    "token": token,
  };
}

class User {
  final String name;
  final String email;
  final String role;

  User({required this.name, required this.email, required this.role});

  factory User.fromJson(Map<String, dynamic> json) =>
      User(name: json["name"], email: json["email"], role: json["role"]);

  Map<String, dynamic> toJson() => {"name": name, "email": email, "role": role};
}
