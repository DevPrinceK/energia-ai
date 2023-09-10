import 'package:energia_dashboard/screens/desktop/desktop_analyze.dart';
import 'package:energia_dashboard/screens/desktop/desktop_dashboard.dart';
import 'package:energia_dashboard/screens/desktop/desktop_forecast.dart';
import 'package:energia_dashboard/screens/desktop/desktop_predict.dart';
import 'package:flutter/material.dart';

class DesktopSidebar extends StatelessWidget {
  final bool dashboardActive;
  final bool analyzeActive;
  final bool predictActive;
  final bool forecastActive;
  const DesktopSidebar({
    super.key,
    this.dashboardActive = false,
    this.analyzeActive = false,
    this.predictActive = false,
    this.forecastActive = false,
  });

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return Container(
      // margin: const EdgeInsets.only(left: 20),
      width: deviceWidth * 0.2,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(230, 230, 230, 1),
      ),
      child: Column(
        children: [
          const SizedBox(height: 30),
          ListTile(
            selectedTileColor: Colors.black87,
            leading: const Icon(Icons.dashboard),
            title: const Text("Dashboard"),
            selected: dashboardActive,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const DesktopDashboard();
                  },
                ),
              );
            },
          ),
          ListTile(
            selectedTileColor: Colors.black87,
            leading: const Icon(Icons.analytics),
            title: const Text("Analysis"),
            selected: analyzeActive,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const DesktopAnalyze();
                  },
                ),
              );
            },
          ),
          ListTile(
            selectedTileColor: Colors.black87,
            leading: const Icon(Icons.lan_sharp),
            title: const Text("Prediction"),
            selected: predictActive,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const DesktopPredict();
                  },
                ),
              );
            },
          ),
          ListTile(
            selectedTileColor: Colors.black87,
            leading: const Icon(Icons.timeline_outlined),
            title: const Text("Forecast"),
            selected: forecastActive,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const DesktopForecast();
                  },
                ),
              );
            },
          ),
          const Spacer(),
          const ListTile(
            selectedTileColor: Colors.red,
            leading: Icon(Icons.power_settings_new_outlined),
            title: Text("Sign Out"),
          ),
        ],
      ),
    );
  }
}
