import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:intuition/src/data/exceptions.dart';
import 'package:intuition/src/data/user_data.dart';
import 'package:intuition/src/models/login_response.dart';
import 'package:intuition/src/models/user_register_response.dart';

class ApiProvider {
  var client = Client();

  var baseUrl = "http://193.168.3.60:8020/";

  String username = "";

  String token = "";

  String password = "";
  // late BuildContext _context;
  Map<String, String> baseHeader(token) => {
        HttpHeaders.authorizationHeader: "Bearer $token",
        HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8'
      };

  static Future<String> getAuth() async {
    String token = await UserData().getToken();
    String basicAuth = 'Bearer $token';
    return basicAuth;
  }

  Future<UserRegisterResponse> createUser(
      String username, String password) async {
    var responseJson;

    this.username = username;
    this.password = password;

    Map<String, dynamic> bodyJson = {
      "userName": "998$username",
      "password": password
    };

    try {
      final response = await client.post(uriParser("api/users"),
          body: jsonEncode(bodyJson), headers: baseHeader(""));

      print(
          "phone: $username, password: $password, response: ${response.statusCode} ${response.body}");

      var res = _response(response);

      responseJson = UserRegisterResponse.fromJson(res);
      await userLogin(username, password);
    } on FetchDataException {
      throw FetchDataException("No Internet connection");
    }
    return responseJson;
  }

  Future<UserTokenResponse> userLogin(String username, String password) async {
    var responseJson;
    Map<String, dynamic> bodyJson = {
      "userName": "998$username",
      "password": password
    };
    try {
      print("phone: $username, password: $password");
      final response = await client.post(uriParser("api/auth/token"),
          body: jsonEncode(bodyJson), headers: baseHeader(""));

      print("data come: ${response.statusCode}");
      var res = _response(response);

      print(res);

      responseJson = UserTokenResponse.fromJson(res);
      UserData().setToken(responseJson?.authToken);
    } catch (ex) {
      print(ex);
      throw FetchDataException("No Internet connection");
    }
    return responseJson;
  }

  Future<int> userRecord(int totalAttempt, int success) async {
    var responseJson;
    String data = "${DateTime.now()} | $totalAttempt | $success";
    Map<String, dynamic> bodyJson = {
      "data": data,
    };
    try {
      final response = await client.post(uriParser("api/records"),
          body: jsonEncode(bodyJson));

      responseJson = response.statusCode;
    } on FetchDataException {
      throw FetchDataException("No Internet connection");
    }
    return responseJson;
  }

  // void initContext(BuildContext context) {
  //   this._context = context;
  // }

  uriParser(String url) {
    print(baseUrl + url);
    return Uri.parse(baseUrl + url);
  }

  dynamic _response(Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        print(responseJson);
        return responseJson;
      case 201:
        var responseJson = json.decode(response.body.toString());
        print(responseJson);
        return responseJson;
      case 204:
        var responseJson = json.decode(response.body.toString());
        print(responseJson);
        return responseJson;
      case 400:
        // Navigator.of(_context).pushReplacementNamed('/NotFoundPage');
        throw BadRequestException(response.body.toString());
      case 401:
        print("401 error");
        // Navigator.of(_context).pushReplacementNamed('/NotFoundPage');
        throw UnauthorisedException(response.body.toString());
      case 403:
        // return userLogin(username, password);
        // Navigator.of(_context).pushReplacementNamed('/NotFoundPage');
        throw UnauthorisedException(response.body.toString());
      case 500:

      default:
        // Navigator.of(_context).pushReplacementNamed('/NotFoundPage');
        throw FetchDataException(
            'Error occurred while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
