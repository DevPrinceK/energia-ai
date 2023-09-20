// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:energia_dashboard/network/endpoints.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RegionPowerConChart extends StatefulWidget {
  final double heightFactor;

  RegionPowerConChart({Key? key, this.heightFactor = 0.25}) : super(key: key);

  @override
  State<RegionPowerConChart> createState() => _RegionPowerConChartState();
}

class _RegionPowerConChartState extends State<RegionPowerConChart> {
  List<RegionConData> RegionPowerData = [];
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
          return RegionConData(
            data["region"] as String,
            data["power_consumption"] as double,
          );
        }).toList();
        print(powerDataList);
        setState(() {
          RegionPowerData = powerDataList.cast<RegionConData>();
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
                  labelRotation: 45,
                  title: AxisTitle(text: "Regions"),
                ),
                primaryYAxis:
                    NumericAxis(title: AxisTitle(text: "Power Consumption")),
                series: <ChartSeries<RegionConData, String>>[
                  ColumnSeries<RegionConData, String>(
                    dataSource: RegionPowerData,
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
  final double power;

  RegionConData(this.region, this.power);
}
