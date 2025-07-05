import 'package:flutter/material.dart';
import 'package:get/get.dart';

class home_screen extends StatefulWidget {
  const home_screen({super.key});

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  String? selectedAgeGroup;

  final List<String> ageGroups = [
    'Below 18',
    '18–25',
    '26–35',
    '36–50',
    'Above 50',
  ];

  void submitAgeGroup() {
    if (selectedAgeGroup == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select an age group')),
      );
    } else {
      print("Selected Age Group: $selectedAgeGroup");

      // Simulate next screen
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('You selected: $selectedAgeGroup')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff4C50E3),
        title: Text("Select your age group"),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xff4C50E3), Colors.white],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)),
          ),
          Padding(
            padding: EdgeInsets.all(size / 17),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: size / 17),
                ...ageGroups.map((group) => RadioListTile(
                      title: Text(group),
                      value: group,
                      groupValue: selectedAgeGroup,
                      onChanged: (value) {
                        setState(() {
                          selectedAgeGroup = value.toString();
                        });
                      },
                    )),
                SizedBox(height: size / 12),
                ElevatedButton(
                  onPressed: submitAgeGroup,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                  ),
                  child: Text(
                    "Continue",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
