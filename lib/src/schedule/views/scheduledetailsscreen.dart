import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:medical/common/utils/kcolors.dart';
import 'package:medical/common/widgets/app_style.dart';
import 'package:medical/common/widgets/reusable_text.dart';

class ScheduleDetailsScreen extends StatelessWidget {
  const ScheduleDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Kolors.kWhite,
      appBar: AppBar(
        backgroundColor: Kolors.kWhite,
        leading: Icon(
          Icons.arrow_back_ios_new_rounded,
          size: 18,
          color: Kolors.kPrimary,
        ),
        centerTitle: true,
        title: ReusableText(
            text: "Your Appointement",
            style: appStyle(24, Kolors.kPrimary, FontWeight.bold)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 30,right: 30),
            height: 130.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17),
                color: Kolors.kPrimaryLight),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(70),
                  child: Image.asset(
                    "assets/images/doctor_image.png",
                    height: 80.h,
                    width: 80.w,
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0,top: 20),
                      child: Container(
                        width: 230.w,
                        height: 60.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(17),color: Kolors.kWhite
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ReusableText(
                                  text: "Dr. Sophia Martinez, Ph.D.",
                                  style:
                                      appStyle(16, Kolors.kPrimary, FontWeight.w700)),
                              ReusableText(
                                  text: "Solar Dermatology",
                                  style: appStyle(12, Kolors.kDark, FontWeight.w500)),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 30.h,
                              width: 60.w,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(13),color: Kolors.kWhite),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.star,color: Kolors.kPrimary,size: 20,),
                                  ReusableText(text: "5", style: appStyle(5, Kolors.kPrimary, FontWeight.w500))
                                ],
                              ),
                            ),
                            SizedBox(width:10 ,),
                            Container(
                              height: 30.h,
                              width: 60.w,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(13),color: Kolors.kWhite),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.message,color: Kolors.kPrimary,size: 15,),
                                  ReusableText(text: "5", style: appStyle(5, Kolors.kPrimary, FontWeight.w500))
                                ],
                              ),
                            ),
                            
                          ],
                        ),
                        SizedBox(width: 35.w,),
                        Row(
                          children: [
                            Container(
                              height: 22.h,
                              width: 22.w,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(13),color: Kolors.kWhite),
                              child: Container(
                                height: 22.h,
                                width: 22.w,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(13),color: Kolors.kWhite),
                                child: Icon(Icons.question_mark,color: Kolors.kPrimary,size: 15,),
                              ),
                            ),
                            SizedBox(width:3 ,),
                            Container(
                              height: 22.h,
                              width: 22.w,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(13),color: Kolors.kWhite),
                              child: Icon(Icons.favorite,color: Kolors.kPrimary,size: 15,),
                            ),

                          ],
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 30,),
          Container(
            margin: EdgeInsets.only(left: 30,right: 30),
            height: 2, // Épaisseur du trait
            // Longueur du trait
            color: Colors.blue,
          ),
          SizedBox(height: 15,),
          Padding(
            padding: const EdgeInsets.only(left: 30.0,right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 154.w,
                  height: 25.h,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(18),color: Kolors.kPrimary),
                  child: Center(child: ReusableText(text: "Month 24, Year", style: appStyle(14, Kolors.kWhite, FontWeight.w500))),
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 30.h,
                          width: 30.w,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(13),color: Kolors.kWhite),
                          child: Container(
                            height: 22.h,
                            width: 22.w,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(13),color: Kolors.kPrimary),
                            child: Icon(Icons.check,color: Kolors.kWhite,size: 15,),
                          ),
                        ),
                        SizedBox(width:3 ,),
                        Container(
                          height: 30.h,
                          width: 30.w,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(13),color: Kolors.kPrimary),
                          child: Icon(Icons.close,color: Kolors.kWhite,size: 15,),
                        ),

                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 5,),
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: ReusableText(text: "Wed, 10:00 AM ", style: appStyle(15, Kolors.kPrimary, FontWeight.normal)),
          ),
          SizedBox(height: 25,),
          Container(
            margin: EdgeInsets.only(left: 30,right: 30),
            height: 2, // Épaisseur du trait
            // Longueur du trait
            color: Colors.blue,
          ),
          SizedBox(height: 15,),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30.0,right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ReusableText(text: "Booking for", style: appStyle(15, Kolors.kDark, FontWeight.normal)),
                    ReusableText(text: "another person", style: appStyle(15, Kolors.kDark, FontWeight.bold)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0,right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ReusableText(text: "Full Name", style: appStyle(15, Kolors.kDark, FontWeight.normal)),
                    ReusableText(text: "Jane Doe", style: appStyle(15, Kolors.kDark, FontWeight.bold)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0,right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ReusableText(text: "Age", style: appStyle(15, Kolors.kDark, FontWeight.normal)),
                    ReusableText(text: "30", style: appStyle(15, Kolors.kDark, FontWeight.bold)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30,right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ReusableText(text: "Gender", style: appStyle(15, Kolors.kDark, FontWeight.normal)),
                    ReusableText(text: "Female", style: appStyle(15, Kolors.kDark, FontWeight.bold)),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 25,),
          SizedBox(height: 5,),
          Container(
            margin: EdgeInsets.only(left: 30,right: 30),
            height: 2, // Épaisseur du trait
            // Longueur du trait
            color: Colors.blue,
          ),
          SizedBox(height: 15,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: ReusableText(text: "Problem", style: appStyle(15, Kolors.kDark, FontWeight.normal)),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 30.0,right: 30),
                child: ReusableText(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.", style: appStyle(15, Kolors.kDark, FontWeight.normal)),
              )

            ],)
        ],
      ),
    );
  }
}
