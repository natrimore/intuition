import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intuition/src/models/statistics.dart';
import 'package:intuition/src/presentation/screens/statistics/statistics_controller.dart';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:intuition/utils/components/bar_chart.dart';

class StatisticsScreen extends GetView<StatisticsController> {
  final StatisticsController controller = Get.put(StatisticsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF6F6FA),
        appBar: AppBar(
          leading: IconButton(
            iconSize: 18.0,
            splashRadius: 20,
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.of(context).pop(),
          ),
          centerTitle: true,
          backgroundColor: Color(0xffF6F6FA),
          title: Text(
            'Statistics',
            style: TextStyle(
                letterSpacing: 0.5,
                color: Color(0xff282F38),
                fontSize: 18,
                fontWeight: FontWeight.w700),
          ),
        ),
        body: ListView(
          shrinkWrap: true,
          children: [
            const SizedBox(
              height: 28.0,
            ),
            Center(
              child: GetBuilder<StatisticsController>(
                builder: (_) => Text(
                    'Today Total attempts: ${controller.totalAttempts}\n ${controller.calculatePercentage()} %',
                    style:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            GetBuilder<StatisticsController>(
              builder: (_) => graphic(context),
            )
          ],
        ));
  }

  graphic(context) {
    List<charts.Series<StatisticsModel, String>> _createSampleData() {
      return [
        charts.Series<StatisticsModel, String>(
            id: 'Sales',
            colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
            domainFn: (StatisticsModel sales, _) =>
                sales.totalAttempt.toString(),
            measureFn: (StatisticsModel sales, _) => sales.percentage,
            data: controller.data,
            labelAccessorFn: (StatisticsModel sales, _) =>
                '${sales.percentage.toString()}')
      ];
    }

    if (controller.showGraph)
      return Container(
        height: 360,
        width: MediaQuery.of(context).size.width,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: SimpleBarChart(
                    _createSampleData(),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    return Container();
  }
}
