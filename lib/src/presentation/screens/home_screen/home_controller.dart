import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intuition/routes/app_routes.dart';
import 'package:intuition/src/core/enums/cardType.dart';
import 'package:intuition/src/data/api_provider.dart';
import 'package:intuition/src/data/user_data.dart';

class HomeController extends GetxController {
  var rnd = Random();

  Timer? _timer;

  var currentState = false;

  DateTime _initialDate = DateTime.now();

  var color = Colors.transparent.obs;

  var _correct = 0;

  var _incorrect = 0;

  var _totalAttempts = 0;

  var buttonWidth = 0;

  var _userData = UserData();

  var _apiProvider = ApiProvider();

  //1-black 0-white
  void onTap(CardType type) {
    print("tapppp");

    if (_totalAttempts == 0) {
      _initialDate = DateTime.now();
    }

    _totalAttempts++;

    var ans = this.generateRandomNumber();

    if (type == CardType.values[ans]) {
      _correct++;
    } else {
      _incorrect++;
    }

    if (_totalAttempts % 50 == 0) {
      saveUserData();
    }

    if (_timer != null && _timer!.isActive) {
      _timer!.cancel();

      currentState = false;
    }

    getCardColor(CardType.values[ans]);

    currentState = true;

    _timer = Timer(Duration(milliseconds: 500), () {
      if (currentState) {
        currentState = false;

        getCardColor(null);
      }
    });
  }

  saveUserData() async {
    List<int> userResult = await _userData.getResult();

    int result = calculatePercentage();

    try {
      var token = await _userData.getToken();

      await _apiProvider.userRecord(_totalAttempts, _correct, token);
    } catch (ex) {
      print("ex  $ex");
    }

    userResult.add(result);

    await _userData.setResult(userResult);
  }

  goToStatistics() {
    print("total: $_totalAttempts");
    print("c $_correct");
    print("inc $_incorrect");
    print("date $_initialDate");

    Get.toNamed(AppRoutes.STATISTICS_SCREEN, arguments: {
      "totalAttempts": _totalAttempts,
      "incorrect": _incorrect,
      "correct": _correct,
      "initialDate": _initialDate
    });
  }

  int generateRandomNumber() {
    return rnd.nextInt(CardType.values.length);
  }

  Color getCardColor(CardType? cardType) {
    switch (cardType) {
      case CardType.Blue:
        color.value = Colors.blue;

        break;

      case CardType.Red:
        color.value = Colors.red;

        break;

      default:
        color.value = Colors.transparent;

        break;
    }
    return color.value;
  }

  void clearAllAttempts() {
    _totalAttempts = 0;

    _incorrect = 0;

    _correct = 0;

    _userData.setResult([]);
  }

  int calculatePercentage() {
    print("correct $_correct");
    print("total attempt $_totalAttempts");
    return (_correct * 100 / _totalAttempts).ceil();
  }

  popupSelect(value) {
    if (value == 0) {
      Get.toNamed(AppRoutes.ABOUT_SCREEN);
    } else if (value == 1) {
      clearAllAttempts();

      _userData.setToken("");

      Get.offAllNamed(AppRoutes.LOGIN_SCREEN);
    }
  }
}
