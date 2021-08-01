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
            'Intuition',
            style: TextStyle(
                letterSpacing: 0.5,
                color: Color(0xff282F38),
                fontSize: 18,
                fontWeight: FontWeight.w700),
          ),
        ),
        body: Container(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 20.0,
            ),
            DefaultTabController(
              length: 2,
              initialIndex: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    child: TabBar(
                      labelColor: Colors.green,
                      unselectedLabelColor: Colors.black,
                      tabs: [Tab(text: 'Statistics'), Tab(text: 'Graphics')],
                    ),
                  ),
                  Container(
                      height: 400,
                      decoration: BoxDecoration(
                          border: Border(
                              top: BorderSide(color: Colors.grey, width: 0.5))),
                      child: TabBarView(children: <Widget>[
                        Container(
                          child: Center(
                            child: mainScreen(context),
                            // child: Text(
                            //     'Total attempts: ${controller.totalAttempts}\n ${controller.calculatePercentage()} %',
                            //     style: TextStyle(
                            //         fontSize: 22, fontWeight: FontWeight.bold)),
                          ),
                        ),
                        Container(
                          child: Center(
                            child: Text('Display Tab 2',
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ])),
                ],
              ),
            )
          ],
        )));
  }

  mainScreen(context) {
    List<charts.Series<StatisticsModel, String>> _createSampleData() {
      final data = [
        StatisticsModel(100, 50),
        StatisticsModel(120, 71),
        StatisticsModel(80, 39),
        StatisticsModel(10, 10),
        StatisticsModel(50, 42),
      ];

      return [
        new charts.Series<StatisticsModel, String>(
          displayName: "Statistics",
          id: 'statistics',
          colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
          domainFn: (StatisticsModel sales, _) => sales.totalAttempt.toString(),
          measureFn: (StatisticsModel sales, _) => sales.percentage,
          data: data,
        )
      ];
    }

    return Container(
      height: 360,
      width: MediaQuery.of(context).size.width,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Text(
                "Total : 32000",
              ),
              Expanded(
                child: SimpleBarChart(
                    _createSampleData(), "Percentage", "Total Attempts"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
