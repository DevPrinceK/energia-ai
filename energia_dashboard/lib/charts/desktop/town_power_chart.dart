// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:energia_dashboard/network/endpoints.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TownPowerChart extends StatefulWidget {
  final double heightFactor;
  final String selectedRegion;
  final String selectedTown;

  TownPowerChart({
    Key? key,
    required this.selectedRegion,
    required this.selectedTown,
    this.heightFactor = 0.25,
  }) : super(key: key);

  @override
  State<TownPowerChart> createState() => _TownPowerChartState();
}

class _TownPowerChartState extends State<TownPowerChart> {
  int consumption = 100;
  int generation = 200;
  bool isLoading = false;

  Future<int> fetchTownPowerAnalysis() async {
    // start loading
    setState(() {
      isLoading = true;
    });

    try {
      // Make API call
      var url = Uri.parse(APIEndpoints.townPowerAnalysis);
      var response = await http.post(
        url,
        body: {
          "region": widget.selectedRegion,
          "town": widget.selectedTown,
        },
      );

      // stop loading
      setState(() {
        isLoading = false;
      });

      if (response.statusCode == 200) {
        var resData = jsonDecode(response.body);
        var resCon = resData["power_consumption"];
        var resGen = resData["power_generation"];
        setState(() {
          consumption = resCon;
          generation = resGen;
        });
        return response.statusCode;
      } else {
        print(response.statusCode);
        print(response.reasonPhrase);
        return response.statusCode;
      }
    } catch (e) {
      print("And Error Occurred");
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
    fetchTownPowerAnalysis();
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
              child: SfCircularChart(
                title: ChartTitle(text: 'Consumption vs Generation'),
                series: <CircularSeries<_ChartData, String>>[
                  DoughnutSeries<_ChartData, String>(
                    dataSource: <_ChartData>[
                      _ChartData('Consumption', consumption, Colors.red),
                      _ChartData('Generation', generation, Colors.yellowAccent),
                    ],
                    explode: true,
                    xValueMapper: (_ChartData data, _) => data.category,
                    yValueMapper: (_ChartData data, _) => data.value,
                    pointColorMapper: (data, index) => data.color,
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
                  title: LegendTitle(text: 'Consumption vs Generation'),
                  isVisible: true,
                  position: LegendPosition.right,
                ),
              ),
            ),
    );
  }
}

class _ChartData {
  final String category;
  final int value;
  final Color color;

  _ChartData(this.category, this.value, this.color);
}
