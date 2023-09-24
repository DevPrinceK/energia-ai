import 'package:energia_dashboard/charts/desktop/districts_power_chart.dart';
import 'package:energia_dashboard/charts/desktop/dummy_chart.dart';
import 'package:energia_dashboard/charts/desktop/grid_power_chart.dart';
import 'package:energia_dashboard/charts/desktop/power_chart.dart';
import 'package:energia_dashboard/charts/desktop/town_power_chart.dart';
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
  String selectedRegion = "Ahafo Region";
  String selectedDistrict = "District One";
  String selectedTown = "Town One";
  String selectedGrid = "Grid One";
  String selectedMetric = "Power";
  String filterBy = "All";
  Widget activeChart = PowerChart(heightFactor: 0.3);

  List<String> regions = [
    "Ahafo Region",
    "Ashanti Region",
    "Bono East Region",
    "Brong-Ahafo Region",
    "Central Region",
    "Eastern Region",
    "Greater Accra Region",
    "North East Region",
    "Northern Region",
    "Oti Region",
    "Savannah Region",
    "Upper East Region",
    "Upper West Region",
    "Volta Region",
    "Western North Region",
    "Western Region",
  ];

  List<String> districts = [
    "Distric One",
    "Distric Two",
    "Distric Three",
    "Distric Four",
    "Distric Five",
  ];

  List<String> towns = [
    "Town One",
    "Town Two",
    "Town Three",
    "Town Four",
    "Town Five",
  ];

  List<String> grids = [
    "Grid One",
    "Grid Two",
    "Grid Three",
    "Grid Four",
    "Grid Five",
  ];

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
              // type of report - button groups
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: filterBy == "Regions"
                              ? MaterialStateProperty.all(Colors.blue)
                              : null),
                      onPressed: () {
                        setState(() {
                          filterBy = "Regions";
                        });
                      },
                      child: const Text("Regions"),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: filterBy == "Districts"
                              ? MaterialStateProperty.all(Colors.blue)
                              : null),
                      onPressed: () {
                        setState(() {
                          filterBy = "Districts";
                        });
                      },
                      child: const Text("Districts"),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: filterBy == "Towns"
                              ? MaterialStateProperty.all(Colors.blue)
                              : null),
                      onPressed: () {
                        setState(() {
                          filterBy = "Towns";
                        });
                      },
                      child: const Text("Towns"),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: filterBy == "Grids"
                              ? MaterialStateProperty.all(Colors.blue)
                              : null),
                      onPressed: () {
                        setState(() {
                          filterBy = "Grids";
                        });
                      },
                      child: const Text("Grids"),
                    ),
                    const SizedBox(width: 20),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text("Filter by $filterBy"),
              const SizedBox(height: 4),
              if (filterBy == "Districts")
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
                        items: regions.map((region) {
                          return DropdownMenuItem<String>(
                            value: region,
                            child: Text(region),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedRegion = value!;
                            activeChart = DummyChart(
                              heightFactor: 0.3,
                              selectedRegion: selectedRegion,
                            );
                          });
                        },
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                        dropdownColor: Colors.white,
                      ),
                      const SizedBox(width: 20),
                      const Spacer(),
                      Container(
                        height: 40,
                        width: 2,
                        color: Colors.grey[200],
                      ),
                      const Spacer(),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            // performingAnalysis = !performingAnalysis;
                            // remove current chart
                            activeChart = const Center(
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
                            );
                            // set the actual chart to be displayed
                            activeChart = DistrictsPowerChart(
                              heightFactor: 0.3,
                              selectedRegion: selectedRegion,
                            );
                          });
                        },
                        child: const Text("Generate Report"),
                      ),
                    ],
                  ),
                )
              else if (filterBy == "Towns")
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
                        items: regions.map((region) {
                          return DropdownMenuItem<String>(
                            value: region,
                            child: Text(region),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedRegion = value!;
                          });
                        },
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                        dropdownColor: Colors.white,
                      ),
                      const SizedBox(width: 20),
                      DropdownButton<String>(
                        value: selectedTown,
                        items: towns.map((region) {
                          return DropdownMenuItem<String>(
                            value: region,
                            child: Text(region),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedTown = value!;
                            // reset the chart widget
                            activeChart = DummyChart(
                              heightFactor: 0.3,
                              selectedRegion: selectedRegion,
                            );
                          });
                        },
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                        dropdownColor: Colors.white,
                      ),
                      const SizedBox(width: 20),
                      const Spacer(),
                      Container(
                        height: 40,
                        width: 2,
                        color: Colors.grey[200],
                      ),
                      const Spacer(),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            activeChart = TownPowerChart(
                              heightFactor: 0.3,
                              selectedRegion: selectedRegion,
                              selectedTown: selectedTown,
                            );
                          });
                        },
                        child: const Text("Generate Report"),
                      ),
                    ],
                  ),
                )
              else if (filterBy == "Grids")
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
                        items: regions.map((region) {
                          return DropdownMenuItem<String>(
                            value: region,
                            child: Text(region),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedRegion = value!;
                          });
                        },
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                        dropdownColor: Colors.white,
                      ),
                      const SizedBox(width: 20),
                      DropdownButton<String>(
                        value: selectedGrid,
                        items: grids.map((region) {
                          return DropdownMenuItem<String>(
                            value: region,
                            child: Text(region),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedGrid = value!;
                            // reset chart
                            activeChart = DummyChart(
                              heightFactor: 0.3,
                              selectedRegion: selectedRegion,
                            );
                          });
                        },
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                        dropdownColor: Colors.white,
                      ),
                      const SizedBox(width: 20),
                      const Spacer(),
                      Container(
                        height: 40,
                        width: 2,
                        color: Colors.grey[200],
                      ),
                      const Spacer(),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            // performingAnalysis = !performingAnalysis;
                            activeChart = GridPowerChart(
                              heightFactor: 0.3,
                              selectedRegion: selectedRegion,
                              selectedGrid: selectedGrid,
                            );
                          });
                        },
                        child: const Text("Generate Report"),
                      ),
                    ],
                  ),
                ),
              // HERE

              const SizedBox(height: 20),
              if (performingAnalysis == true)
                const Text("Analyzing Data...")
              else if (selectedMetric == "Population")
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
