import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:medical/common/utils/kcolors.dart';
import 'package:medical/common/widgets/reusable_text.dart';

import '../../../common/widgets/app_style.dart';

class CompleteWidgetScreen extends StatefulWidget {
  const CompleteWidgetScreen({super.key});

  @override
  State<CompleteWidgetScreen> createState() => _CompleteWidgetScreenState();
}

class _CompleteWidgetScreenState extends State<CompleteWidgetScreen> {
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
                          Container(
                            width: 215.w,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
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
                                    SizedBox(width: 5,),
                                    Container(
                                      height: 19,
                                      width: 19,
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(13),color: Kolors.kWhite),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.favorite,size: 12,color: Kolors.kPrimary,),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 10.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 27.h,
                        width: 116.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13.r),
                          color: Kolors.kWhite,

                        ),
                        child: Center(child: ReusableText(text: "Re-Book", style: appStyle(18, Kolors.kPrimary, FontWeight.normal))),
                      ),
                      Container(
                        height: 30.h,
                        width: 116.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13.r),
                          color: Kolors.kPrimary,
                        ),
                        child: Center(child: ReusableText(text: "Add Review", style: appStyle(18, Kolors.kWhite, FontWeight.normal))),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
          }),
    );
  }
}
