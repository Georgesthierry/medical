import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:medical/common/utils/kcolors.dart';

class SmallCalendrieWidget extends StatefulWidget {
  const SmallCalendrieWidget({super.key});

  @override
  State<SmallCalendrieWidget> createState() => _SmallCalendrieWidgetState();
}

class _SmallCalendrieWidgetState extends State<SmallCalendrieWidget> {

  DateTime _selectedDate = DateTime.now();
  DateTime _focusedDate = DateTime.now();

  // Liste des mois pour affichage
  final List<String> _months = List.generate(12, (index) => DateFormat.MMMM().format(DateTime(0, index + 1)));

  void _changeWeek(int direction) {
    setState(() {
      _focusedDate = _focusedDate.add(Duration(days: 7 * direction));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 28,right: 8,left: 8,top: 8),
      decoration: BoxDecoration(
        color: Kolors.kPrimaryLight, // Couleur de fond
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Sélecteur du mois et année
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${DateFormat.MMMM().format(_focusedDate)} ${_focusedDate.year}",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
              ),
              SizedBox(width: 5),
              Icon(Icons.arrow_drop_down, color: Colors.blue),
            ],
          ),
          SizedBox(height: 10),
          // Liste des jours en horizontal avec navigation
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.chevron_left, color: Kolors.kPrimaryLight,size: 33,),
                onPressed: () => _changeWeek(-1),
              ),
              Expanded(
                child: SizedBox(
                  height: 80.h,
                  width: 100.w,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 7,
                    itemBuilder: (context, index) {
                      DateTime day = _focusedDate.add(Duration(days: index - _focusedDate.weekday + 1));
                      bool isSelected = isSameDay(day, _selectedDate);

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedDate = day;
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          width: 40.w,
                          decoration: BoxDecoration(
                            color: isSelected ? Kolors.kPrimary : Colors.white,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "${day.day}",
                                style: TextStyle(
                                  fontSize: 22.sp,
                                  fontWeight: FontWeight.bold,
                                  color: isSelected ? Colors.white : Kolors.kPrimaryLight,
                                ),
                              ),
                              Text(
                                DateFormat.E().format(day).toUpperCase(),
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: isSelected ? Colors.white : Kolors.kPrimaryLight,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),

              IconButton(
                icon: Icon(Icons.chevron_right, color: Kolors.kPrimaryLight,size: 33,),
                onPressed: () => _changeWeek(1),
              ),
            ],
          ),
        ],
      ),
    );
  }
  bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year && date1.month == date2.month && date1.day == date2.day;
  }
}
