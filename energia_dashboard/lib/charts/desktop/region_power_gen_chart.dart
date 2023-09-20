// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:energia_dashboard/network/endpoints.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RegionPowerGenChart extends StatefulWidget {
  final double heightFactor;

  RegionPowerGenChart({Key? key, this.heightFactor = 0.25}) : super(key: key);

  @override
  State<RegionPowerGenChart> createState() => _RegionPowerGenChartState();
}

class _RegionPowerGenChartState extends State<RegionPowerGenChart> {
  // final List<RegionPowerGenData> data = [
  //   RegionPowerGenData('Ashanti', 6000),
  //   RegionPowerGenData('Greater Accra', 7000),
  //   RegionPowerGenData('Central', 5005),
  //   RegionPowerGenData('Northern', 8000),
  //   RegionPowerGenData('Western', 12000),
  //   RegionPowerGenData('Eastern', 9000),
  //   RegionPowerGenData('Volta', 11000),
  //   RegionPowerGenData('Brong-Ahafo', 7000),
  //   RegionPowerGenData('Upper East', 6000),
  //   RegionPowerGenData('Upper West', 5000),
  // ];

  List<RegionPowerGenData> RegionPowerData = [];
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
          return RegionPowerGenData(
            data["region"] as String,
            data["power_generation"] as double,
          );
        }).toList();
        print(powerDataList);
        setState(() {
          RegionPowerData = powerDataList.cast<RegionPowerGenData>();
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
                primaryYAxis: NumericAxis(
                    title: AxisTitle(text: "Power Generation (MWh)")),
                series: <ChartSeries<RegionPowerGenData, String>>[
                  ColumnSeries<RegionPowerGenData, String>(
                    dataSource: RegionPowerData,
                    xAxisName: "Regions",
                    yAxisName: "Power Generation",
                    xValueMapper: (RegionPowerGenData town, _) => town.region,
                    yValueMapper: (RegionPowerGenData town, _) => town.power,
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

class RegionPowerGenData {
  final String region;
  final double power;

  RegionPowerGenData(this.region, this.power);
}
