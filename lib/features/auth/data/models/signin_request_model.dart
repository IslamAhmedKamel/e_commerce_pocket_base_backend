class SignInModel {
  final String email;
  final String password;

  SignInModel({required this.email, required this.password});

  // تحويل JSON إلى Object
  factory SignInModel.fromJson(Map<String, dynamic> json) {
    return SignInModel(
      email: json['email'] ?? '',
      password: json['password'] ?? '',
    );
  }

  // تحويل Object إلى JSON
  Map<String, dynamic> toJson() {
    return {'email': email, 'password': password};
  }
  
  SignInModel copyWith({
    String? name,
    String? email,
    String? password,
    String? rePassword,
    String? phone,
  }) {
    return SignInModel(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
