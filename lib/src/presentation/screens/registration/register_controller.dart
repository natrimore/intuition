import 'package:get/get.dart';
import 'package:intuition/src/data/api_provider.dart';
import 'package:intuition/src/presentation/screens/home_screen/home_screen.dart';

class UserRegisterController extends GetxController {
  var _apiProvider = ApiProvider();

  var _username = "".obs;

  var _password = "".obs;

  var _confirmPassword = "".obs;

  var loading = false.obs;

  var isError = false.obs;

  var errorText = "".obs;

  onSubmit() async {
    if (_password.value == "" ||
        _username.value == "" ||
        _confirmPassword.value == "") {
      errorText.value = "Please fill all blanks";

      isError(true);
      return;
    }

    if (_password.value.length < 5) {
      errorText.value = "at least 6 letters";

      isError.value = true;
      return;
    }

    if (_password.value != _confirmPassword.value) {
      errorText.value = "Passwords don't match";

      isError.value = true;
      return;
    }

    isError(false);

    try {
      loading.value = true;

      var value =
          await _apiProvider.createUser(_username.value, _password.value);

      loading.value = false;

      Get.offAll(HomeScreen());
    } catch (ex) {
      print("exception");
    }
  }
}
