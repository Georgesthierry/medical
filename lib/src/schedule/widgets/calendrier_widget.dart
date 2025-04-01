import 'package:flutter/material.dart';
import 'package:medical/common/utils/kcolors.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class CustomCalendar extends StatefulWidget {
  @override
  _CustomCalendarState createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Kolors.kPrimaryLight, // Couleur de fond du calendrier
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          // Boutons de navigation du mois
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.chevron_left, color: Colors.blue),
                onPressed: () {
                  setState(() {
                    _focusedDay = DateTime(
                        _focusedDay.year, _focusedDay.month - 1, _focusedDay.day);
                  });
                },
              ),
              Text(
                "${DateFormat.yMMMM().format(_focusedDay).toUpperCase()}",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              IconButton(
                icon: Icon(Icons.chevron_right, color: Colors.blue),
                onPressed: () {
                  setState(() {
                    _focusedDay = DateTime(
                        _focusedDay.year, _focusedDay.month + 1, _focusedDay.day);
                  });
                },
              ),
            ],
          ),

          SizedBox(height: 8),

          // Calendrier
          TableCalendar(
            firstDay: DateTime.utc(2000, 1, 1), // Début en 2000
            lastDay: DateTime.utc(2050, 12, 31), // Fin en 2050
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
            calendarFormat: CalendarFormat.month,
            headerVisible: false,
            daysOfWeekStyle: DaysOfWeekStyle(
              dowTextFormatter: (date, locale) =>
              date.weekday == DateTime.monday ? "MON" :
              date.weekday == DateTime.tuesday ? "TUE" :
              date.weekday == DateTime.wednesday ? "WED" :
              date.weekday == DateTime.thursday ? "THU" :
              date.weekday == DateTime.friday ? "FRI" :
              date.weekday == DateTime.saturday ? "SAT" : "SUN",
              weekdayStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
              weekendStyle: TextStyle(color: Colors.blue),
            ),
            calendarStyle: CalendarStyle(
              markerMargin: EdgeInsets.all(2),
              defaultTextStyle: TextStyle(color: Colors.blue),
              weekendTextStyle: TextStyle(color: Colors.blue),
              selectedDecoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              todayDecoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.blue, width: 1.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
