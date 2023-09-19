// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:energia_dashboard/charts/desktop/population_chart.dart';
import 'package:energia_dashboard/charts/desktop/power_chart.dart';
import 'package:energia_dashboard/charts/desktop/region_power_con_chart.dart';
import 'package:energia_dashboard/charts/desktop/region_power_gen_chart.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DashboardScreen extends StatelessWidget {
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              const Text(
                "Power consumption and Generation",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              PowerChart(heightFactor: 0.9),
              const SizedBox(height: 20),
              const Text(
                "Power Generation by Region",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              RegionPowerGenChart(heightFactor: 0.9),
              const SizedBox(height: 20),
              const Text(
                "Power Consumption by Region",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              RegionPowerConChart(heightFactor: 0.9),
            ],
          ),
        ),
      ),
    );
  }
}
