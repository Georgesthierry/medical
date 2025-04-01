import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical/src/doctors/controlleur/doctor_controller.dart';
import 'package:provider/provider.dart';

import '../../../common/utils/kcolors.dart';
import '../../../common/widgets/app_style.dart';
import '../../../common/widgets/reusable_text.dart';


class FemaleDoctorScreen extends StatefulWidget {
  const FemaleDoctorScreen({super.key});

  @override
  State<FemaleDoctorScreen> createState() => _FemaleDoctorScreenState();
}

class _FemaleDoctorScreenState extends State<FemaleDoctorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Kolors.kWhite,
      body: Consumer<DoctorNotifier>(
        builder: (context, doctorNotifier, child) {
          // Filtrage des médecins de sexe féminin
          final femaleDoctors = doctorNotifier.doctors
              .where((doctor) => doctor.gender == 'female')
              .toList();

          return SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height - 100,
              child: ListView.builder(
                itemCount: femaleDoctors.length,
                itemBuilder: (context, index) {
                  final doctor = femaleDoctors[index];
                  return Container(
                    margin: EdgeInsets.only(left: 30, right: 30, top: 10),
                    height: 131.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: Kolors.kPrimaryLight,
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.asset(
                              "assets/images/doctor_image.png",
                              height: 107.h,
                              width: 107,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ReusableText(
                                text: doctor.fullName,
                                style: appStyle(
                                  15,
                                  Kolors.kPrimary,
                                  FontWeight.w600,
                                ),
                              ),
                              ReusableText(
                                text: doctor.function,
                                style: appStyle(
                                  15,
                                  Kolors.kDark,
                                  FontWeight.normal,
                                ),
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 22.h,
                                    width: 46.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(18),
                                      color: Kolors.kPrimary,
                                    ),
                                    child: Center(
                                      child: ReusableText(
                                        text: "Info",
                                        style: appStyle(
                                          15,
                                          Kolors.kWhite,
                                          FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 5),
                                    height: 21.h,
                                    width: 21.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(18),
                                      color: Kolors.kWhite,
                                    ),
                                    child: Icon(
                                      Icons.calendar_month_outlined,
                                      color: Kolors.kPrimary,
                                      size: 13,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 5),
                                    height: 21.h,
                                    width: 21.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(18),
                                      color: Kolors.kWhite,
                                    ),
                                    child: Icon(
                                      Icons.info_outline,
                                      color: Kolors.kPrimary,
                                      size: 13,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 5),
                                    height: 21.h,
                                    width: 21.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(18),
                                      color: Kolors.kWhite,
                                    ),
                                    child: Icon(
                                      Icons.question_mark,
                                      color: Kolors.kPrimary,
                                      size: 13,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 5),
                                    height: 21.h,
                                    width: 21.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(18),
                                      color: Kolors.kWhite,
                                    ),
                                    child: Icon(
                                      Icons.favorite_border,
                                      color: Kolors.kPrimary,
                                      size: 13,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
