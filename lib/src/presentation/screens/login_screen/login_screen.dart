import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intuition/src/presentation/screens/login_screen/login_controller.dart';
import 'package:intuition/utils/components/button.dart';

class LoginScreen extends GetView<LoginController> {
  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF6F6FA),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        body: Obx(() {
          return Stack(
            children: [
              if (controller.loading.value)
                Positioned(
                    bottom: 0,
                    top: 0,
                    left: 0,
                    right: 0,
                    child: CircularProgressIndicator()),
              Column(
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  const Text("Sign in"),
                  const SizedBox(
                    height: 4,
                  ),
                  const Text("Sign in to continue"),
                  const SizedBox(
                    height: 36,
                  ),
                  const Text("Number"),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    decoration: InputDecoration(hintText: "Your phone number"),
                    controller: controller.usernameController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text("Password"),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(hintText: "Your password"),
                    controller: controller.passwordController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    buttonTitle: "Sign in",
                    onTap: () {
                      controller.onSubmit();
                    },
                  ),
                ],
              ),
            ],
          );
        }));
  }
}
