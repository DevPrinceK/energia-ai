import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PowerData {
  final String region;
  final double generation;
  final double consumption;

  PowerData(this.region, this.generation, this.consumption);
}

class PowerChart extends StatelessWidget {
  PowerChart({super.key});
  final List<PowerData> data = [
    PowerData('Ashanti Region', 5000, 5400),
    PowerData('Greater Accra Region', 5100, 5400),
    PowerData('Central Region', 6000, 4000),
    PowerData('Northern Region', 5500, 5000),
    PowerData('Western Region', 5000, 5400),
    PowerData('Eastern Region', 5090, 3400),
    PowerData('Volta Region', 5001, 4000),
    PowerData('Brong-Ahafo Region', 3800, 5400),
    PowerData('Upper East Region', 5000, 4500),
    PowerData('Upper West Region', 5900, 2000),
  ];

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      primaryXAxis: CategoryAxis(isVisible: true, labelRotation: 45),
      primaryYAxis: NumericAxis(isVisible: true),
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
    );
  }
}
