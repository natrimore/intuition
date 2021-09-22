import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intuition/src/data/api_provider.dart';
import 'package:intuition/src/models/user_register_response.dart';
import 'package:intuition/src/presentation/screens/home_screen/home_screen.dart';
import 'package:intuition/utils/frequent_widgets.dart';

class UserRegisterController extends GetxController {
  var _apiProvider = ApiProvider();

  var usernameController = TextEditingController();

  var passwordController = TextEditingController();

  var confirmController = TextEditingController();

  var loading = false.obs;

  var errorText = "".obs;

  onSubmit() async {
    if (usernameController.text == "" ||
        passwordController.text == "" ||
        confirmController.text == "") {
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
    if (passwordController.text != confirmController.text) {
      showInSnackBar("Пароли не совпадают");
      return;
    }

    try {
      loading.value = true;

      var val = await _apiProvider.createUser(
          usernameController.text, passwordController.text);

      loading.value = false;

      if (val is UserRegisterResponse) {
        Get.offAll(HomeScreen());
      } else
        showInSnackBar("$val");
    } catch (ex) {
      loading.value = false;
      showInSnackBar(ex.toString());
      print("exception $ex");
    }
  }
}
