import 'package:flutter/material.dart';

class WeekController extends ChangeNotifier {
  List<DateTime> weekDays = [];

  WeekController() {
    _generateCurrentWeek();
  }

  void _generateCurrentWeek() {
    DateTime today = DateTime.now();
    int currentWeekday = today.weekday; // 1 = Lundi, 7 = Dimanche

    // Trouver le lundi de cette semaine
    DateTime monday = today.subtract(Duration(days: currentWeekday - 1));

    // Générer les 6 jours (Lundi à Samedi)
    weekDays = List.generate(6, (index) => monday.add(Duration(days: index)));

    notifyListeners();
  }
}