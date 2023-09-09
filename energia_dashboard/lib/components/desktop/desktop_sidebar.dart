import 'package:flutter/material.dart';

class DesktopSidebar extends StatelessWidget {
  const DesktopSidebar({super.key});

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
            selectedColor: Colors.white,
            leading: const Icon(Icons.dashboard),
            title: const Text("Dashboard"),
            onTap: () {},
          ),
          const InkWell(
            child: ListTile(
              leading: Icon(Icons.analytics),
              title: Text("Analysis"),
            ),
          ),
          const InkWell(
            child: ListTile(
              leading: Icon(Icons.lan_sharp),
              title: Text("Prediction"),
            ),
          ),
          const InkWell(
            child: ListTile(
              leading: Icon(Icons.timeline_outlined),
              title: Text("Forecast"),
            ),
          ),
          const Spacer(),
          const InkWell(
            child: ListTile(
              leading: Icon(Icons.power_settings_new_outlined),
              title: Text("Sign Out"),
            ),
          ),
        ],
      ),
    );
  }
}
