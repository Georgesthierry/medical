import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:medical/common/utils/app_routes.dart';
import 'package:medical/common/utils/kcolors.dart';
import 'package:medical/common/widgets/app_style.dart';
import 'package:medical/common/widgets/reusable_text.dart';
import 'package:medical/src/authentification/controlleur/auth_notifier.dart';
import 'package:medical/src/profile/models/profile_models.dart';
import 'package:provider/provider.dart';

import '../../../common/widgets/custom_button.dart';
import '../../../common/widgets/date_field.dart';
import '../../../common/widgets/email_field.dart';
import '../../../common/widgets/password_field.dart';

class ProfileWidgetPage extends StatefulWidget {
  const ProfileWidgetPage({super.key});

  @override
  State<ProfileWidgetPage> createState() => _ProfileWidgetPageState();
}

class _ProfileWidgetPageState extends State<ProfileWidgetPage> {

  late final TextEditingController _userfullnameController =
  TextEditingController();
  late final TextEditingController _useremailController =
  TextEditingController();
  late final TextEditingController _userephoneController =
  TextEditingController();
  late final TextEditingController _passwordController =
  TextEditingController();
  late final TextEditingController _dateinputController =
  TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    _useremailController.dispose();
    _userfullnameController.dispose();
    _passwordController.dispose();
    _userephoneController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Kolors.kWhite,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            context.go('/entrypoint');
          },
            child: Icon(Icons.arrow_back_ios_new_rounded,color: Kolors.kPrimary,)),
        backgroundColor: Kolors.kWhite,
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: (){
              context.go('/settings');
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 30.0),
              child: Icon(Icons.settings_outlined,color: Kolors.kPrimary,),
            ),
          )
        ],
        title: ReusableText(text: "Profile", style: appStyle(24, Kolors.kPrimary, FontWeight.bold)),),
      body: Consumer<AuthNotifier>(builder: (context, authNotifier, child) {
      ProfileModel? user = authNotifier.getUserData();
      return Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(60),
            child: Image.asset("assets/images/doctor_image.png",height: 106,width: 106,),
          ),
          SizedBox(
            height: 10.h,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: ReusableText(
                        text: "Full name",
                        style: appStyle(20, Kolors.kDark, FontWeight.w700)),
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30),
                child: EmailTextField(
                  radius: 13.r,
                  controller: _userfullnameController,
                  hintText: user!.fullName,
                  backgroundColor: Kolors.kPrimaryLight,
                  showBorder: false,
                ),
              )
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: ReusableText(
                        text: "Mobile Number",
                        style: appStyle(20, Kolors.kDark, FontWeight.w700)),
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30),
                child: EmailTextField(
                  radius: 13.r,
                  controller: _userephoneController,
                  hintText: user!.phone,
                  backgroundColor: Kolors.kPrimaryLight,
                  showBorder: false,
                ),
              )
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: ReusableText(
                        text: "Email",
                        style: appStyle(20, Kolors.kDark, FontWeight.w700)),
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30),
                child: EmailTextField(
                  radius: 13.r,
                  controller: _useremailController,
                  hintText: user.email,
                  backgroundColor: Kolors.kPrimaryLight,
                  showBorder: false,
                ),
              )
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: ReusableText(
                        text: "Date of birth",
                        style: appStyle(20, Kolors.kDark, FontWeight.w700)),
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30),
                child: DateInputField(
                  controller: _dateinputController,
                  hintText: user.birthday,
                ),
              )
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          CustomButton(text: 'Update Profile',btnWidth: 207.w,btnHieght: 45,btnColor: Kolors.kPrimary,textSize: 14,borderColor:Kolors.kWhite)
        ],
      );}
    ));
  }
}
