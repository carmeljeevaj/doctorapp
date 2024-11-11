import 'package:flutter/material.dart';

import '../models/doctor.dart';

class PatientScreen extends StatelessWidget {
  final Doctor doctor;

  PatientScreen({required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Available Doctors', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          doctor.isAvailable
              ? ListTile(
                  title: Text(doctor.name),
                  subtitle: Text('${doctor.department} - ${doctor.location}'),
                  trailing: ElevatedButton(
                    onPressed: () => _showBookingDialog(context),
                    child: Text('Book'),
                  ),
                )
              : Text('No doctors available at the moment.'),
        ],
      ),
    );
  }

  void _showBookingDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Available Times'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: doctor.availableTimes
                .map((time) => ListTile(
                      title: Text(time),
                      onTap: () {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Appointment booked for $time')),
                        );
                      },
                    ))
                .toList(),
          ),
        );
      },
    );
  }
}
