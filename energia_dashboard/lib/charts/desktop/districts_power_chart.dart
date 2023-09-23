// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:energia_dashboard/network/endpoints.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DistrictsPowerChart extends StatefulWidget {
  final double heightFactor;
  final String selectedRegion;

  DistrictsPowerChart({
    Key? key,
    this.heightFactor = 0.25,
    required this.selectedRegion,
  }) : super(key: key);

  @override
  State<DistrictsPowerChart> createState() => _DistrictsPowerChartState();
}

class _DistrictsPowerChartState extends State<DistrictsPowerChart> {
  List<DistrictData> data = [
    DistrictData('Ashanti Region', 20, 12),
    DistrictData('Greater Accra Region', 10, 30),
    DistrictData('Central Region', 15, 43),
    DistrictData('Northern Region', 8, 5),
    DistrictData('Western Region', 12, 10),
    DistrictData('Eastern Region', 9, 15),
    DistrictData('Volta Region', 11, 15),
    DistrictData('Brong-Ahafo Region', 7, 14),
    DistrictData('Upper East Region', 6, 2),
    DistrictData('Upper West Region', 5, 4),
  ];

  bool isLoading = false;

  Future<int> fetchDistrictsPowerAnalysis() async {
    // start loading
    setState(() {
      isLoading = true;
    });

    try {
      // Make API call
      var url = Uri.parse(APIEndpoints.powerByDistrictsInRegion);
      var response = await http.post(
        url,
        body: {
          "region": widget.selectedRegion,
        },
      );

      // stop loading
      setState(() {
        isLoading = false;
      });

      if (response.statusCode == 200) {
        var resData = jsonDecode(response.body);
        List<dynamic> districtPowerDataList = resData.map((data) {
          return DistrictData(
            data["district"] as String,
            data["power_generation"] as int,
            data["power_consumption"] as int,
          );
        }).toList();
        print(districtPowerDataList);
        setState(() {
          data = districtPowerDataList.cast<DistrictData>();
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
    fetchDistrictsPowerAnalysis();
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
                  title: AxisTitle(text: "Districts"),
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
                legend: const Legend(
                  title: LegendTitle(text: "Power Statistics for Districts"),
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
