import 'package:energia_dashboard/components/desktop/desktop_forecast_content.dart';
import 'package:energia_dashboard/components/desktop/desktop_sidebar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DesktopForecast extends StatefulWidget {
  const DesktopForecast({super.key});

  @override
  State<DesktopForecast> createState() => _DesktopForecastState();
}

class _DesktopForecastState extends State<DesktopForecast> {
  String userFullname = "";
  String userEmail = "";
  String userToken = "";

  void getUserInfo() async {
    // initialize shared preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userEmail = prefs.getString("email")!;
      userFullname = prefs.getString("fullname")!;
      userToken = prefs.getString("token")!;
    });
  }

  @override
  void initState() {
    super.initState();
    getUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          margin: const EdgeInsets.only(left: 20),
          child: Image.asset("assets/images/logo.jpg"),
        ),
        title: const Text(
          'Energia AI',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 1,
        centerTitle: true,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            height: 50,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
              color: Colors.black,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  userEmail,
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(width: 5),
                const CircleAvatar(
                  child: Icon(Icons.person),
                ),
              ],
            ),
          )
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
        child: Row(
          children: [
            DesktopSidebar(forecastActive: true),
            DesktopForecastContent(),
          ],
        ),
      ),
    );
  }
}
