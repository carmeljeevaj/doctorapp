class Doctor {
  String name;
  String department;
  String location;
  bool isAvailable;
  List<String> availableTimes;

  Doctor({
    required this.name,
    required this.department,
    required this.location,
    this.isAvailable = true,
    this.availableTimes = const ['9:00 AM', '11:00 AM', '3:00 PM'],
  });
}
