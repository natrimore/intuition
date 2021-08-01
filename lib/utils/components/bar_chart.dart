import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class SimpleBarChart extends StatelessWidget {
  final List<charts.Series<dynamic, String>> seriesList;
  final String domainName;
  final String measureName;
  final bool animate;

  SimpleBarChart(
    this.seriesList,
    this.domainName,
    this.measureName, {
    this.animate = true,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
            alignment: Alignment.centerLeft,
            child: RotatedBox(
                quarterTurns: 1,
                child: Text(
                  domainName,
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
                ))),
        Align(
            alignment: Alignment.bottomCenter,
            child: Text(measureName,
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400))),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: charts.BarChart(
            seriesList,
            animate: animate,
          ),
        ),
      ],
    );
  }
}
