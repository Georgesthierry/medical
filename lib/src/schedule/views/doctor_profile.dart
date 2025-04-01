import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:medical/common/utils/kcolors.dart';
import 'package:medical/common/widgets/app_style.dart';
import 'package:medical/common/widgets/reusable_text.dart';
import 'package:medical/src/schedule/widgets/calendrier_widget.dart';

class DoctorProfile extends StatefulWidget {
  const DoctorProfile({super.key});

  @override
  State<DoctorProfile> createState() => _DoctorProfileState();
}

class _DoctorProfileState extends State<DoctorProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Kolors.kWhite,
      appBar: AppBar(
        backgroundColor: Kolors.kWhite,
        leading: GestureDetector(
            onTap: (){
              context.go('/entrypoint');
            },
            child: Icon(Icons.arrow_back_ios_new,color: Kolors.kPrimary,)),
        title: Row(
          children: [
            Container(
              width: 82.w,
              height: 21.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),color: Kolors.kPrimary
              ),
              child: GestureDetector(
                onTap: (){
                  context.go('/schedule');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.calendar_month_outlined,size: 12,color: Kolors.kWhite,),
                    SizedBox(width: 5,),
                    ReusableText(text: "Schedule", style: appStyle(12, Kolors.kWhite, FontWeight.normal))
                  ],
                ),
              ),
            ),
            SizedBox(width: 5.w,),
            Container(
              width: 21.w,
              height: 21.h,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
              color: Kolors.kPrimary),
              child: Icon(Icons.call,size: 15,color: Kolors.kWhite,),
            ),
            SizedBox(width: 5.w,),
            Container(
              width: 21.w,
              height: 21.h,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                  color: Kolors.kPrimary),
              child: Icon(Icons.video_camera_front_outlined,size: 15,color: Kolors.kWhite,),
            ),
            SizedBox(width: 5.w,),
            Container(
              width: 21.w,
              height: 21.h,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                  color: Kolors.kPrimary),
              child: Icon(Icons.message,size: 15,color: Kolors.kWhite,),
            ),

          ],
        ),
        actions: [
          SizedBox(width: 5.w,),
          Padding(
            padding: const EdgeInsets.only(right: 30.0),
            child: Row(
              children: [
                Container(
                  width: 21.w,
                  height: 21.h,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                      color: Kolors.kPrimaryLight),
                  child: Icon(Icons.question_mark,size: 15,color: Kolors.kPrimary,),
                ),
                SizedBox(width: 5.w,),
                Container(
                  width: 21.w,
                  height: 21.h,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                      color: Kolors.kPrimaryLight),
                  child: Icon(Icons.favorite,size: 15,color: Kolors.kPrimary,),
                ),

              ],
            ),
          ),
        ],
      ),
      body: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30.0,right: 30),
              child: Container(
                height: 260.h,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(13),color: Kolors.kPrimaryLight),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0,top: 5),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(70),
                            child: Image.asset("assets/images/doctor_image.png",height: 140,width: 140,),
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Container(
                                  width: 130.w,
                                  height: 35.h,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(13),color: Kolors.kPrimary),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(left: 8),
                                        height: 21.h,
                                        width: 22.w,
                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: Kolors.kPrimaryLight),
                                        child: Icon(Icons.gpp_good_outlined,color: Kolors.kPrimary,size: 15,),
                                      ),
                                      SizedBox(width: 5,),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          ReusableText(text: "15"+"years", style: appStyle(12, Kolors.kWhite, FontWeight.normal)),
                                          ReusableText(text: "Experience", style: appStyle(12, Kolors.kWhite, FontWeight.normal))
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 5.h,),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Container(
                                  height: 108.h,
                                  width: 120.w,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(13),color: Kolors.kPrimary),
                                  child:Padding(
                                    padding: const EdgeInsets.only(left: 5.0, top: 5),
                                    child: RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: "Focus: ", // Mettre "Focus" en gras et souligné
                                            style: appStyle(12, Kolors.kWhite, FontWeight.bold).copyWith(
                                              decoration: TextDecoration.underline,
                                            ),
                                          ),
                                          TextSpan(
                                            text: "The impact of hormonal imbalances on skin conditions, specializing in acne, hirsutism, and other skin disorders.",
                                            style: appStyle(12, Kolors.kWhite, FontWeight.normal),
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
                    SizedBox(height: 10.h,),
                    Container(
                      height: 39.h,
                      width: 260.w,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(13),color: Kolors.kWhite),
                      child: Column(
                        children: [
                          ReusableText(text: "Dr. Alexander Bennett, Ph.D.", style: appStyle(15, Kolors.kPrimary, FontWeight.w700)),
                          ReusableText(text: "Dermato-Genetics", style: appStyle(12, Kolors.kDark, FontWeight.normal))
                        ],
                      ),
                    ),
                    SizedBox(height: 10.h,),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Container(
                              height: 18.h,
                              width: 43.w,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(13),color: Kolors.kWhite),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(Icons.star_border,size: 15,color: Kolors.kPrimary,),
                                  ReusableText(text: "5", style: appStyle(10, Kolors.kPrimary, FontWeight.normal))
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Container(
                              height: 18,
                              width: 43,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(13),color: Kolors.kWhite),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(Icons.star_border,size: 15,color: Kolors.kPrimary,),
                                  ReusableText(text: "5", style: appStyle(10, Kolors.kPrimary, FontWeight.normal))
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Container(
                              height: 18,
                              width: 166,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(13),color: Kolors.kWhite),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(Icons.timer_sharp,size: 15,color: Kolors.kPrimary,),
                                  ReusableText(text: "Mon-Sat / 9:00AM - 5:00PM", style: appStyle(10, Kolors.kPrimary, FontWeight.normal))
                                ],
                              ),
                            ),
                          ),
        
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: ReusableText(text: "Profile", style: appStyle(14, Kolors.kPrimary, FontWeight.w700)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0,right: 30),
                  child: Container(
                    height: 70,
                    child: ReusableText(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.", style: appStyle(12, Kolors.kDark, FontWeight.normal)),
                  ),
                )
              ],
            ),
            SizedBox(height: 10,),
            CustomCalendar()
          ],
        ),
      ),
    );
  }
}
