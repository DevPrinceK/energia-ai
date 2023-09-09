import 'package:energia_dashboard/components/desktop/desktop_dashboard_main_content.dart';
import 'package:energia_dashboard/components/desktop/desktop_sidebar.dart';
import 'package:flutter/material.dart';

class DesktopDashboard extends StatelessWidget {
  const DesktopDashboard({super.key});

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
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "princesamuel@gmail.com",
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(width: 5),
                CircleAvatar(
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
            DesktopSidebar(),
            DesktopDashboardMainContent(),
          ],
        ),
      ),
    );
  }
}
