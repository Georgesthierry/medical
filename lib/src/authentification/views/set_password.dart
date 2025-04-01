import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:medical/common/utils/app_routes.dart';
import 'package:medical/common/utils/kcolors.dart';
import 'package:medical/common/widgets/app_style.dart';
import 'package:medical/common/widgets/password_field.dart';
import 'package:medical/common/widgets/reusable_text.dart';

import '../../../common/widgets/custom_button.dart';

class SetPassword extends StatefulWidget {
  const SetPassword({super.key});

  @override
  State<SetPassword> createState() => _SetPasswordState();
}

class _SetPasswordState extends State<SetPassword> {
  late final TextEditingController _passwordController = TextEditingController();
  late final TextEditingController _confirmpasswordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmpasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Kolors.kWhite,
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          context.go("/");
        }, icon: Icon(Icons.arrow_back_ios_new,color: Kolors.kPrimary,)),
        backgroundColor: Kolors.kWhite,
        title: ReusableText(text: "Set Password", style: appStyle(24, Kolors.kPrimary, FontWeight.bold)),
      ),
      body: Column(
        children: [
          SizedBox(height:10.h),
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                height: 30.h,
                width: 299.w,
                child: ReusableText(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ", style: appStyle(12, Kolors.kDark, FontWeight.w100)),
              ),
            ),
          ),
          SizedBox(height:20.h),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: ReusableText(text: "Password", style: appStyle(20, Kolors.kDark, FontWeight.w700)),
                  )
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 30.0,right: 30),
                  child: PasswordField(
                    radius: 13.r,
                    controller: _passwordController, hintText: '**************', showBorder: false,)
              ),

            ],
          ),
          SizedBox(height:20.h),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: ReusableText(text: "Confirm Password", style: appStyle(20, Kolors.kDark, FontWeight.w700)),
                  )
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 30.0,right: 30),
                  child: PasswordField(
                    radius: 13.r,
                    controller: _confirmpasswordController, hintText: '**************', showBorder: false,)
              ),

            ],
          ),
          SizedBox(height:20.h),
          CustomButton(onTap:(){},
            text: 'Create New Password',btnHieght: 45.h,btnColor: Kolors.kPrimary,btnWidth: 273.w,radius: 30.r,borderColor: Kolors.kWhite, )

        ],
      ),
    );
  }
}
