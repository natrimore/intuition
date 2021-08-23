import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intuition/src/data/api_provider.dart';
import 'package:intuition/src/data/user_data.dart';
import 'package:intuition/src/presentation/screens/home_screen/home_screen.dart';

class LoginController extends GetxController {
  var _userData = UserData();

  var _apiProvider = ApiProvider();

  var usernameController = TextEditingController();

  var passwordController = TextEditingController();

  var loading = false.obs;

  var isError = false.obs;

  var errorText = "".obs;

  onSubmit() async {
    if (passwordController.text == "" || usernameController.text == "") {
      errorText.value = "Please fill all blanks";

      isError(true);
      return;
    }
    if (passwordController.text.length < 5) {
      errorText.value = "at least 6 letters";

      isError.value = true;
      return;
    }
    isError(false);
    try {
      loading.value = true;

      var value = await _apiProvider.userLogin(
          usernameController.text.trim(), passwordController.text.trim());

      await _userData.setToken(value.authToken);

      loading.value = false;

      Get.offAll(HomeScreen());
    } catch (ex) {
      print("exception");
    }
  }
}
