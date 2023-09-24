// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:energia_dashboard/network/endpoints.dart';
import 'package:energia_dashboard/screens/desktop/desktop_analyze.dart';
import 'package:energia_dashboard/screens/desktop/desktop_dashboard.dart';
import 'package:energia_dashboard/screens/desktop/desktop_forecast.dart';
import 'package:energia_dashboard/screens/desktop/desktop_login.dart';
import 'package:energia_dashboard/screens/desktop/desktop_predict.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class DesktopSidebar extends StatefulWidget {
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
  State<DesktopSidebar> createState() => _DesktopSidebarState();
}

class _DesktopSidebarState extends State<DesktopSidebar> {
  bool isLoggingOut = false;
  // logout user
  Future<int> logout(BuildContext context) async {
    setState(() {
      isLoggingOut = true;
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');

    try {
      var url = Uri.parse(APIEndpoints.logout);
      var response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Token ${token.toString()}",
        },
      );
      print("Token is: $token");
      setState(() {
        isLoggingOut = false;
      });
      if (response.statusCode == 204) {
        print("Logout Successful");
        print("Status Code: ${response.statusCode}");
        prefs.remove("token");
        prefs.remove("fullname");
        prefs.remove("email");
        prefs.remove("isLoggedIn");
        return response.statusCode;
      } else {
        print('Request failed with status: ${response.statusCode}.');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("An Error Occurred: ${response.reasonPhrase}"),
          ),
        );
        return response.statusCode;
      }
    } catch (error) {
      print('Error: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("An Error Occurred: $error"),
        ),
      );
      setState(() {
        isLoggingOut = false;
      });
      return -1; // You can return a custom error code or handle it as needed.
    }
  }

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
            selected: widget.dashboardActive,
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
            selected: widget.analyzeActive,
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
            selected: widget.predictActive,
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
            selected: widget.forecastActive,
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
          ListTile(
            selectedTileColor: Colors.red,
            leading: const Icon(Icons.power_settings_new_outlined),
            title: isLoggingOut
                ? const CircularProgressIndicator(
                    color: Colors.black,
                  )
                : const Text("Sign Out"),
            onTap: () async {
              var res = await logout(context);
              if (res == 204) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const DesktopLogin();
                    },
                  ),
                );
                return;
              }
            },
          ),
        ],
      ),
    );
  }
}
