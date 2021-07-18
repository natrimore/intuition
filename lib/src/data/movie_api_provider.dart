import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:intuition/src/data/exceptions.dart';

import '../models/item_model.dart';

class MovieApiProvider {
  var client = Client();

  final _apiKey = '3910f69dc92c2f9bc3bcb8204dad3e90';

  BuildContext _context;

  Future<ItemModel> fetchMovieList() async {
    var responseJson;
    print('entered');
    try {
      final response = await client
          .get("https://api.themoviedb.org/3/movie/popular?api_key=$_apiKey");

      var res = _response(response);

      responseJson = ItemModel.fromJson(res);
    } on FetchDataException {
      throw FetchDataException("No Internet connection");
    }
    return responseJson;
  }

  void initContext(BuildContext context) {
    this._context = context;
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
        Navigator.of(_context).pushReplacementNamed('/NotFoundPage');
        throw BadRequestException(response.body.toString());
        break;
      case 401:
        print("401 error");
        Navigator.of(_context).pushReplacementNamed('/NotFoundPage');
        throw UnauthorisedException(response.body.toString());
        break;
      case 403:
        Navigator.of(_context).pushReplacementNamed('/NotFoundPage');
        throw UnauthorisedException(response.body.toString());
        break;
      case 500:

      default:
        Navigator.of(_context).pushReplacementNamed('/NotFoundPage');
        throw FetchDataException(
            'Error occurred while Communication with Server with StatusCode : ${response.statusCode}');
        break;
    }
  }
}
