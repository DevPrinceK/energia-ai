import 'package:energia_dashboard/components/desktop/desktop_footer.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class DesktopForecastContent extends StatefulWidget {
  const DesktopForecastContent({Key? key});

  @override
  State<DesktopForecastContent> createState() => _DesktopForecastContentState();
}

class _DesktopForecastContentState extends State<DesktopForecastContent> {
  bool closeAlert = false;
  bool isLoading = false;
  String filterBy = "Today"; // other values: "Next 7 Days", "Next 30 Days"
  List<Map<String, dynamic>> forecastData = [];

  // today's forecast data
  List<Map<String, dynamic>> dailyForecastData = [
    {
      "date": "2023-09-24",
      "consumption": Random().nextInt(500) + 500,
      "generation": Random().nextInt(500) + 500,
      "region": "Region 1",
      "grid": "Grid 1",
      "power_outage": "Yes"
    },
    {
      "date": "2023-09-24",
      "consumption": Random().nextInt(500) + 500,
      "generation": Random().nextInt(500) + 500,
      "region": "Region 2",
      "grid": "Grid 2",
      "power_outage": "No"
    },
    {
      "date": "2023-09-24",
      "consumption": Random().nextInt(500) + 500,
      "generation": Random().nextInt(500) + 500,
      "region": "Region 3",
      "grid": "Grid 3",
      "power_outage": "Yes"
    },
    {
      "date": "2023-09-24",
      "consumption": Random().nextInt(500) + 500,
      "generation": Random().nextInt(500) + 500,
      "region": "Region 4",
      "grid": "Grid 4",
      "power_outage": "Yes"
    },
    {
      "date": "2023-09-24",
      "consumption": Random().nextInt(500) + 500,
      "generation": Random().nextInt(500) + 500,
      "region": "Region 5",
      "grid": "Grid 5",
      "power_outage": "No"
    },
  ];

