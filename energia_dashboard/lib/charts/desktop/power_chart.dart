// ignore_for_file: use_build_context_synchronously

import 'package:energia_dashboard/network/endpoints.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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

class PowerChart extends StatefulWidget {
  final double heightFactor;
  PowerChart({super.key, this.heightFactor = 0.25});

  @override
  State<PowerChart> createState() => _PowerChartState();
}

class _PowerChartState extends State<PowerChart> {
  List<PowerData> RegionPowerData = [];
  bool isLoading = false;

  Future<int> fetchDashboardAnalysis() async {
    // start loading
    setState(() {
      isLoading = true;
    });

    try {
      // Make API call
      var url = Uri.parse(APIEndpoints.powerByAllRegions);
      var response = await http.get(url);

      // stop loading
      setState(() {
        isLoading = false;
      });

      if (response.statusCode == 200) {
        var resData = jsonDecode(response.body);
        List<dynamic> powerDataList = resData.map((data) {
          return PowerData(
            data["region"] as String,
            data["power_generation"] as double,
            data["power_consumption"] as double,
          );
        }).toList();
        print(powerDataList);
        setState(() {
          RegionPowerData = powerDataList.cast<PowerData>();
        });
        return response.statusCode;
      } else {
        print(response.statusCode);
        print(response.reasonPhrase);
        return response.statusCode;
      }
    } catch (e) {
      print("And error occurred");
      print(e);
      // Handle exceptions by displaying a Snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("An Error Occurred: $e"),
        ),
      );

      // Stop loading
      setState(() {
        isLoading = false;
      });

      // Return an error code or handle it as needed
      return -1; // You can return a custom error code or value
    }
  }

  @override
  void initState() {
    super.initState();
    fetchDashboardAnalysis();
  }

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
                      "Loading...",
                    ),
                  ),
                ],
              ),
            )
          : Card(
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
                    dataSource: RegionPowerData,
                    xValueMapper: (PowerData power, _) => power.region,
                    yValueMapper: (PowerData power, _) => power.generation,
                    name: 'Power Generation',
                  ),
                  StackedLineSeries<PowerData, String>(
                    dataSource: RegionPowerData,
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
