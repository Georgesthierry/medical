import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical/common/utils/kcolors.dart';
import 'package:medical/common/widgets/custom_button.dart';
import 'package:medical/common/widgets/reusable_text.dart';
import 'package:medical/src/doctors/controlleur/doctor_controller.dart';
import 'package:provider/provider.dart';

import '../../../common/widgets/app_style.dart';

class AllFavoriteDoctors extends StatelessWidget {
  const AllFavoriteDoctors({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Kolors.kWhite,
        body:
            Consumer<DoctorNotifier>(builder: (context, doctorNotifier, child) {
          // Filtrage des médecins de sexe féminin
          final favoriteDoctors = doctorNotifier.doctors
              .where((doctor) => doctor.isFavorite == true)
              .toList();
          return SingleChildScrollView(
              child: Container(
                  height: MediaQuery.of(context).size.height - 100,
                  child: ListView.builder(
                      itemCount: favoriteDoctors.length,
                      itemBuilder: (context, index) {
                        final doctor = favoriteDoctors[index];
                        return Padding(
                          padding: const EdgeInsets.only(
                              left: 30.0, right: 30, top: 15),
                          child: Container(
                            padding: EdgeInsets.only(left: 15),
                            height: 106.h,
                            width: 300.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                color: Kolors.kPrimaryLight),
                            child: Row(
                              children: [
                                Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(30),
                                      child: Image.asset(
                                        "assets/images/doctor_image.png",
                                        height: 68.h,
                                        width: 68.w,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      width: 211.w,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                  height: 21.h,
                                                  width: 21.w,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              18),
                                                      color: Kolors.kPrimary),
                                                  child: Icon(
                                                    Icons
                                                        .workspace_premium_outlined,
                                                    color: Kolors.kWhite,
                                                    size: 18,
                                                  )),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              ReusableText(
                                                  text: "Profesionnal Doctor",
                                                  style: appStyle(
                                                      12,
                                                      Kolors.kPrimary,
                                                      FontWeight.normal))
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Container(
                                        width: 221.w,
                                        height: 43.h,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(13),
                                            color: Kolors.kWhite),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8.0, top: 5),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  ReusableText(
                                                      text: doctor.fullName,
                                                      style: appStyle(
                                                          12,
                                                          Kolors.kPrimary,
                                                          FontWeight.normal)),
                                                  ReusableText(
                                                      text: doctor.function,
                                                      style: appStyle(
                                                          10,
                                                          Kolors.kDark,
                                                          FontWeight.normal))
                                                ],
                                              ),
                                              Icon(
                                                Icons.favorite,
                                                size: 25,
                                                color: Kolors.kPrimary,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    CustomButton(
                                      text: 'Make Appointment',
                                      btnWidth: 211.w,
                                      btnHieght: 20.h,
                                      btnColor: Kolors.kPrimary,
                                      borderColor: Kolors.kWhite,
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      })));
        }));
  }
}
