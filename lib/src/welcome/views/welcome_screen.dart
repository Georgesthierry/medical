import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:medical/common/utils/app_routes.dart';
import 'package:medical/common/utils/kcolors.dart';
import 'package:medical/common/widgets/app_style.dart';
import 'package:medical/common/widgets/custom_button.dart';
import 'package:medical/common/widgets/reusable_text.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Kolors.kWhite,
      body: Container(
        padding: EdgeInsets.only(top: 230.h),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Image.asset('assets/images/welcome_logo.png',fit: BoxFit.cover,width: 130,height: 130,)),
              SizedBox(height: 5.h,),
              ReusableText(text: 'Skin', style: appStyle(48, Kolors.kPrimary, FontWeight.w100),),
              SizedBox(height: 5.h,),
              ReusableText(text: 'First', style: appStyle(48, Kolors.kPrimary, FontWeight.w100),),
              SizedBox(height: 15.h,),
              ReusableText(text: 'Dermatology Center', style: appStyle(12, Kolors.kPrimary, FontWeight.w600),),
              SizedBox(height: 20.h,),
              Container(
                width: 267.w,
                height: 50,
                child: ReusableText(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit,sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ", style: appStyle(12,Kolors.kDark,FontWeight.w300)),
              ),
              SizedBox(height: 30.h,),
              CustomButton(text: 'Log In',onTap: (){
                context.go("/login");
          
              },radius: 30.r,btnWidth: 207.w,btnHieght: 50.h,btnColor: Kolors.kPrimary,textSize:24,borderColor:Kolors.kWhite),
              SizedBox(height: 10.h,),
              CustomButton(text: 'Sign Up',onTap: (){
                context.go("/register");
              },radius: 30.r,btnWidth: 207.w,btnHieght: 50.h,btnColor: Kolors.kPrimaryLight,textSize:24),
            ],
          
          ),
        ),
      ),
    );
  }
}
