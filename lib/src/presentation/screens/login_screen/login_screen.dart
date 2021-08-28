import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intuition/routes/app_routes.dart';
import 'package:intuition/src/presentation/screens/login_screen/login_controller.dart';
import 'package:intuition/utils/colors.dart';
import 'package:intuition/utils/components/button.dart';
import 'package:intuition/utils/components/text_field.dart';

class LoginScreen extends GetView<LoginController> {
  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF6F6FA),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: _body());
  }

  _body() {
    return Obx(() {
      return SingleChildScrollView(
        child: Stack(
          children: [
            if (controller.loading.value)
              Positioned(
                  bottom: 0,
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Center(
                      child: CircularProgressIndicator(
                    color: AppColors.grey,
                  ))),
            Opacity(
              opacity: controller.loading.value ? 0.4 : 1,
              child: IgnorePointer(
                ignoring: controller.loading.value,
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 16,
                      ),
                      const Text(
                        "Sign in",
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      const Text("Sign in to continue",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.black54)),
                      const SizedBox(
                        height: 36,
                      ),
                      CustomTextField(
                        controller: controller.usernameController,
                        title: "Number",
                        hintText: "Your phone number",
                        prefixText: "+998  ",
                        isFocused: true,
                        formatter: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(9)
                        ],
                        inputType: TextInputType.number,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        controller: controller.passwordController,
                        title: "Password",
                        hintText: "Your password",
                        obscureText: true,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          controller.errorText.value,
                          style: TextStyle(color: Colors.red, fontSize: 14),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: CustomButton(
                          buttonTitle: "Sign in",
                          onTap: () {
                            controller.onSubmit();
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't have account?",
                                style: TextStyle(
                                    color: AppColors.grey, fontSize: 13),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              InkWell(
                                onTap: () {
                                  Get.toNamed(AppRoutes.REGISTER_SCREEN);
                                },
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(
                                      color: AppColors.primaryColor,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ]),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
