import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class TownChart extends StatelessWidget {
  final double heightFactor;

  TownChart({Key? key, this.heightFactor = 0.25}) : super(key: key);

  final List<TownData> data = [
    TownData('Ashanti Region', 200),
    TownData('Greater Accra Region', 100),
    TownData('Central Region', 150),
    TownData('Northern Region', 80),
    TownData('Western Region', 120),
    TownData('Eastern Region', 90),
    TownData('Volta Region', 110),
    TownData('Brong-Ahafo Region', 70),
    TownData('Upper East Region', 60),
    TownData('Upper West Region', 50),
  ];

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      height: deviceWidth * heightFactor,
      child: Card(
        child: SfCartesianChart(
          primaryXAxis: CategoryAxis(
            labelRotation: 45,
            title: AxisTitle(text: "Regions"),
          ),
          primaryYAxis: NumericAxis(title: AxisTitle(text: "Town Count")),
          series: <ChartSeries<TownData, String>>[
            ColumnSeries<TownData, String>(
              dataSource: data,
              xAxisName: "Regions",
              yAxisName: "Town Count",
              xValueMapper: (TownData town, _) => town.region,
              yValueMapper: (TownData town, _) => town.townCount,
              dataLabelSettings: const DataLabelSettings(isVisible: true),
            ),
          ],
          legend: const Legend(
            isResponsive: true,
            isVisible: true,
            position: LegendPosition.top,
          ),
        ),
      ),
    );
  }
}

class TownData {
  final String region;
  final int townCount;

  TownData(this.region, this.townCount);
}
