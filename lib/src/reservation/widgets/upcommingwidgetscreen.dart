import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical/common/utils/kcolors.dart';
import 'package:medical/common/widgets/app_style.dart';
import 'package:medical/common/widgets/reusable_text.dart';

class UpcommingWidgetScreen extends StatefulWidget {
  const UpcommingWidgetScreen({super.key});

  @override
  State<UpcommingWidgetScreen> createState() => _UpcommingWidgetScreenState();
}

class _UpcommingWidgetScreenState extends State<UpcommingWidgetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Kolors.kWhite,
      body: ListView.builder(
          itemCount: 5 ,
          itemBuilder: (context, index){
            return Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,bottom: 20,top: 20),
              child: Container(
                width: 300.w,
                height: 141.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13.r),
                    color: Kolors.kPrimaryLight
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.asset("assets/images/doctor_image.png",height: 63.h,width: 63.w,),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 211.w,
                                height: 45.h,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(13)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: ReusableText(text: "Dr. Olivia Turner, M.D.", style: appStyle(16, Kolors.kPrimary, FontWeight.w700)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: ReusableText(text: "Dermato-Genetics", style: appStyle(14, Kolors.kDark, FontWeight.normal)),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 10.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 150.w,
                          height: 20.h,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: Kolors.kWhite),
                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.calendar_month_outlined,size: 15,color: Kolors.kPrimary,),
                              ReusableText(text: "Sunday, 12 June", style: appStyle(12, Kolors.kPrimary, FontWeight.normal))
                            ],
                          ),

                        ),
                        SizedBox(width: 12,),
                        Container(
                          width: 150.w,
                          height: 20.h,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: Kolors.kWhite),
                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.timer_sharp,size: 15,color: Kolors.kPrimary,),
                              ReusableText(text: "9:30 AM - 10:00 AM", style: appStyle(12, Kolors.kPrimary, FontWeight.normal))
                            ],
                          ),

                        ),
                      ],
                    ),
                    SizedBox(height: 10.h,),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 27.h,
                            width: 250.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(13.r),
                              color: Kolors.kPrimary,
                            ),
                            child: Center(child: ReusableText(text: "Details", style: appStyle(18, Kolors.kWhite, FontWeight.normal))),
                          ),
                          SizedBox(width: 10,),
                          Row(
                            children: [
                              Container(
                                height: 26.h,
                                width: 26.h,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(13),color: Kolors.kWhite),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.check,size: 12,color: Kolors.kPrimary,),
                                  ],
                                ),
                              ),

                              SizedBox(width: 10,),
                              Container(
                                height: 26.h,
                                width: 26.w,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(13),color: Kolors.kWhite),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.close,size: 12,color: Kolors.kPrimary,),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );;
  }
}
