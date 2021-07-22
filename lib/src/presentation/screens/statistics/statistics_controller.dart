import 'package:get/get.dart';

class StatisticsController extends GetxController {
  int get totalAttempts => _totalAttempts;
  int get incorrect => _incorrect;
  int get correct => _correct;
  DateTime get initialDate => _initialDate;

  int _totalAttempts = 0;
  int _incorrect = 0;
  int _correct = 0;
  DateTime _initialDate = DateTime.now();

  onInit() {
    super.onInit();

    if (Get.arguments != null) {
      _totalAttempts = Get.arguments['_totalAttempts'];
      _incorrect = Get.arguments['incorrect'];
      _correct = Get.arguments['correct'];
      _initialDate = Get.arguments['initialDate'];
    }
  }

  int calculatePercentage() {
    return (_correct / _totalAttempts).ceil();
  }
}
