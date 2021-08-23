import 'package:get/get.dart';
import 'package:intuition/src/data/user_data.dart';
import 'package:intuition/src/models/statistics.dart';

class StatisticsController extends GetxController {
  int get totalAttempts => _totalAttempts;

  int get incorrect => _incorrect;

  int get correct => _correct;

  DateTime get initialDate => _initialDate;

  int _totalAttempts = 0;

  int _incorrect = 0;

  int _correct = 0;

  var _initialDate = DateTime.now();

  List<StatisticsModel> get data => _data;

  List<StatisticsModel> _data = [];

  var _userData = UserData();

  var _showGraph = false;

  bool get showGraph => _showGraph;

  onInit() {
    super.onInit();
    if (Get.arguments != null) {
      _totalAttempts = Get.arguments['totalAttempts'] ?? 1;
      _incorrect = Get.arguments['incorrect'];
      _correct = Get.arguments['correct'];
      _initialDate = Get.arguments['initialDate'];
    }
    getStatisticsData();
  }

  getStatisticsData() async {
    var listOfData = await _userData.getResult();

    if (listOfData.length > 4) {
      _showGraph = true;

      print("percentage: $listOfData");

      for (int i = 1; i < listOfData.length + 1; i++) {
        var item = StatisticsModel(i * 5, listOfData[i - 1]);
        _data.add(item);
      }
      update();
      for (var item in _data)
        print("list data: ${item.percentage} vs ${item.totalAttempt}");
    }
  }

  int calculatePercentage() {
    print("correct $_correct");
    print("total attempt $_totalAttempts");
    if (_totalAttempts == 0) return 0;
    return (_correct * 100 / _totalAttempts).ceil();
  }
}
