import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:intuition/src/presentation/screens/home_screen/home_screen.dart';
import 'package:intuition/src/presentation/screens/statistics/statistics_screen.dart';

import 'app_routes.dart';

class AppPages {
  static var list = [
    GetPage(
      name: AppRoutes.HOME_SCREEN,
      page: () => HomeScreen(),
    ),
    GetPage(
      name: AppRoutes.STATISTICS_SCREEN,
      page: () => StatisticsScreen(),
    ),
  ];
}
