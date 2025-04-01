import 'package:flutter/material.dart';

class TimeSlotGrid extends StatefulWidget {
  @override
  _TimeSlotGridState createState() => _TimeSlotGridState();
}

class _TimeSlotGridState extends State<TimeSlotGrid> {
  List<String> timeSlots = [
    "9:00 AM", "9:30 AM", "10:00 AM", "10:30 AM", "11:00 AM",
    "11:30 AM", "12:00 PM", "12:30 PM", "1:00 PM", "1:30 PM",
    "2:00 PM", "2:30 PM", "3:00 PM", "3:30 PM", "4:00 PM",
  ];

  String? selectedTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        // color: Color(0xFFD8E3FC), // Couleur de fond
        borderRadius: BorderRadius.circular(16),
      ),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5, // 3 colonnes
          childAspectRatio: 2.5, // Ajustement de la hauteur
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: timeSlots.length,
        itemBuilder: (context, index) {
          bool isSelected = timeSlots[index] == selectedTime;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedTime = timeSlots[index];
              });
            },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: isSelected ? Colors.blue : Color(0xFFE0E7FF),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                timeSlots[index],
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: isSelected ? Colors.white : Colors.blue.shade900,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
