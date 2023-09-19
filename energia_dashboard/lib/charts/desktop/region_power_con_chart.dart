import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class RegionPowerConChart extends StatelessWidget {
  final double heightFactor;

  RegionPowerConChart({Key? key, this.heightFactor = 0.25}) : super(key: key);

  final List<RegionConData> data = [
    RegionConData('Ashanti', 5800),
    RegionConData('Greater Accra', 6000),
    RegionConData('Central', 7005),
    RegionConData('Northern', 4000),
    RegionConData('Western', 11000),
    RegionConData('Eastern', 7000),
    RegionConData('Volta', 10000),
    RegionConData('Brong-Ahafo', 8000),
    RegionConData('Upper East', 6500),
    RegionConData('Upper West', 9000),
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
          primaryYAxis:
              NumericAxis(title: AxisTitle(text: "Power Consumption")),
          series: <ChartSeries<RegionConData, String>>[
            ColumnSeries<RegionConData, String>(
              dataSource: data,
              xAxisName: "Regions",
              yAxisName: "Power Consumption",
              xValueMapper: (RegionConData town, _) => town.region,
              yValueMapper: (RegionConData town, _) => town.power,
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

class RegionConData {
  final String region;
  final int power;

  RegionConData(this.region, this.power);
}
