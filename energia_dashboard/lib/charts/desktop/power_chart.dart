import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PowerData {
  final String region;
  final double generation;
  final double consumption;

  PowerData(
    this.region,
    this.generation,
    this.consumption,
  );
}

class PowerChart extends StatelessWidget {
  final double heightFactor;
  PowerChart({super.key, this.heightFactor = 0.25});
  final List<PowerData> data = [
    PowerData('Ashanti', 5000, 5400),
    PowerData('Greater Accra', 5100, 5400),
    PowerData('Central', 6000, 4000),
    PowerData('Northern', 5500, 5000),
    PowerData('Western', 5000, 5400),
    PowerData('Eastern', 5090, 3400),
    PowerData('Volta', 5001, 4000),
    PowerData('Brong-Ahafo', 3800, 5400),
    PowerData('Upper East', 5000, 4500),
    PowerData('Upper West', 5900, 2000),
  ];

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: deviceWidth * heightFactor,
      child: Card(
        child: SfCartesianChart(
          primaryXAxis: CategoryAxis(
            isVisible: true,
            labelRotation: 45,
            title: AxisTitle(text: "Regions"),
          ),
          primaryYAxis: NumericAxis(
            isVisible: true,
            title: AxisTitle(text: "Power"),
          ),
          series: <ChartSeries<PowerData, String>>[
            StackedLineSeries<PowerData, String>(
              dataSource: data,
              xValueMapper: (PowerData power, _) => power.region,
              yValueMapper: (PowerData power, _) => power.generation,
              name: 'Power Generation',
            ),
            StackedLineSeries<PowerData, String>(
              dataSource: data,
              xValueMapper: (PowerData power, _) => power.region,
              yValueMapper: (PowerData power, _) => power.consumption,
              name: 'Power Consumption',
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
