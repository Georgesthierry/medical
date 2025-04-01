import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical/common/utils/kcolors.dart';
import 'package:medical/common/widgets/reusable_text.dart';

import '../../../common/widgets/app_style.dart';

class CancelledWidgetScreen extends StatefulWidget {
  const CancelledWidgetScreen({super.key});

  @override
  State<CancelledWidgetScreen> createState() => _CancelledWidgetScreenState();
}

class _CancelledWidgetScreenState extends State<CancelledWidgetScreen> {
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
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                      margin: EdgeInsets.only(left: 10,right: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13.r),
                        color: Kolors.kPrimary,
                      ),
                      child: Center(child: ReusableText(text: "Details", style: appStyle(18, Kolors.kWhite, FontWeight.normal))),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