  // next 7 days forecast data
  List<Map<String, dynamic>> thisWeekForecastData = [
    {
      "date": "2023-09-24",
      "consumption": Random().nextInt(500) + 500,
      "generation": Random().nextInt(500) + 500,
      "region": "Region 1",
      "grid": "Grid 1",
      "power_outage": "Yes"
    },
    {
      "date": "2023-09-24",
      "consumption": Random().nextInt(500) + 500,
      "generation": Random().nextInt(500) + 500,
      "region": "Region 2",
      "grid": "Grid 2",
      "power_outage": "No"
    },
    {
      "date": "2023-09-24",
      "consumption": Random().nextInt(500) + 500,
      "generation": Random().nextInt(500) + 500,
      "region": "Region 3",
      "grid": "Grid 3",
      "power_outage": "Yes"
    },
    {
      "date": "2023-09-24",
      "consumption": Random().nextInt(500) + 500,
      "generation": Random().nextInt(500) + 500,
      "region": "Region 4",
      "grid": "Grid 4",
      "power_outage": "Yes"
    },
    {
      "date": "2023-09-24",
      "consumption": Random().nextInt(500) + 500,
      "generation": Random().nextInt(500) + 500,
      "region": "Region 5",
      "grid": "Grid 5",
      "power_outage": "No"
    },
    {
      "date": "2023-09-25",
      "consumption": Random().nextInt(500) + 500,
      "generation": Random().nextInt(500) + 500,
      "region": "Region 1",
      "grid": "Grid 1",
      "power_outage": "Yes"
    },
    {
      "date": "2023-09-25",
      "consumption": Random().nextInt(500) + 500,
      "generation": Random().nextInt(500) + 500,
      "region": "Region 2",
      "grid": "Grid 2",
      "power_outage": "No"
    },
    {
      "date": "2023-09-25",
      "consumption": Random().nextInt(500) + 500,
      "generation": Random().nextInt(500) + 500,
      "region": "Region 3",
      "grid": "Grid 3",
      "power_outage": "Yes"
    },
    {
      "date": "2023-09-25",
      "consumption": Random().nextInt(500) + 500,
      "generation": Random().nextInt(500) + 500,
      "region": "Region 4",
      "grid": "Grid 4",
      "power_outage": "Yes"
    },
    {
      "date": "2023-09-25",
      "consumption": Random().nextInt(500) + 500,
      "generation": Random().nextInt(500) + 500,
      "region": "Region 5",
      "grid": "Grid 5",
      "power_outage": "No"
    },
    {
      "date": "2023-09-26",
      "consumption": Random().nextInt(500) + 500,
      "generation": Random().nextInt(500) + 500,
      "region": "Region 1",
      "grid": "Grid 1",
      "power_outage": "Yes"
    },
    {
      "date": "2023-09-26",
      "consumption": Random().nextInt(500) + 500,
      "generation": Random().nextInt(500) + 500,
      "region": "Region 2",
      "grid": "Grid 2",
      "power_outage": "No"
    },
    {
      "date": "2023-09-26",
      "consumption": Random().nextInt(500) + 500,
      "generation": Random().nextInt(500) + 500,
      "region": "Region 3",
      "grid": "Grid 3",
      "power_outage": "Yes"
    },
    {
      "date": "2023-09-26",
      "consumption": Random().nextInt(500) + 500,
      "generation": Random().nextInt(500) + 500,
      "region": "Region 4",
      "grid": "Grid 4",
      "power_outage": "Yes"
    },
    {
      "date": "2023-09-26",
      "consumption": Random().nextInt(500) + 500,
      "generation": Random().nextInt(500) + 500,
      "region": "Region 5",
      "grid": "Grid 5",
      "power_outage": "No"
    },
    {
      "date": "2023-09-27",
      "consumption": Random().nextInt(500) + 500,
      "generation": Random().nextInt(500) + 500,
      "region": "Region 1",
      "grid": "Grid 1",
      "power_outage": "Yes"
    },
    {
      "date": "2023-09-27",
      "consumption": Random().nextInt(500) + 500,
      "generation": Random().nextInt(500) + 500,
      "region": "Region 2",
      "grid": "Grid 2",
      "power_outage": "No"
    },
    {
      "date": "2023-09-27",
      "consumption": Random().nextInt(500) + 500,
      "generation": Random().nextInt(500) + 500,
      "region": "Region 3",
      "grid": "Grid 3",
      "power_outage": "Yes"
    },
    {
      "date": "2023-09-27",
      "consumption": Random().nextInt(500) + 500,
      "generation": Random().nextInt(500) + 500,
      "region": "Region 4",
      "grid": "Grid 4",
      "power_outage": "Yes"
    },
    {
      "date": "2023-09-27",
      "consumption": Random().nextInt(500) + 500,
      "generation": Random().nextInt(500) + 500,
      "region": "Region 5",
      "grid": "Grid 5",
      "power_outage": "No"
    },
    {
      "date": "2023-09-28",
      "consumption": Random().nextInt(500) + 500,
      "generation": Random().nextInt(500) + 500,
      "region": "Region 1",
      "grid": "Grid 1",
      "power_outage": "Yes"
    },
    {
      "date": "2023-09-28",
      "consumption": Random().nextInt(500) + 500,
      "generation": Random().nextInt(500) + 500,
      "region": "Region 2",
      "grid": "Grid 2",
      "power_outage": "No"
    },
    {
      "date": "2023-09-28",
      "consumption": Random().nextInt(500) + 500,
      "generation": Random().nextInt(500) + 500,
      "region": "Region 3",
      "grid": "Grid 3",
      "power_outage": "Yes"
    },
    {
      "date": "2023-09-28",
      "consumption": Random().nextInt(500) + 500,
      "generation": Random().nextInt(500) + 500,
      "region": "Region 4",
      "grid": "Grid 4",
      "power_outage": "Yes"
    },
    {
      "date": "2023-09-28",
      "consumption": Random().nextInt(500) + 500,
      "generation": Random().nextInt(500) + 500,
      "region": "Region 5",
      "grid": "Grid 5",
      "power_outage": "No"
    },
  ];

