import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:medical/common/utils/kcolors.dart';
import 'package:medical/common/widgets/app_style.dart';
import 'package:medical/common/widgets/reusable_text.dart';
import 'doctorlistwidget.dart';

class DoctorListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Kolors.kWhite,
        appBar: AppBar(
          centerTitle: true,
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
              padding: const EdgeInsets.only(right: 30.0),
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
            Expanded(child: DoctorList()),
          ],
        ));
  }
}