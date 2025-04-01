import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical/common/utils/kcolors.dart';
import 'package:medical/common/widgets/app_style.dart';
import 'package:medical/common/widgets/reusable_text.dart';
import 'package:medical/src/doctors/controlleur/doctor_controller.dart';
import 'package:provider/provider.dart';

class RatingScreen extends StatelessWidget {
  const RatingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Kolors.kWhite,
        body:
            Consumer<DoctorNotifier>(builder: (context, doctorNotifier, child) {
          // Filtrage des médecins de rating
          final ratingDoctors = doctorNotifier.doctors
              .where((doctor) => doctor.rating>4)
              .toList();
          return SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height - 100,
              child: ListView.builder(
                  itemCount: ratingDoctors.length,
                  itemBuilder: (context, index) {
                    final doctor = ratingDoctors[index];
                    return Padding(
                      padding:
                          const EdgeInsets.only(left: 30.0, right: 30, top: 15),
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
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                                      BorderRadius.circular(18),
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
                                      Container(
                                        height: 18.h,
                                        width: 43.w,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(13),
                                            color: Kolors.kWhite),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: Kolors.kPrimary,
                                              size: 18,
                                            ),
                                            Text(doctor.rating.toString())
                                          ],
                                        ),
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
                                        borderRadius: BorderRadius.circular(13),
                                        color: Kolors.kWhite),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, top: 5),
                                      child: Column(
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
                                              style: appStyle(10, Kolors.kDark,
                                                  FontWeight.normal))
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  width: 211,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            height: 22,
                                            width: 46,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(18),
                                                color: Kolors.kPrimary),
                                            child: Center(
                                                child: ReusableText(
                                                    text: "Info",
                                                    style: appStyle(
                                                        12,
                                                        Kolors.kWhite,
                                                        FontWeight.normal))),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                              height: 21.h,
                                              width: 21.w,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(18),
                                                  color: Kolors.kWhite),
                                              child: Icon(
                                                Icons.calendar_month_sharp,
                                                size: 15,
                                                color: Kolors.kPrimary,
                                              )),
                                          Container(
                                              height: 21.h,
                                              width: 21.w,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(18),
                                                  color: Kolors.kWhite),
                                              child: Icon(
                                                Icons.info_outline,
                                                size: 15,
                                                color: Kolors.kPrimary,
                                              )),
                                          Container(
                                              height: 21.h,
                                              width: 21.w,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(18),
                                                  color: Kolors.kWhite),
                                              child: Icon(
                                                Icons.question_mark,
                                                size: 15,
                                                color: Kolors.kPrimary,
                                              )),
                                          Container(
                                              height: 21.h,
                                              width: 21.w,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(18),
                                                  color: Kolors.kWhite),
                                              child: Icon(
                                                Icons.favorite_border,
                                                size: 15,
                                                color: Kolors.kPrimary,
                                              )),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          );
        }));
  }
}
