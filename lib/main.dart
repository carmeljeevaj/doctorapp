import 'package:flutter/material.dart';

import 'models/doctor.dart';
import 'screens/doctor_list.dart';
import 'screens/doctor_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Doctor App',
      home: MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool isDoctorView = false;

  Doctor doctor = Doctor(
    name: 'Jeeva',
    department: 'Cardiology',
    location: 'GH',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isDoctorView ? 'Doctor Screen' : 'Patient Screen'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              setState(() {
                isDoctorView = !isDoctorView;
              });
            },
          )
        ],
      ),
      body: isDoctorView
          ? DoctorScreen(doctor: doctor, onUpdate: updateDoctorDetails)
          : PatientScreen(doctor: doctor),
    );
  }

  void updateDoctorDetails(String location, bool isAvailable) {
    setState(() {
      doctor.location = location;
      doctor.isAvailable = isAvailable;
    });
  }
}
