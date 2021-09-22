import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intuition/routes/app_pages.dart';
import 'package:intuition/routes/app_routes.dart';
import 'package:intuition/utils/theme.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: AppRoutes.SPLASH_SCREEN,
      getPages: AppPages.list,
      debugShowCheckedModeBanner: false,
      title: 'Интуиция',
      theme: MyTheme.lightTheme,
    );
  }
}
