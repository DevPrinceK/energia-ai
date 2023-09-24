// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DummyChart extends StatefulWidget {
  final double heightFactor;
  final String selectedRegion;

  DummyChart({
    Key? key,
    this.heightFactor = 0.25,
    required this.selectedRegion,
  }) : super(key: key);

  @override
  State<DummyChart> createState() => _DummyChartState();
}

class _DummyChartState extends State<DummyChart> {
  List<DistrictData> data = [];

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      height: deviceWidth * widget.heightFactor,
      child: isLoading
          ? const Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: CircularProgressIndicator(),
                  ),
                  Center(
                    child: Text(
                      "Analyzing...",
                    ),
                  ),
                ],
              ),
            )
          : Card(
              child: SfCartesianChart(
                primaryXAxis: CategoryAxis(
                  labelRotation: 45,
                  title: AxisTitle(text: widget.selectedRegion),
                ),
                primaryYAxis: NumericAxis(title: AxisTitle(text: "Power")),
                series: <ChartSeries<DistrictData, String>>[
                  ColumnSeries<DistrictData, String>(
                    dataSource: data,
                    xAxisName: "Districts",
                    yAxisName: "Power Consumption",
                    xValueMapper: (DistrictData district, _) =>
                        district.district,
                    yValueMapper: (DistrictData district, _) =>
                        district.consumption,
                    name: "Power Consumption",
                    color: Colors.blue,
                  ),
                  ColumnSeries<DistrictData, String>(
                    dataSource: data,
                    xAxisName: "Districts",
                    yAxisName: "Power Generation",
                    xValueMapper: (DistrictData district, _) =>
                        district.district,
                    yValueMapper: (DistrictData district, _) =>
                        district.generation,
                    name: "Power Generation",
                    color: Colors.green,
                  ),
                ],
                legend: Legend(
                  title: LegendTitle(
                      text: "Power Statistics for ${widget.selectedRegion}"),
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
  final String district;
  final int consumption;
  final int generation;
  DistrictData(this.district, this.consumption, this.generation);
}
