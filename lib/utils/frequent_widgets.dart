import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/snackbar/snack.dart';

void showInSnackBar(String value) {
  Get.showSnackbar(GetBar(
    title: "Ошибка",
    message: "$value",
    icon: Icon(Icons.error, color: Colors.white),
    snackPosition: SnackPosition.TOP,
    backgroundColor: Colors.red,
    borderRadius: 20,
    margin: EdgeInsets.all(15),
    duration: Duration(seconds: 2),
    isDismissible: true,
    dismissDirection: SnackDismissDirection.HORIZONTAL,
    forwardAnimationCurve: Curves.easeOutBack,
  ));
}
