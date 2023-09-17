import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PopulationData {
  final String region;
  final int population;

  PopulationData(this.region, this.population);
}

class PopulationChart extends StatelessWidget {
  final double heightFactor;

  PopulationChart({Key? key, this.heightFactor = 0.25}) : super(key: key);

  final List<PopulationData> data = [
    PopulationData('Ashanti Region', 5000000),
    PopulationData('Greater Accra Region', 7000000),
    PopulationData('Central Region', 2500000),
    PopulationData('Northern Region', 4000000),
    PopulationData('Western Region', 3000000),
    PopulationData('Eastern Region', 3200000),
    PopulationData('Volta Region', 2800000),
    PopulationData('Brong-Ahafo Region', 1700000),
    PopulationData('Upper East Region', 1200000),
    PopulationData('Upper West Region', 900000),
  ];

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      height: deviceWidth * heightFactor,
      child: Card(
        child: SfCircularChart(
          title: ChartTitle(text: 'Population by Region'),
          series: <CircularSeries<PopulationData, String>>[
            DoughnutSeries<PopulationData, String>(
              dataSource: data,
              explode: true,
              xValueMapper: (PopulationData population, _) => population.region,
              yValueMapper: (PopulationData population, _) =>
                  population.population,
              dataLabelSettings: const DataLabelSettings(
                isVisible: true,
                labelPosition: ChartDataLabelPosition.outside,
                connectorLineSettings: ConnectorLineSettings(
                  type: ConnectorType.curve,
                ),
              ),
            ),
          ],
          legend: const Legend(
            title: LegendTitle(text: 'Region Population'),
            isVisible: true,
            position: LegendPosition.right,
          ),
        ),
      ),
    );
  }
}
