import 'package:get/get.dart';
import 'package:intuition/routes/app_routes.dart';
import 'package:intuition/src/data/user_data.dart';

class SplashController extends GetxController {
  var _userData = UserData();

  @override
  void onInit() {
    super.onInit();
    routeSwitcher();
  }

  routeSwitcher() async {
    await Future.delayed(Duration(seconds: 2));

    var value = await _userData.getToken();

    if (value == "") {
      Get.offNamed(AppRoutes.LOGIN_SCREEN);
    } else
      Get.offNamed(AppRoutes.HOME_SCREEN);
  }
}
