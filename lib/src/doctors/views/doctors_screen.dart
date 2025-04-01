import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:medical/common/utils/app_routes.dart';
import 'package:medical/common/utils/kcolors.dart';
import 'package:medical/common/widgets/app_style.dart';
import 'package:medical/common/widgets/reusable_text.dart';

class DoctorsScreen extends StatefulWidget {
  const DoctorsScreen({super.key});

  @override
  State<DoctorsScreen> createState() => _DoctorsScreenState();
}

class _DoctorsScreenState extends State<DoctorsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: Kolors.kWhite,
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () {
                context.go("/entrypoint");
              },
              child: Icon(
                Icons.arrow_back_ios_new,
                size: 24,
                color: Kolors.kPrimary,
              )),
          title: Center(
              child: ReusableText(
                  text: "Doctors",
                  style: appStyle(24, Kolors.kPrimary, FontWeight.w700))),
          backgroundColor: Kolors.kWhite,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Container(
                height: 25.h,
                width: 25.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Kolors.kPrimaryLight),
                child: Icon(
                  Icons.search,
                  color: Kolors.kPrimary,
                  size: 15,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Container(
                  height: 25.h,
                  width: 25.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Kolors.kPrimaryLight),
                  child: Image.asset(
                    'assets/images/sorted.png',
                    height: 12,
                    width: 15,
                  )),
            )
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Row(
                children: [
                  Text("Sort by"),
                  SizedBox(width:8,),
                  Container(
                    height: 21.h,
                    width: 47.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),color: Kolors.kPrimary),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                     Padding(
                       padding: const EdgeInsets.only(left:3.0),
                       child: ReusableText(text: "A", style: appStyle(16, Kolors.kWhite, FontWeight.w600)),
                     ),
                     Padding(
                       padding: const EdgeInsets.only(bottom: 5.0),
                       child: ReusableText(text: "→", style: appStyle(12, Kolors.kWhite, FontWeight.w600)),
                     ),
                     ReusableText(text: "Z ", style: appStyle(16, Kolors.kWhite, FontWeight.w600)),
                    ],
                  ),
                  ),
                  SizedBox(width:8,),
                  Container(
                    height: 21.h,
                    width: 22.w,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                    color: Kolors.kPrimaryLight),
                    child: Icon(Icons.star_border,color: Kolors.kPrimary,size: 14,),
                  ),
                  SizedBox(width:8,),
                  Container(
                    height: 21.h,
                    width: 22.w,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                        color: Kolors.kPrimaryLight),
                    child: Icon(Icons.favorite_border,color: Kolors.kPrimary,size: 14,),
                  ),
                  SizedBox(width:8,),
                  Container(
                    height: 21.h,
                    width: 22.w,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                        color: Kolors.kPrimaryLight),
                    child: Icon(Icons.female_outlined,color: Kolors.kPrimary,size: 14,),
                  ),
                  SizedBox(width:8,),
                  Container(
                    height: 21.h,
                    width: 22.w,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                        color: Kolors.kPrimaryLight),
                    child: Icon(Icons.male,color: Kolors.kPrimary,size: 14,),
                  )
                ],
              ),
            ),
            SizedBox(height: 20.h,),
            Expanded(
              child: Container(
                height: 700.h,
                child: ListView.builder(
                  itemCount: 10,
                    itemBuilder: (context,index){
                  return Container(
                    margin: EdgeInsets.only(left: 30,right: 30,top: 10),
                    height: 131.h,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(18),color: Kolors.kPrimaryLight),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.asset("assets/images/doctor_image.png",height: 107.h,width: 107,),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ReusableText(text: "Dr. Alexander Bennett, Ph.D.", style: appStyle(15, Kolors.kPrimary, FontWeight.w600)),
                              ReusableText(text: "Dermato-Genetics", style: appStyle(15, Kolors.kDark, FontWeight.normal)),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap:(){
                                      context.go("/doctorinfo");
                      },
                                    child: Container(
                                      height: 22.h,
                                      width: 46.w,
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(18),color: Kolors.kPrimary),
                                      child: Center(child: ReusableText(text: "Info", style: appStyle(15, Kolors.kWhite, FontWeight.normal))),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 5),
                                    height: 21.h,
                                    width: 21.w,
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(18),color: Kolors.kWhite),child: Icon(Icons.calendar_month_outlined,color: Kolors.kPrimary,size: 13,),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 5),
                                    height: 21.h,
                                    width: 21.w,
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(18),color: Kolors.kWhite),child: Icon(Icons.info_outline,color: Kolors.kPrimary,size: 13,),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 5),
                                    height: 21.h,
                                    width: 21.w,
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(18),color: Kolors.kWhite),child: Icon(Icons.question_mark,color: Kolors.kPrimary,size: 13,),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 5),
                                    height: 21.h,
                                    width: 21.w,
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(18),
                                        color: Kolors.kWhite),
                                    child: Icon(Icons.favorite_border,color: Kolors.kPrimary,size: 13,),
                                  ),
                                ],
                              )


                            ],
                          ),
                        )
                      ],
                    ),
                  );
                }),
              ),
            )


          ],
        )
      ),
    );
  }
}
