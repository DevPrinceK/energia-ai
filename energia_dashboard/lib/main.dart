import 'package:energia_dashboard/screens/desktop/desktop_dashboard.dart';
import 'package:energia_dashboard/screens/mobile/mobile_dashboard.dart';
import 'package:energia_dashboard/screens/responsive.dart';
import 'package:energia_dashboard/screens/tablet/tablet_dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Energia AI Dashboard',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        primaryColor: Colors.white,
        useMaterial3: true,
      ),
      home: const ResponsiveScreen(
        mobile: MobileDashboard(),
        tablet: TabletDashboard(),
        desktop: DesktopDashboard(),
      ),
    );
  }
}
