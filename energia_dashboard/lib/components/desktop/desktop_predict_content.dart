import 'package:energia_dashboard/charts/desktop/power_chart.dart';
import 'package:energia_dashboard/components/desktop/desktop_footer.dart';
import 'package:flutter/material.dart';

class DesktopPredictContent extends StatefulWidget {
  const DesktopPredictContent({super.key});

  @override
  State<DesktopPredictContent> createState() => _DesktopPredictContentState();
}

class _DesktopPredictContentState extends State<DesktopPredictContent> {
  bool closeAlert = false;

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
                      "Predict",
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
              // const PopulationChart(),
              const SizedBox(height: 20),
              const Text(
                "Prediction of Power consumption and Generation",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              PowerChart(),
              const SizedBox(height: 20),
              const Text(
                "Analysis of Population Per Region",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              PowerChart(),
              const DesktopFooter(),
            ],
          ),
        ),
      ),
    );
  }
}