  // next 30 days forecast data
  List<Map<String, dynamic>> thisMonthForecastData = [
    {
      "date": "2023-09-24",
      "consumption": Random().nextInt(500) + 500,
      "generation": Random().nextInt(500) + 500,
      "region": "Region 1",
      "grid": "Grid 1",
      "power_outage": "Yes"
    },
    {
      "date": "2023-09-24",
      "consumption": Random().nextInt(500) + 500,
      "generation": Random().nextInt(500) + 500,
      "region": "Region 2",
      "grid": "Grid 2",
      "power_outage": "No"
    },
    {
      "date": "2023-09-24",
      "consumption": Random().nextInt(500) + 500,
      "generation": Random().nextInt(500) + 500,
      "region": "Region 3",
      "grid": "Grid 3",
      "power_outage": "Yes"
    },
    {
      "date": "2023-09-24",
      "consumption": Random().nextInt(500) + 500,
      "generation": Random().nextInt(500) + 500,
      "region": "Region 4",
      "grid": "Grid 4",
      "power_outage": "Yes"
    },
    {
      "date": "2023-09-24",
      "consumption": Random().nextInt(500) + 500,
      "generation": Random().nextInt(500) + 500,
      "region": "Region 5",
      "grid": "Grid 5",
      "power_outage": "No"
    },
    {
      "date": "2023-09-25",
      "consumption": Random().nextInt(500) + 500,
      "generation": Random().nextInt(500) + 500,
      "region": "Region 1",
      "grid": "Grid 1",
      "power_outage": "Yes"
    },
    {
      "date": "2023-09-25",
      "consumption": Random().nextInt(500) + 500,
      "generation": Random().nextInt(500) + 500,
      "region": "Region 2",
      "grid": "Grid 2",
      "power_outage": "No"
    },
    {
      "date": "2023-09-25",
      "consumption": Random().nextInt(500) + 500,
      "generation": Random().nextInt(500) + 500,
      "region": "Region 3",
      "grid": "Grid 3",
      "power_outage": "Yes"
    },
    {
      "date": "2023-09-25",
      "consumption": Random().nextInt(500) + 500,
      "generation": Random().nextInt(500) + 500,
      "region": "Region 4",
      "grid": "Grid 4",
      "power_outage": "Yes"
    },
    {
      "date": "2023-09-25",
      "consumption": Random().nextInt(500) + 500,
      "generation": Random().nextInt(500) + 500,
      "region": "Region 5",
      "grid": "Grid 5",
      "power_outage": "No"
    },
    {
      "date": "2023-09-26",
      "consumption": Random().nextInt(500) + 500,
      "generation": Random().nextInt(500) + 500,
      "region": "Region 1",
      "grid": "Grid 1",
      "power_outage": "Yes"
    },
    {
      "date": "2023-09-26",
      "consumption": Random().nextInt(500) + 500,
      "generation": Random().nextInt(500) + 500,
      "region": "Region 2",
      "grid": "Grid 2",
      "power_outage": "No"
    },
    {
      "date": "2023-09-26",
      "consumption": Random().nextInt(500) + 500,
      "generation": Random().nextInt(500) + 500,
      "region": "Region 3",
      "grid": "Grid 3",
      "power_outage": "Yes"
    },
    {
      "date": "2023-09-26",
      "consumption": Random().nextInt(500) + 500,
      "generation": Random().nextInt(500) + 500,
      "region": "Region 4",
      "grid": "Grid 4",
      "power_outage": "Yes"
    },
    {
      "date": "2023-09-26",
      "consumption": Random().nextInt(500) + 500,
      "generation": Random().nextInt(500) + 500,
      "region": "Region 5",
      "grid": "Grid 5",
      "power_outage": "No"
    },
    {
      "date": "2023-09-27",
      "consumption": Random().nextInt(500) + 500,
      "generation": Random().nextInt(500) + 500,
      "region": "Region 1",
      "grid": "Grid 1",
      "power_outage": "Yes"
    },
    {
      "date": "2023-09-27",
      "consumption": Random().nextInt(500) + 500,
      "generation": Random().nextInt(500) + 500,
      "region": "Region 2",
      "grid": "Grid 2",
      "power_outage": "No"
    },
    {
      "date": "2023-09-27",
      "consumption": Random().nextInt(500) + 500,
      "generation": Random().nextInt(500) + 500,
      "region": "Region 3",
      "grid": "Grid 3",
      "power_outage": "Yes"
    },
    {
      "date": "2023-09-27",
      "consumption": Random().nextInt(500) + 500,
      "generation": Random().nextInt(500) + 500,
      "region": "Region 4",
      "grid": "Grid 4",
      "power_outage": "Yes"
    },
    {
      "date": "2023-09-27",
      "consumption": Random().nextInt(500) + 500,
      "generation": Random().nextInt(500) + 500,
      "region": "Region 5",
      "grid": "Grid 5",
      "power_outage": "No"
    },
    {
      "date": "2023-09-28",
      "consumption": Random().nextInt(500) + 500,
      "generation": Random().nextInt(500) + 500,
      "region": "Region 1",
      "grid": "Grid 1",
      "power_outage": "Yes"
    },
    {
      "date": "2023-09-28",
      "consumption": Random().nextInt(500) + 500,
      "generation": Random().nextInt(500) + 500,
      "region": "Region 2",
      "grid": "Grid 2",
      "power_outage": "No"
    },
    {
      "date": "2023-09-28",
      "consumption": Random().nextInt(500) + 500,
      "generation": Random().nextInt(500) + 500,
      "region": "Region 3",
      "grid": "Grid 3",
      "power_outage": "Yes"
    },
    {
      "date": "2023-09-28",
      "consumption": Random().nextInt(500) + 500,
      "generation": Random().nextInt(500) + 500,
      "region": "Region 4",
      "grid": "Grid 4",
      "power_outage": "Yes"
    },
    {
      "date": "2023-09-28",
      "consumption": Random().nextInt(500) + 500,
      "generation": Random().nextInt(500) + 500,
      "region": "Region 5",
      "grid": "Grid 5",
      "power_outage": "No"
    },
    {
      "date": "2023-09-24",
      "consumption": Random().nextInt(500) + 500,
      "generation": Random().nextInt(500) + 500,
      "region": "Region 1",
      "grid": "Grid 1",
      "power_outage": "Yes"
    },
    {
      "date": "2023-09-24",
      "consumption": Random().nextInt(500) + 500,
      "generation": Random().nextInt(500) + 500,
      "region": "Region 2",
      "grid": "Grid 2",
      "power_outage": "No"
    },
    {
      "date": "2023-09-24",
      "consumption": Random().nextInt(500) + 500,
      "generation": Random().nextInt(500) + 500,
      "region": "Region 3",
      "grid": "Grid 3",
      "power_outage": "Yes"
    },
    {
      "date": "2023-09-24",
      "consumption": Random().nextInt(500) + 500,
      "generation": Random().nextInt(500) + 500,
      "region": "Region 4",
      "grid": "Grid 4",
      "power_outage": "Yes"
    },
    {
      "date": "2023-09-24",
      "consumption": Random().nextInt(500) + 500,
      "generation": Random().nextInt(500) + 500,
      "region": "Region 5",
      "grid": "Grid 5",
      "power_outage": "No"
    },
    {
      "date": "2023-09-25",
      "consumption": Random().nextInt(500) + 500,
      "generation": Random().nextInt(500) + 500,
      "region": "Region 1",
      "grid": "Grid 1",
      "power_outage": "Yes"
    },
    {
      "date": "2023-09-25",
      "consumption": Random().nextInt(500) + 500,
      "generation": Random().nextInt(500) + 500,
      "region": "Region 2",
      "grid": "Grid 2",
      "power_outage": "No"
    },
    {
      "date": "2023-09-25",
      "consumption": Random().nextInt(500) + 500,
      "generation": Random().nextInt(500) + 500,
      "region": "Region 3",
      "grid": "Grid 3",
      "power_outage": "Yes"
    },
    {
      "date": "2023-09-25",
      "consumption": Random().nextInt(500) + 500,
      "generation": Random().nextInt(500) + 500,
      "region": "Region 4",
      "grid": "Grid 4",
      "power_outage": "Yes"
    },
    {
      "date": "2023-09-25",
      "consumption": Random().nextInt(500) + 500,
      "generation": Random().nextInt(500) + 500,
      "region": "Region 5",
      "grid": "Grid 5",
      "power_outage": "No"
    },
    {
      "date": "2023-09-26",
      "consumption": Random().nextInt(500) + 500,
      "generation": Random().nextInt(500) + 500,
      "region": "Region 1",
      "grid": "Grid 1",
      "power_outage": "Yes"
    },
    {
      "date": "2023-09-26",
      "consumption": Random().nextInt(500) + 500,
      "generation": Random().nextInt(500) + 500,
      "region": "Region 2",
      "grid": "Grid 2",
      "power_outage": "No"
    },
    {
      "date": "2023-09-26",
      "consumption": Random().nextInt(500) + 500,
      "generation": Random().nextInt(500) + 500,
      "region": "Region 3",
      "grid": "Grid 3",
      "power_outage": "Yes"
    },
    {
      "date": "2023-09-26",
      "consumption": Random().nextInt(500) + 500,
      "generation": Random().nextInt(500) + 500,
      "region": "Region 4",
      "grid": "Grid 4",
      "power_outage": "Yes"
    },
    {
      "date": "2023-09-26",
      "consumption": Random().nextInt(500) + 500,
      "generation": Random().nextInt(500) + 500,
      "region": "Region 5",
      "grid": "Grid 5",
      "power_outage": "No"
    },
    {
      "date": "2023-09-27",
      "consumption": Random().nextInt(500) + 500,
      "generation": Random().nextInt(500) + 500,
      "region": "Region 1",
      "grid": "Grid 1",
      "power_outage": "Yes"
    },
    {
      "date": "2023-09-27",
      "consumption": Random().nextInt(500) + 500,
      "generation": Random().nextInt(500) + 500,
      "region": "Region 2",
      "grid": "Grid 2",
      "power_outage": "No"
    },
    {
      "date": "2023-09-27",
      "consumption": Random().nextInt(500) + 500,
      "generation": Random().nextInt(500) + 500,
      "region": "Region 3",
      "grid": "Grid 3",
      "power_outage": "Yes"
    },
    {
      "date": "2023-09-27",
      "consumption": Random().nextInt(500) + 500,
      "generation": Random().nextInt(500) + 500,
      "region": "Region 4",
      "grid": "Grid 4",
      "power_outage": "Yes"
    },
    {
      "date": "2023-09-27",
      "consumption": Random().nextInt(500) + 500,
      "generation": Random().nextInt(500) + 500,
      "region": "Region 5",
      "grid": "Grid 5",
      "power_outage": "No"
    },
    {
      "date": "2023-09-28",
      "consumption": Random().nextInt(500) + 500,
      "generation": Random().nextInt(500) + 500,
      "region": "Region 1",
      "grid": "Grid 1",
      "power_outage": "Yes"
    },
    {
      "date": "2023-09-28",
      "consumption": Random().nextInt(500) + 500,
      "generation": Random().nextInt(500) + 500,
      "region": "Region 2",
      "grid": "Grid 2",
      "power_outage": "No"
    },
    {
      "date": "2023-09-28",
      "consumption": Random().nextInt(500) + 500,
      "generation": Random().nextInt(500) + 500,
      "region": "Region 3",
      "grid": "Grid 3",
      "power_outage": "Yes"
    },
    {
      "date": "2023-09-28",
      "consumption": Random().nextInt(500) + 500,
      "generation": Random().nextInt(500) + 500,
      "region": "Region 4",
      "grid": "Grid 4",
      "power_outage": "Yes"
    },
    {
      "date": "2023-09-28",
      "consumption": Random().nextInt(500) + 500,
      "generation": Random().nextInt(500) + 500,
      "region": "Region 5",
      "grid": "Grid 5",
      "power_outage": "No"
    },
  ];

