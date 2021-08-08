import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class SimpleBarChart extends StatelessWidget {
  final List<charts.Series<dynamic, String>> seriesList;
  final bool animate;

  SimpleBarChart(
    this.seriesList, {
    this.animate = true,
  });

  @override
  Widget build(BuildContext context) {
    return charts.BarChart(
      seriesList,
      animate: animate,
      // defaultRenderer: new charts.LineRendererConfig(includePoints: true),
      primaryMeasureAxis: new charts.NumericAxisSpec(showAxisLine: true),
      // defaultRenderer: new charts.LineRendererConfig(
      //     includeArea: true, stacked: true, includePoints: true),
      // selectionModels: [
      //   SelectionModelConfig(changedListener: (SelectionModel model) {
      //     if (model.hasDatumSelection)
      //       print(model.selectedSeries[0]
      //           .measureFn(model.selectedDatum[0].index));
      //   })
      // ],
      // barRendererDecorator: charts.BarLabelDecorator<String>(
      //   labelAnchor: charts.BarLabelAnchor.middle,
      //   labelPosition: charts.BarLabelPosition.inside,
      // ),
      // domainAxis: new charts.OrdinalAxisSpec(
      //   viewport: new charts.OrdinalViewport('month', 4),
      // ),
      // animate: false,
      barRendererDecorator: new charts.BarLabelDecorator<String>(),
      domainAxis: new charts.OrdinalAxisSpec(
          viewport: new charts.OrdinalViewport('attempt', 5)),
      rtlSpec: charts.RTLSpec(axisDirection: charts.AxisDirection.reversed),
      defaultInteractions: false,
      behaviors: [
        new charts.SlidingViewport(),
        new charts.PanAndZoomBehavior(),
      ],

      // behaviors: [
      //   new charts.SlidingViewport(),
      //   new charts.PanAndZoomBehavior(),
      //   charts.ChartTitle('Total Attempts',
      //       behaviorPosition: charts.BehaviorPosition.bottom,
      //       titleOutsideJustification:
      //           charts.OutsideJustification.middleDrawArea),
      //   charts.ChartTitle('Percentage',
      //       behaviorPosition: charts.BehaviorPosition.start,
      //       titleOutsideJustification:
      //           charts.OutsideJustification.middleDrawArea),
      // ]
    );
  }
}

// class CustomCircleSymbolRenderer extends CircleSymbolRenderer {
//   @override
//   void paint(ChartCanvas canvas, Rectangle<num> bounds,
//       {List<int> dashPattern,
//       FillPatternType fillPattern,
//       Color fillColor,
//       Color strokeColor,
//       double strokeWidthPx}) {
//     super.paint(canvas, bounds,
//         dashPattern: dashPattern,
//         fillColor: fillColor,
//         fillPattern: fillPattern,
//         strokeColor: strokeColor,
//         strokeWidthPx: strokeWidthPx);
//     canvas.drawRect(
//         Rectangle(bounds.left - 5, bounds.top - 30, bounds.width + 10,
//             bounds.height + 10),
//         fill: Color.white);
//     var textStyle = style.TextStyle();
//     textStyle.color = Color.black;
//     textStyle.fontSize = 15;
//     canvas.drawText(
//         TextElement(), (bounds.left).round(), (bounds.top - 28).round());
//     // canvas.drawText(TextElement("1", style: textStyle), (bounds.left).round(),
//     //     (bounds.top - 28).round());
//   }
// }
