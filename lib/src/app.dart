import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intuition/routes/app_pages.dart';
import 'package:intuition/routes/app_routes.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: AppRoutes.HOME_SCREEN,
      getPages: AppPages.list,
      debugShowCheckedModeBanner: false,
      title: 'Intuition',
      theme: ThemeData.dark(),
    );
  }
}
