import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:medical/common/utils/kcolors.dart';
import 'package:medical/common/widgets/app_style.dart';
import 'package:medical/common/widgets/reusable_text.dart';
import 'package:medical/src/doctors/controlleur/doctor_controller.dart';
import 'package:provider/provider.dart';

class DoctorInfo extends StatefulWidget {
  final int doctorId;

  const DoctorInfo({super.key, required this.doctorId});

  @override
  State<DoctorInfo> createState() => _DoctorInfoState();
}

class _DoctorInfoState extends State<DoctorInfo> {
  @override
  void initState() {
    super.initState();
    // Charger les détails du médecin dès que la page s'ouvre
    Future.microtask(() => Provider.of<DoctorNotifier>(context, listen: false)
        .fetchDoctorById(context, widget.doctorId));
  }

  @override
  Widget build(BuildContext context) {
    final doctorNotifier = Provider.of<DoctorNotifier>(context);
    return Scaffold(
        backgroundColor: Kolors.kWhite,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Kolors.kWhite,
          leading: GestureDetector(
              onTap: () {
                context.go('/entrypoint');
              },
              child: Icon(
                Icons.arrow_back_ios_new,
                color: Kolors.kPrimary,
              )),
          title: ReusableText(
              text: "Doctor Info",
              style: appStyle(24, Kolors.kPrimary, FontWeight.w700)),
        ),
        body: doctorNotifier.isLoading
            ? const Center(child: CircularProgressIndicator())
            : doctorNotifier.selectedDoctor == null
                ? const Center(child: Text('Docteur non trouvé'))
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30.0, right: 30),
                          child: Container(
                            height: 283,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(13),
                                color: Kolors.kPrimaryLight),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 30.0, top: 20),
                                  child: Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(70),
                                        child: Image.asset(
                                          "assets/images/doctor_image.png",
                                          height: 140,
                                          width: 140,
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            child: Container(
                                              width: 130.w,
                                              height: 35.h,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(13),
                                                  color: Kolors.kPrimary),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        left: 8),
                                                    height: 21.h,
                                                    width: 22.w,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                        color: Kolors
                                                            .kPrimaryLight),
                                                    child: Icon(
                                                      Icons.gpp_good_outlined,
                                                      color: Kolors.kPrimary,
                                                      size: 15,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      ReusableText(
                                                          text: doctorNotifier
                                                              .selectedDoctor!.yearsOfExperience.toString() +" "+ "years",
                                                          style: appStyle(
                                                              12,
                                                              Kolors.kWhite,
                                                              FontWeight
                                                                  .normal)),
                                                      ReusableText(
                                                          text: "Experience",
                                                          style: appStyle(
                                                              12,
                                                              Kolors.kWhite,
                                                              FontWeight
                                                                  .normal))
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            child: Container(
                                              height: 108.h,
                                              width: 120.w,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(13),
                                                  color: Kolors.kPrimary),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 5.0, top: 5),
                                                child: RichText(
                                                  text: TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text: "Focus: ",
                                                        // Mettre "Focus" en gras et souligné
                                                        style: appStyle(
                                                                12,
                                                                Kolors.kWhite,
                                                                FontWeight.bold)
                                                            .copyWith(
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text:
                                                            "The impact of hormonal imbalances on skin conditions, specializing in acne, hirsutism, and other skin disorders.",
                                                        style: appStyle(
                                                            12,
                                                            Kolors.kWhite,
                                                            FontWeight.normal),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 39,
                                  width: 260,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(13),
                                      color: Kolors.kWhite),
                                  child: Column(
                                    children: [
                                      ReusableText(
                                          text: doctorNotifier
                                              .selectedDoctor!.fullName,
                                          style: appStyle(15, Kolors.kPrimary,
                                              FontWeight.w700)),
                                      ReusableText(
                                          text: doctorNotifier
                                              .selectedDoctor!.function,
                                          style: appStyle(12, Kolors.kDark,
                                              FontWeight.normal))
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Container(
                                          height: 18,
                                          width: 43,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(13),
                                              color: Kolors.kWhite),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Icon(
                                                Icons.star_border,
                                                size: 15,
                                                color: Kolors.kPrimary,
                                              ),
                                              ReusableText(
                                                  text: "5",
                                                  style: appStyle(
                                                      10,
                                                      Kolors.kPrimary,
                                                      FontWeight.normal))
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Container(
                                          height: 18,
                                          width: 43,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(13),
                                              color: Kolors.kWhite),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Icon(
                                                Icons.star_border,
                                                size: 15,
                                                color: Kolors.kPrimary,
                                              ),
                                              ReusableText(
                                                  text: "5",
                                                  style: appStyle(
                                                      10,
                                                      Kolors.kPrimary,
                                                      FontWeight.normal))
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Container(
                                          height: 18,
                                          width: 166,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(13),
                                              color: Kolors.kWhite),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Icon(
                                                Icons.timer_sharp,
                                                size: 15,
                                                color: Kolors.kPrimary,
                                              ),
                                              ReusableText(
                                                  text:
                                                      "Mon-Sat / 9:00AM - 5:00PM",
                                                  style: appStyle(
                                                      10,
                                                      Kolors.kPrimary,
                                                      FontWeight.normal))
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        context.go('/doctorprofile');
                                      },
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 30.0),
                                        child: Container(
                                          height: 21,
                                          width: 82,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(13),
                                              color: Kolors.kPrimary),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Icon(
                                                Icons.calendar_month_outlined,
                                                size: 18,
                                                color: Kolors.kWhite,
                                              ),
                                              ReusableText(
                                                  text: "Schedule",
                                                  style: appStyle(
                                                      13,
                                                      Kolors.kWhite,
                                                      FontWeight.normal))
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 50.0),
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 21.h,
                                            width: 22.w,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                color: Kolors.kWhite),
                                            child: Icon(
                                              Icons.info_outline,
                                              color: Kolors.kPrimary,
                                              size: 15,
                                            ),
                                          ),
                                          Container(
                                            height: 21.h,
                                            width: 22.w,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                color: Kolors.kWhite),
                                            child: Icon(
                                              Icons.question_mark,
                                              color: Kolors.kPrimary,
                                              size: 15,
                                            ),
                                          ),
                                          Container(
                                            height: 21.h,
                                            width: 22.w,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                color: Kolors.kWhite),
                                            child: Icon(
                                              Icons.star_border,
                                              color: Kolors.kPrimary,
                                              size: 15,
                                            ),
                                          ),
                                          Container(
                                            height: 21.h,
                                            width: 22.w,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                color: Kolors.kWhite),
                                            child: Icon(
                                              Icons.favorite_border,
                                              color: Kolors.kPrimary,
                                              size: 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 30.0),
                              child: ReusableText(
                                  text: "Profile",
                                  style: appStyle(
                                      14, Kolors.kPrimary, FontWeight.w700)),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 30.0, right: 30),
                              child: Container(
                                height: 70,
                                child: ReusableText(
                                    text:
                                    doctorNotifier
                                        .selectedDoctor!.profile,
                                    style: appStyle(
                                        12, Kolors.kDark, FontWeight.normal)),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 30.0),
                              child: ReusableText(
                                  text: "career path",
                                  style: appStyle(
                                      14, Kolors.kPrimary, FontWeight.w700)),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 30.0, right: 30),
                              child: Container(
                                height: 70,
                                child: ReusableText(
                                    text:
                                    doctorNotifier
                                        .selectedDoctor!.careerPath,
                                    style: appStyle(
                                        12, Kolors.kDark, FontWeight.normal)),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 30.0),
                              child: ReusableText(
                                  text: "highlights",
                                  style: appStyle(
                                      14, Kolors.kPrimary, FontWeight.w700)),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 30.0, right: 30),
                              child: Container(
                                height: 70,
                                child: ReusableText(
                                    text:
                                    doctorNotifier
                                        .selectedDoctor!.highlights,
                                    style: appStyle(
                                        12, Kolors.kDark, FontWeight.normal)),
                              ),
                            )
                          ],
                        ),
                      ],
                    )));
  }
}
