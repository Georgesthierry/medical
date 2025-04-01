import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:medical/common/utils/app_routes.dart';
import 'package:medical/common/utils/kcolors.dart';
import 'package:medical/common/widgets/app_style.dart';
import 'package:medical/common/widgets/reusable_text.dart';

class SettingsWidgetPage extends StatelessWidget {
  const SettingsWidgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Kolors.kWhite,
      appBar: AppBar(leading: GestureDetector(
        onTap: (){
          context.go('/');
        },
          child: Icon(Icons.arrow_back_ios_new_rounded,color: Kolors.kPrimary,)),
        centerTitle: true,
        backgroundColor: Kolors.kWhite,
        title: ReusableText(
            text: "Settings", style: appStyle(24, Kolors.kPrimary, FontWeight.w600)),),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: (){
              context.go("/notification");
            },
            child: ListTile(
              leading: Container(
                height: 40.h,
                width: 40.w,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Kolors.kPrimaryLight),
                child: Icon(Icons.lightbulb_outline,color: Kolors.kPrimary,size: 25,),
              ),
              title: ReusableText(text: "Notification Settings", style: appStyle(20, Kolors.kDark, FontWeight.w600)),
              trailing: Icon(Icons.arrow_forward_ios,color: Kolors.kPrimary,size: 20,),
            ),
          ),
          SizedBox(height: 20.h,),
          GestureDetector(
            onTap: (){

            },
            child: ListTile(
              leading: Container(
                height: 40.h,
                width: 40.w,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Kolors.kPrimaryLight),
                child: Icon(Icons.key,color: Kolors.kPrimary,size: 25,),
              ),
              title: ReusableText(text: "Password Manager", style: appStyle(20, Kolors.kDark, FontWeight.w600)),
              trailing: Icon(Icons.arrow_forward_ios,color: Kolors.kPrimary,size: 20,),
            ),
          ),
          SizedBox(height: 20.h,),
          GestureDetector(
            onTap: (){},
            child: ListTile(
              leading: Container(
                height: 40.h,
                width: 40.w,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Kolors.kPrimaryLight),
                child: Icon(Icons.person_outline_rounded,color: Kolors.kPrimary,size: 25,),
              ),
              title: ReusableText(text: "Delete Account", style: appStyle(20, Kolors.kDark, FontWeight.w600)),
              trailing: Icon(Icons.arrow_forward_ios,color: Kolors.kPrimary,size: 20,),
            ),
          ),
        ],
      ),
    );
  }
}
