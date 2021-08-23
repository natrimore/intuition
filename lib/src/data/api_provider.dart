import 'dart:convert';
import 'package:http/http.dart';
import 'package:intuition/src/data/exceptions.dart';
import 'package:intuition/src/data/user_data.dart';
import 'package:intuition/src/models/login_response.dart';
import 'package:intuition/src/models/user_register_response.dart';

class ApiProvider {
  var client = Client();

  var baseUrl = "http://193.168.3.60:8020";

  String username = "";

  String password = "";
  // late BuildContext _context;

  Future<UserRegisterResponse> createUser(
      String username, String password) async {
    var responseJson;

    this.username = username;
    this.password = password;

    Map<String, dynamic> bodyJson = {
      "userName": username,
      "password": password
    };

    try {
      final response =
          await client.post(uriParser("api/users"), body: jsonEncode(bodyJson));

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
      "userName": username,
      "password": password
    };
    try {
      final response = await client.post(uriParser("api/auth/token"),
          body: jsonEncode(bodyJson));

      var res = _response(response);

      responseJson = UserTokenResponse.fromJson(res);
      UserData().setToken(responseJson?.authToken);
    } on FetchDataException {
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
    return Uri.parse(url);
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
