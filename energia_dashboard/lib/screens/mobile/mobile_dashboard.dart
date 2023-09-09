// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, library_private_types_in_public_api, use_key_in_widget_constructors

import 'package:energia_dashboard/screens/mobile/tabs/analysis_tab.dart';
import 'package:energia_dashboard/screens/mobile/tabs/dashboard_tab.dart';
import 'package:energia_dashboard/screens/mobile/tabs/forcast_tab.dart';
import 'package:energia_dashboard/screens/mobile/tabs/prediction_tab.dart';
import 'package:energia_dashboard/screens/mobile/tabs/profile_tab.dart';
import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class MobileDashboard extends StatefulWidget {
  const MobileDashboard({Key? key}) : super(key: key);

  @override
  _MobileDashboardState createState() => _MobileDashboardState();
}

class _MobileDashboardState extends State<MobileDashboard> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Image.asset(
            'assets/images/logo.jpg',
            width: 40,
          ),
        ),
        title: const Text(
          'Energia AI',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Icon(Icons.person),
            ),
          )
        ],
        centerTitle: true,
      ),
      body: _buildScreen(_currentIndex),
      bottomNavigationBar: ConvexAppBar(
        items: [
          TabItem(icon: Icons.home, title: 'Dashboard'),
          TabItem(icon: Icons.location_on, title: 'Prediction'),
          TabItem(icon: Icons.analytics, title: 'Analysis'),
          TabItem(icon: Icons.cloud, title: 'Forecast'),
          TabItem(icon: Icons.people, title: 'Profile'),
        ],
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

  Widget _buildScreen(int index) {
    switch (index) {
      case 0:
        return DashboardScreen();
      case 1:
        return PredictionScreen();
      case 2:
        return AnalysisScreen();
      case 3:
        return ForecastScreen();
      case 4:
        return ProfileScreen();
      default:
        return Container();
    }
  }
}
