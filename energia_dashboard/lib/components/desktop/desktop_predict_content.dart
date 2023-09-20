import 'package:energia_dashboard/components/desktop/desktop_footer.dart';
import 'package:flutter/material.dart';

class DesktopPredictContent extends StatefulWidget {
  const DesktopPredictContent({super.key});

  @override
  State<DesktopPredictContent> createState() => _DesktopPredictContentState();
}

class _DesktopPredictContentState extends State<DesktopPredictContent> {
  bool closeAlert = false;
  bool performingPrediction = false;
  String selectedRegion = "Ahafo Region";
  String selectedDistrict = "District One";
  String selectedTown = "Town One";
  String selectedGrid = "Grid One";
  DateTime _selectedDate = DateTime.now();

  List<String> regions = [
    "Ahafo Region",
    "Ashanti Region",
    "Bono East Region",
    "Brong-Ahafo Region",
    "Central Region",
    "Eastern Region",
    "Greater Accra Region",
    "North East Region",
    "Northern Region",
    "Oti Region",
    "Savannah Region",
    "Upper East Region",
    "Upper West Region",
    "Volta Region",
    "Western North Region",
    "Western Region",
  ];

  List<String> districts = [
    "District One",
    "District Two",
    "District Three",
    "District Four",
    "District Five",
  ];

  List<String> towns = [
    "Town One",
    "Town Two",
    "Town Three",
    "Town Four",
    "Town Five",
  ];

  List<String> grids = [
    "Grid One",
    "Grid Two",
    "Grid Three",
    "Grid Four",
    "Grid Five",
  ];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2023),
      lastDate: DateTime(2033),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
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
                      "Prediction",
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
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
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
                    // regions dropdown
                    DropdownButton<String>(
                      value: selectedRegion,
                      items: regions.map((region) {
                        return DropdownMenuItem<String>(
                          value: region,
                          child: Text(region),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedRegion = value!;
                        });
                      },
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                      dropdownColor: Colors.white,
                    ),
                    const SizedBox(width: 20),
                    // districts dropdown
                    DropdownButton<String>(
                      value: selectedDistrict,
                      items: districts.map((district) {
                        return DropdownMenuItem<String>(
                          value: district,
                          child: Text(district),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedDistrict = value!;
                        });
                      },
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                      dropdownColor: Colors.white,
                    ),
                    const SizedBox(width: 20),
                    DropdownButton<String>(
                      value: selectedTown,
                      items: towns.map((town) {
                        return DropdownMenuItem<String>(
                          value: town,
                          child: Text(town),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedTown = value!;
                        });
                      },
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                      dropdownColor: Colors.white,
                    ),
                    const SizedBox(width: 20),
                    DropdownButton<String>(
                      value: selectedGrid,
                      items: grids.map((grid) {
                        return DropdownMenuItem<String>(
                          value: grid,
                          child: Text(grid),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedGrid = value!;
                        });
                      },
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                      dropdownColor: Colors.white,
                    ),
                    const SizedBox(width: 20),
                    InkWell(
                      onTap: () => _selectDate(context),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            '${_selectedDate.toLocal()}'.split(' ')[0],
                          ),
                          const Icon(Icons.calendar_today),
                        ],
                      ),
                    ),
                    // const SizedBox(height: 20),
                    const Spacer(),
                    Container(
                      height: 40,
                      width: 2,
                      color: Colors.grey[200],
                    ),
                    const SizedBox(width: 20),
                    // const Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          performingPrediction = !performingPrediction;
                        });
                      },
                      child: const Text("Make Prediction"),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Prediction of Power Outage",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: deviceWidth * 0.36,
                    height: deviceWidth * 0.36,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Parameters",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 20),
                            const ListTile(
                              leading: Icon(Icons.recycling_rounded),
                              title: Text("Region"),
                              subtitle: Text("Volta Region"),
                            ),
                            const ListTile(
                              leading:
                                  Icon(Icons.local_convenience_store_sharp),
                              title: Text("District"),
                              subtitle: Text("District One"),
                            ),
                            const ListTile(
                              leading: Icon(Icons.house),
                              title: Text("Town"),
                              subtitle: Text("Town One"),
                            ),
                            const ListTile(
                              leading: Icon(Icons.grid_3x3),
                              title: Text("Grid Station"),
                              subtitle: Text("Grid One"),
                            ),
                            const SizedBox(height: 20),
                            // horizontal line
                            SizedBox(
                              height: 1,
                              child: Container(color: Colors.black54),
                            ),
                            const SizedBox(height: 20),
                            const ListTile(
                              leading: Icon(Icons.notification_add),
                              title: Text(
                                "Prediction Remarks",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              subtitle: Text(
                                "There won't be any power outage in the next 24 hours",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: deviceWidth * 0.36,
                    height: deviceWidth * 0.36,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            const Text(
                              "Prediction",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Image.asset(
                              "assets/images/light-on-2.png",
                              height: 400,
                              width: 400,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const DesktopFooter(),
            ],
          ),
        ),
      ),
    );
  }
}
