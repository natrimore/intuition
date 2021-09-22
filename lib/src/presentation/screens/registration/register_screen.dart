import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intuition/src/presentation/screens/registration/register_controller.dart';
import 'package:intuition/utils/colors.dart';
import 'package:intuition/utils/components/button.dart';
import 'package:intuition/utils/components/text_field.dart';

class RegisterScreen extends GetView<UserRegisterController> {
  final UserRegisterController controller = Get.put(UserRegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xffF6F6FA),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Obx(() {
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
                            "Регистрация",
                            style: TextStyle(
                                fontSize: 32, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          const Text("Зарегистрируйтесь, чтобы присоединиться",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black54)),
                          const SizedBox(
                            height: 36,
                          ),
                          CustomTextField(
                            controller: controller.usernameController,
                            title: "Номер телефона",
                            hintText: "Введите номер телефона",
                            prefixText: "+998  ",
                            isFocused: true,
                            formatter: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(9)
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomTextField(
                            controller: controller.passwordController,
                            title: "Пароль",
                            hintText: "Введите пароль",
                            obscureText: true,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomTextField(
                            controller: controller.confirmController,
                            title: "Подтвердите пароль",
                            hintText: "Введите пароль",
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
                              buttonTitle: "Регистрировать",
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
                                    "Уже есть аккаунт?",
                                    style: TextStyle(
                                        color: AppColors.grey, fontSize: 13),
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: Text(
                                      "Вход",
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
        }));
  }
}
