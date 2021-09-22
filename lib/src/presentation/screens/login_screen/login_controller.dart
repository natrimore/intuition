import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intuition/src/data/api_provider.dart';
import 'package:intuition/src/data/user_data.dart';
import 'package:intuition/src/models/login_response.dart';
import 'package:intuition/src/presentation/screens/home_screen/home_screen.dart';
import 'package:intuition/utils/frequent_widgets.dart';

class LoginController extends GetxController {
  var _userData = UserData();

  var _apiProvider = ApiProvider();

  var usernameController = TextEditingController();

  var passwordController = TextEditingController();

  var loading = false.obs;

  var errorText = "".obs;

  onSubmit() async {
    if (passwordController.text == "" || usernameController.text == "") {
      showInSnackBar("Пожалуйста, заполните все поля");

      return;
    }
    if (usernameController.text.length != 9) {
      showInSnackBar("Введите правильный номер телефона");

      return;
    }
    if (passwordController.text.length < 5) {
      showInSnackBar("Длина пароля должна быть не менее 6 букв.");

      return;
    }

    errorText.value = "";

    try {
      loading.value = true;

      var value = await _apiProvider.userLogin(
          usernameController.text.trim(), passwordController.text.trim());

      loading.value = false;

      if (value is UserTokenResponse) {
        await _userData.setToken(value.authToken);

        Get.offAll(HomeScreen());
      } else
        showInSnackBar("$value");
    } catch (ex) {
      loading.value = false;

      showInSnackBar(ex.toString());

      print("exception $ex");
    }
  }
}
