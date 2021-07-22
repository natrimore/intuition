import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intuition/src/presentation/screens/statistics/statistics_controller.dart';

class StatisticsScreen extends GetView<StatisticsController> {
  final StatisticsController controller = Get.put(StatisticsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Intuition')),
        body: Container(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
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
                            child: Text(
                                'Total attempts: ${controller.totalAttempts}\n ${controller.calculatePercentage()} %',
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold)),
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
}
