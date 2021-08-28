import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intuition/src/data/api_provider.dart';
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
      showInSnackBar("Please fill all blanks");
      return;
    }

    if (usernameController.text.length < 4) {
      showInSnackBar("Username length should be at least 4 letters");
      return;
    }
    if (passwordController.text.length < 5) {
      showInSnackBar("Password length should be at least 6 letters");
      return;
    }
    if (passwordController.text != confirmController.text) {
      showInSnackBar("Passwords don't match");
      return;
    }

    try {
      loading.value = true;

      var value = await _apiProvider.createUser(
          usernameController.text, passwordController.text);

      loading.value = false;

      Get.offAll(HomeScreen());
    } catch (ex) {
      loading.value = false;
      showInSnackBar(ex.toString());
      print("exception $ex");
    }
  }
}
