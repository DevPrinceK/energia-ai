import 'package:energia_dashboard/charts/desktop/districts_chart.dart';
import 'package:energia_dashboard/charts/desktop/population_chart.dart';
import 'package:energia_dashboard/charts/desktop/power_chart.dart';
import 'package:energia_dashboard/charts/desktop/towns_chart.dart';
import 'package:energia_dashboard/components/desktop/desktop_footer.dart';
import 'package:flutter/material.dart';

class DesktopAnalyzeContent extends StatefulWidget {
  const DesktopAnalyzeContent({super.key});

  @override
  State<DesktopAnalyzeContent> createState() => _DesktopAnalyzeContentState();
}

class _DesktopAnalyzeContentState extends State<DesktopAnalyzeContent> {
  bool closeAlert = false;
  bool performingAnalysis = false;
  String selectedRegion = "Region";
  String selectedMetric = "Power";
  Widget activeChart = PowerChart(heightFactor: 0.3);

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: deviceWidth * 0.75,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Row(
                children: [
                  const Text(
                    "Dashboard  /",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Analysis",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10),
              closeAlert
                  ? const SizedBox(height: 0)
                  : Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(230, 230, 230, 1),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      height: 50,
                      width: deviceWidth * 0.75,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Expanded(
                            child: Text("Welcome to the analysis pane"),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                closeAlert = true;
                              });
                            },
                            icon: const Icon(
                              Icons.close,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0, 1),
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    DropdownButton<String>(
                      value: selectedRegion,
                      items: const [
                        DropdownMenuItem(
                          value: "Region",
                          child: Text("Region"),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          selectedRegion = value!;
                        });
                      },
                      style: const TextStyle(
                        color: Colors.black, // Set the text color
                        fontSize: 16, // Set the text size
                      ),
                      dropdownColor:
                          Colors.white, // Set the dropdown background color
                    ),
                    const SizedBox(width: 20),
                    DropdownButton<String>(
                      value: selectedMetric,
                      items: const [
                        DropdownMenuItem(
                          value: "Power",
                          child: Text("Power"),
                        ),
                        DropdownMenuItem(
                          value: "Districts",
                          child: Text("Districts"),
                        ),
                        DropdownMenuItem(
                          value: "Towns",
                          child: Text("Towns"),
                        ),
                        DropdownMenuItem(
                          value: "Population",
                          child: Text("Population"),
                        ),
                      ],
                      onChanged: (value) {
                        if (value == "Population") {
                          setState(() {
                            activeChart = PopulationChart(heightFactor: 0.4);
                          });
                        } else if (value == "Towns") {
                          setState(
                            () {
                              activeChart = TownChart(heightFactor: 0.3);
                            },
                          );
                        } else if (value == "Districts") {
                          setState(() {
                            activeChart = DistrictsChart(heightFactor: 0.3);
                          });
                        } else {
                          setState(() {
                            activeChart = PowerChart(heightFactor: 0.3);
                          });
                        }
                        setState(() {
                          selectedMetric = value!;
                        });
                      },
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                      dropdownColor: Colors.white,
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          performingAnalysis = !performingAnalysis;
                        });
                      },
                      child: const Text("Generate Report"),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              if (selectedMetric == "Population")
                const Text(
                  "Analysis of Population by Region",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              else if (selectedMetric == "Towns")
                const Text("Analysis of Towns by Region")
              else if (selectedMetric == "Districts")
                const Text("Analysis of Districts by Region")
              else
                const Text(
                  "Analysis of Power consumption and Generation",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              performingAnalysis
                  ? const Center(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            height: 400,
                            width: 400,
                            child: CircularProgressIndicator(),
                          ),
                          Center(
                            child: Text(
                              "Generating Report...",
                            ),
                          ),
                        ],
                      ),
                    )
                  : activeChart,
              const SizedBox(height: 20),
              const DesktopFooter(),
            ],
          ),
        ),
      ),
    );
  }
}
