// // FOR SAFE KEEPING
// // MAY REFER BACK LATER

// import 'package:energia_dashboard/charts/desktop/population_chart.dart';
// import 'package:flutter/material.dart';

// import '../../../charts/desktop/districts_chart.dart';
// import '../../../charts/desktop/towns_chart.dart';

// class MyWidget extends StatefulWidget {
//   const MyWidget({super.key});

//   @override
//   State<MyWidget> createState() => _MyWidgetState();
// }

// class _MyWidgetState extends State<MyWidget> {
//   get selectedMetric => null;

//   @override
//   Widget build(BuildContext context) {
//     return DropdownButton<String>(
//                       value: selectedMetric,
//                       items: const [
//                         DropdownMenuItem(
//                           value: "Power",
//                           child: Text("Power"),
//                         ),
//                         DropdownMenuItem(
//                           value: "Districts",
//                           child: Text("Districts"),
//                         ),
//                         DropdownMenuItem(
//                           value: "Towns",
//                           child: Text("Towns"),
//                         ),
//                         DropdownMenuItem(
//                           value: "Population",
//                           child: Text("Population"),
//                         ),
//                       ],
//                       onChanged: (value) {
//                         if (value == "Population") {
//                           setState(() {
//                             var activeChart = PopulationChart(heightFactor: 0.4);
//                           });
//                         } else if (value == "Towns") {
//                           setState(
//                             () {
//                               activeChart = TownChart(heightFactor: 0.3);
//                             },
//                           );
//                         } else if (value == "Districts") {
//                           setState(() {
//                             activeChart = DistrictsChart(heightFactor: 0.3);
//                           });
//                         } else {
//                           setState(() {
//                             activeChart = PowerChart(heightFactor: 0.3);
//                           });
//                         }
//                         setState(() {
//                           selectedMetric = value!;
//                         });
//                       },
//                       style: const TextStyle(
//                         color: Colors.black,
//                         fontSize: 16,
//                       ),
//                       dropdownColor: Colors.white,
//                     ),
//   }
// }