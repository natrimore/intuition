class UserTokenResponse {
  String login;
  String authToken;

  UserTokenResponse({required this.authToken, required this.login});

  factory UserTokenResponse.fromJson(Map<String, dynamic> json) {
    return UserTokenResponse(
        authToken: json["authToken"], login: json["login"]);
  }
}
