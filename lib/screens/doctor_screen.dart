import 'package:flutter/material.dart';

import '../models/doctor.dart';

class DoctorScreen extends StatelessWidget {
  final Doctor doctor;
  final Function(String, bool) onUpdate;

  DoctorScreen({required this.doctor, required this.onUpdate});

  final locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    locationController.text = doctor.location;

    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Name: ${doctor.name}', style: TextStyle(fontSize: 18)),
          Text('Department: ${doctor.department}', style: TextStyle(fontSize: 18)),
          Text('Location:', style: TextStyle(fontSize: 18)),
          TextField(
            controller: locationController,
            decoration: InputDecoration(labelText: 'Update Location'),
          ),
          SwitchListTile(
            title: Text('Available'),
            value: doctor.isAvailable,
            onChanged: (bool value) {
              onUpdate(locationController.text, value);
            },
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              onUpdate(locationController.text, doctor.isAvailable);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Doctor details updated')),
              );
            },
            child: Text('Save Changes'),
          ),
        ],
      ),
    );
  }
}
