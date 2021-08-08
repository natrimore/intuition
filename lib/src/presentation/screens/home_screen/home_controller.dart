import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intuition/routes/app_routes.dart';
import 'package:intuition/src/core/enums/cardType.dart';
import 'package:intuition/src/data/user_data.dart';

class HomeController extends GetxController {
  var rnd = Random();

  Timer _timer;

  var currentState = false;

  DateTime _initialDate;

  var color = Colors.transparent.obs;

  var _correct = 0;

  var _incorrect = 0;

  var _totalAttempts = 0;

  var buttonWidth = 0;

  var _userData = UserData();

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

    if (_timer != null && _timer.isActive) {
      _timer.cancel();

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

  Color getCardColor(CardType cardType) {
    switch (cardType) {
      case CardType.Black:
        color.value = Colors.black;

        break;

      case CardType.White:
        color.value = Colors.white;

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

    Get.snackbar("Intuition", "The data is cleared");
  }

  int calculatePercentage() {
    print("correct $_correct");
    print("total attempt $_totalAttempts");
    return (_correct * 100 / _totalAttempts).ceil();
  }

  popupSelect(value) {
    // if (value == 0) {
    //   goToStatistics();
    // } else if (value == 2) {
    //   clearAllAttempts();
    // }
  }
}
