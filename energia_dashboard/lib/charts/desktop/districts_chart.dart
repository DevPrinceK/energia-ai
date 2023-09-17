import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DistrictsChart extends StatelessWidget {
  final double heightFactor;

  DistrictsChart({Key? key, this.heightFactor = 0.25}) : super(key: key);

  final List<DistrictData> data = [
    DistrictData('Ashanti Region', 20),
    DistrictData('Greater Accra Region', 10),
    DistrictData('Central Region', 15),
    DistrictData('Northern Region', 8),
    DistrictData('Western Region', 12),
    DistrictData('Eastern Region', 9),
    DistrictData('Volta Region', 11),
    DistrictData('Brong-Ahafo Region', 7),
    DistrictData('Upper East Region', 6),
    DistrictData('Upper West Region', 5),
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
          series: <ChartSeries<DistrictData, String>>[
            ColumnSeries<DistrictData, String>(
              dataSource: data,
              xAxisName: "Regions",
              yAxisName: "District Count",
              xValueMapper: (DistrictData town, _) => town.region,
              yValueMapper: (DistrictData town, _) => town.townCount,
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

class DistrictData {
  final String region;
  final int townCount;

  DistrictData(this.region, this.townCount);
}