  Future<int> makeForecast(String typeOfForecast) async {
    print("Forecasting...");
    // start loading
    setState(() {
      isLoading = true;
    });

    // simulate loading for 3 seconds
    await Future.delayed(const Duration(seconds: 3));

    // stop loading
    setState(() {
      isLoading = false;
    });

    // check type of forecast
    if (typeOfForecast == "Today") {
      setState(() {
        forecastData = dailyForecastData;
      });
    } else if (typeOfForecast == "Next 7 Days") {
      setState(() {
        forecastData = thisWeekForecastData;
      });
    } else if (typeOfForecast == "Next 30 Days") {
      setState(() {
        forecastData = thisMonthForecastData;
      });
    }

    return 1;
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      forecastData = dailyForecastData;
    });
  }

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
                      "Forecast",
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
                            child: Text("Welcome to the prediction pane"),
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
              // filter by widget
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
                          backgroundColor: filterBy == "Today"
                              ? MaterialStateProperty.all(Colors.blue)
                              : null),
                      onPressed: () {
                        setState(() {
                          filterBy = "Today";
                          makeForecast(filterBy);
                        });
                      },
                      child: const Text("Forecast Today"),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: filterBy == "Next 7 Days"
                              ? MaterialStateProperty.all(Colors.blue)
                              : null),
                      onPressed: () {
                        setState(() {
                          filterBy = "Next 7 Days";
                          makeForecast(filterBy);
                        });
                      },
                      child: const Text("Forecast Next 7 Days"),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: filterBy == "Next 30 Days"
                              ? MaterialStateProperty.all(Colors.blue)
                              : null),
                      onPressed: () {
                        setState(() {
                          filterBy = "Next 30 Days";
                          makeForecast(filterBy);
                        });
                      },
                      child: const Text("Forecast Next 30 Days"),
                    ),
                    const SizedBox(width: 20),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Forecast of Power consumption and Generation for $filterBy",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              // forecasted items
              ListView.builder(
                shrinkWrap: true,
                itemCount: forecastData.length,
                itemBuilder: (context, index) {
                  final item = forecastData[index];
                  return Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    margin: const EdgeInsets.only(bottom: 10),
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Info
                        isLoading
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
                                        "Forecasting...",
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Date: ${item['date']}",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Consumption: ${item['consumption']}",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Generation: ${item['generation']}",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Region: ${item['region']}",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Grid: ${item['grid']}",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),

                        // Graph/image/power outage icon
                        isLoading
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
                                        "Forecasting...",
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image(
                                    image: AssetImage(
                                      item['power_outage'] == "No"
                                          ? "assets/images/light-on-2.png"
                                          : "assets/images/light-off-2.png",
                                    ),
                                    height: 100,
                                    width: 100,
                                  ),
                                  Text("Power Outage: ${item['power_outage']}"),
                                ],
                              ),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              const DesktopFooter(),
            ],
          ),
        ),
      ),
    );
  }
}
