import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical/common/utils/kcolors.dart';
import 'package:medical/common/widgets/app_style.dart';
import 'package:medical/common/widgets/reusable_text.dart';
import 'package:medical/src/home/controlleur/weekcontrolleur.dart';
import 'package:medical/src/home/widgets/schedule_widget_list.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class ProgrammeWidget extends StatefulWidget {
  const ProgrammeWidget({super.key});

  @override
  State<ProgrammeWidget> createState() => _ProgrammeWidgetState();
}

class _ProgrammeWidgetState extends State<ProgrammeWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<WeekController>(builder: (context, weekController, child) {
      return Container(
        height: 230.h,
        color: Kolors.kPrimaryLight,
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 70.h,
                child: ListView.builder(
                  itemCount: 6,
                  scrollDirection: Axis.horizontal, // Défilement horizontal
                  itemBuilder: (context, index) {
                    var day = weekController.weekDays[index];
                    bool isToday = _isSameDay(day, DateTime.now()); // Vérifie si c'est aujourd'hui

                    return Padding(
                      padding: EdgeInsets.only(left: 8.0.w),
                      child: Container(
                        margin: EdgeInsets.all(3),
                        height: 60.h,
                        width: 45.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: isToday ? Kolors.kPrimary : Kolors.kWhite, // Fond bleu pour aujourd'hui
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ReusableText(
                              text: "${day.day}",
                              style: appStyle(
                                24,
                                isToday ? Kolors.kWhite : Kolors.kDark, // Texte blanc pour aujourd'hui
                                FontWeight.w700,
                              ),
                            ),
                            ReusableText(
                              text: "${DateFormat.EEEE('fr').format(day)}"
                                  .substring(0, 3)
                                  .toUpperCase(),
                              style: appStyle(
                                12,
                                isToday ? Kolors.kWhite : Kolors.kDark, // Texte blanc pour aujourd'hui
                                FontWeight.w300,
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0, right: 10, left: 10),
                child: Container(
                  height: 125.h,
                  width: 340.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    color: Kolors.kWhite,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ReusableText(
                                text: DateFormat('dd EEEE')
                                    .format(DateTime.now()), // Format actuel de la date
                                style: appStyle(
                                  12,
                                  Kolors.kPrimary,
                                  FontWeight.normal,
                                )),
                            ReusableText(
                                text: " - ",
                                style: appStyle(12, Kolors.kPrimary, FontWeight.normal)),
                            ReusableText(
                                text: "Aujourd'hui",
                                style: appStyle(12, Kolors.kPrimary, FontWeight.normal)),
                          ],
                        ),
                      ),
                      ScheduleList()
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  // Vérifie si deux dates sont identiques (année, mois, jour)
  bool _isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }
}
