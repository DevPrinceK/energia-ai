import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class RegionPowerGenChart extends StatelessWidget {
  final double heightFactor;

  RegionPowerGenChart({Key? key, this.heightFactor = 0.25}) : super(key: key);

  final List<RegionPowerData> data = [
    RegionPowerData('Ashanti', 6000),
    RegionPowerData('Greater Accra', 7000),
    RegionPowerData('Central', 5005),
    RegionPowerData('Northern', 8000),
    RegionPowerData('Western', 12000),
    RegionPowerData('Eastern', 9000),
    RegionPowerData('Volta', 11000),
    RegionPowerData('Brong-Ahafo', 7000),
    RegionPowerData('Upper East', 6000),
    RegionPowerData('Upper West', 5000),
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
          primaryYAxis: NumericAxis(title: AxisTitle(text: "District Count")),
          series: <ChartSeries<RegionPowerData, String>>[
            ColumnSeries<RegionPowerData, String>(
              dataSource: data,
              xAxisName: "Regions",
              yAxisName: "Power Generation",
              xValueMapper: (RegionPowerData town, _) => town.region,
              yValueMapper: (RegionPowerData town, _) => town.power,
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

class RegionPowerData {
  final String region;
  final int power;

  RegionPowerData(this.region, this.power);
}
