import 'package:flutter/material.dart';

class ScheduleProvider extends ChangeNotifier {
  DateTime selectedDate = DateTime.now();
  Map<String, Appointment?> scheduledAppointments = {}; // Stocke les heures et leur programme

  ScheduleProvider() {
    _initializeHours();
  }

  void _initializeHours() {
    for (int i = 9; i <= 20; i++) {
      String time = "$i:00";
      scheduledAppointments[time] = null; // Par défaut, aucun programme
    }
    notifyListeners();
  }

  void selectDate(DateTime date) {
    selectedDate = date;
    _initializeHours(); // Réinitialiser les heures pour la nouvelle date
    notifyListeners();
  }

  void scheduleAppointment(String hour, Appointment appointment) {
    scheduledAppointments[hour] = appointment;
    notifyListeners();
  }

  void cancelAppointment(String hour) {
    scheduledAppointments[hour] = null;
    notifyListeners();
  }
}

class Appointment {
  final String doctor;
  final String description;

  Appointment({required this.doctor, required this.description});
}
