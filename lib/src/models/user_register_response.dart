class UserRegisterResponse {
  String id;
  String userName;
  String phoneNumber;
  bool isPhoneNumberConfirmed;

  UserRegisterResponse(
      {required this.id,
      required this.userName,
      required this.phoneNumber,
      this.isPhoneNumberConfirmed = false});

  factory UserRegisterResponse.fromJson(Map<String, dynamic> json) {
    return UserRegisterResponse(
        id: json["id"],
        userName: json["userName"],
        phoneNumber: json["phoneNumber"],
        isPhoneNumberConfirmed: json["phoneNumberConfirmed"]);
  }
}
