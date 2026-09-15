class ForgotResponseModel {
  final String statusMsg;
  final String message;

  ForgotResponseModel({required this.statusMsg, required this.message});
  factory ForgotResponseModel.fromJson(dynamic json) {
    return ForgotResponseModel(
      statusMsg: json["statusMsg"],
      message: json["message"],
    );
  }

  Map<String, dynamic> toJson() {
    {
      return {'message': message, 'statusMsg': statusMsg};
    }
  }
}
