import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical/common/utils/kcolors.dart';
import 'package:medical/common/widgets/app_style.dart';
import 'package:medical/common/widgets/reusable_text.dart';
import 'package:medical/src/reservation/controlleur/tab_controlleur_notifier.dart';
import 'package:medical/src/reservation/widgets/cancelledwidgetscreen.dart';
import 'package:medical/src/reservation/widgets/completewidgetscreen.dart';
import 'package:medical/src/reservation/widgets/upcommingwidgetscreen.dart';
import 'package:provider/provider.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Kolors.kWhite,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "All Appointments",
          style: TextStyle(fontSize: 24, color: Colors.blue, fontWeight: FontWeight.w600),
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Consumer<TabControllerProvider>(
              builder: (context, tabController, child) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(tabController.tabs.length, (index) {
                    bool isSelected = tabController.selectedIndex == index;
                    return GestureDetector(
                      onTap: () => tabController.changeTab(index),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          color: isSelected ? Kolors.kPrimary : Kolors.kPrimaryLight,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          tabController.tabs[index],
                          style: TextStyle(color: isSelected ? Kolors.kWhite : Kolors.kPrimary, fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    );
                  }),
                );
              },
            ),
          ),
          Expanded(
            child: Consumer<TabControllerProvider>(
              builder: (context, tabController, child) {
                switch (tabController.selectedIndex) {
                  case 0:
                    return CompleteWidgetScreen(); // Widget pour l'onglet "Complete"
                  case 1:
                    return UpcommingWidgetScreen(); // Widget pour l'onglet "Upcoming"
                  case 2:
                    return CancelledWidgetScreen(); // Widget pour l'onglet "Cancelled"
                  default:
                    return CompleteWidgetScreen();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
