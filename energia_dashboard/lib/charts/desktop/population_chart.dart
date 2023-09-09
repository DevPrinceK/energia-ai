import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PopulationChart extends StatefulWidget {
  const PopulationChart({super.key});

  @override
  State<PopulationChart> createState() => _PopulationChartState();
}

class _PopulationChartState extends State<PopulationChart> {
  final List<PopulationData> data = [
    PopulationData('Ashanti Region', 4780000),
    PopulationData('Greater Accra Region', 4160000),
    PopulationData('Central Region', 2370000),
    PopulationData('Northern Region', 2380000),
    PopulationData('Western Region', 2160000),
    PopulationData('Eastern Region', 2630000),
    PopulationData('Volta Region', 2440000),
    PopulationData('Brong-Ahafo Region', 2390000),
    PopulationData('Upper East Region', 1080000),
    PopulationData('Upper West Region', 702000),
  ];

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      primaryXAxis: CategoryAxis(),
      primaryYAxis: NumericAxis(),
      series: <BarSeries<PopulationData, String>>[
        BarSeries<PopulationData, String>(
          dataSource: data,
          xAxisName: "Regions",
          yAxisName: "Population",
          xValueMapper: (PopulationData population, _) => population.region,
          yValueMapper: (PopulationData population, _) => population.population,
          dataLabelSettings: const DataLabelSettings(
            isVisible: true,
          ),
        ),
      ],
    );
  }
}

class PopulationData {
  final String region;
  final double population;

  PopulationData(this.region, this.population);
}
