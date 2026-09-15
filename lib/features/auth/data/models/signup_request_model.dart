class SignUpModel {
  final String name;
  final String email;
  final String password;
  final String rePassword;
  final String phone;

  SignUpModel({
    required this.name,
    required this.email,
    required this.password,
    required this.rePassword,
    required this.phone,
  });

  // تحويل JSON إلى Object
  factory SignUpModel.fromJson(Map<String, dynamic> json) {
    return SignUpModel(
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      rePassword: json['rePassword'] ?? '',
      phone: json['phone'] ?? '',
    );
  }

  // تحويل Object إلى JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'rePassword': rePassword,
      'phone': phone,
    };
  }

  // نسخة من الكائن مع تغيير بعض القيم
  SignUpModel copyWith({
    String? name,
    String? email,
    String? password,
    String? rePassword,
    String? phone,
  }) {
    return SignUpModel(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      rePassword: rePassword ?? this.rePassword,
      phone: phone ?? this.phone,
    );
  }

  // تحويل الكائن إلى String (للعرض)
  @override
  String toString() {
    return 'SignUpModel(name: $name, email: $email, password: $password, rePassword: $rePassword, phone: $phone)';
  }

  // مقارنة الكائنات
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SignUpModel &&
        other.name == name &&
        other.email == email &&
        other.password == password &&
        other.rePassword == rePassword &&
        other.phone == phone;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        email.hashCode ^
        password.hashCode ^
        rePassword.hashCode ^
        phone.hashCode;
  }
}