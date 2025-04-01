import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:medical/common/utils/kcolors.dart';
import 'package:medical/common/widgets/app_style.dart';
import 'package:medical/src/doctors/views/doctors_list.dart';
import 'package:medical/src/entrypoint/controllers/bottom_tab_notifier.dart';
import 'package:medical/src/home/views/home_screen.dart';
import 'package:medical/src/message/views/message_screen.dart';
import 'package:medical/src/profile/views/profile_screen.dart';
import 'package:medical/src/reservation/views/appointment_screen.dart';
import 'package:medical/src/schedule/views/doctor_profile.dart';
import 'package:provider/provider.dart';


class AppEntrypoint extends StatelessWidget {
  AppEntrypoint({super.key});

  List<Widget> pageList = [
    HomeScreen(),
    MessageScreen(doctorName: ''),
    ProfileScreen(),
    AppointmentScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<TabIndexNotifier>(
        builder: (context, tabIndexNotifier, child) {
          return Scaffold(
            body: Stack(
              children: [
                pageList[tabIndexNotifier.index],
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0,right: 15,bottom: 10,top: 20),
                    child: Theme(
                      data:
                      Theme.of(context).copyWith(canvasColor: Colors.transparent),
                      child: Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),
                        color: Kolors.kPrimary),
                        child: BottomNavigationBar(
                          selectedFontSize: 12,
                          elevation: 0,
                          showSelectedLabels: false,
                          unselectedItemColor: Kolors.kWhite,
                          selectedLabelStyle:
                          appStyle(9, Kolors.kWhite, FontWeight.w500),
                          showUnselectedLabels: true,
                          selectedItemColor: Kolors.kDark,
                          currentIndex: tabIndexNotifier.index,
                          unselectedIconTheme:
                          const IconThemeData(color: Colors.black),
                          onTap: (i) {
                            tabIndexNotifier.setIndex(i);
                          },
                          items:  [
                            BottomNavigationBarItem(
                                icon: tabIndexNotifier.index == 0 ? const  Icon(
                                  AntDesign.home,
                                  color: Kolors.kDark,
                                  size: 24,
                                ):const Icon(
                                  AntDesign.home,
                                  color: Kolors.kWhite,
                                  size: 24,
                                ),
                                label: ''
                            ),
                            BottomNavigationBarItem(
                                icon: tabIndexNotifier.index == 1 ? const Icon(
                                  AntDesign.message1,
                                  color: Kolors.kDark,
                                  size: 24,
                                ):const Icon(
                                  AntDesign.message1,
                                  color: Kolors.kWhite,
                                  size: 24,
                                ),label: ''),
                            BottomNavigationBarItem(
                                icon: tabIndexNotifier.index == 2 ? const Icon(
                                  AntDesign.user,
                                  color: Kolors.kDark,
                                  size: 24,
                                ):const Icon(
                                  AntDesign.user,
                                  color: Kolors.kWhite,
                                  size: 24,
                                ),label: ''),
                            BottomNavigationBarItem(
                                icon: tabIndexNotifier.index == 3 ? const Icon(
                                  AntDesign.calendar,
                                  color: Kolors.kDark,
                                  size: 24,
                                ):const Icon(
                                  AntDesign.calendar,
                                  color: Kolors.kWhite,
                                  size: 24,
                                ),label: ''),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}
