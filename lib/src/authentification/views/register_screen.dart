import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:medical/common/utils/kcolors.dart';
import 'package:medical/common/widgets/app_style.dart';
import 'package:medical/common/widgets/custom_button.dart';
import 'package:medical/common/widgets/date_field.dart';
import 'package:medical/common/widgets/email_field.dart';
import 'package:medical/common/widgets/password_field.dart';
import 'package:medical/common/widgets/reusable_text.dart';
import 'package:medical/src/authentification/controlleur/auth_notifier.dart';
import 'package:medical/src/authentification/models/registration_models.dart';
import 'package:provider/provider.dart';

import '../../home/views/home_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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


  void showSnackbar(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Kolors.kWhite,
      appBar: AppBar(
        backgroundColor: Kolors.kWhite,
        centerTitle: true,
        leading: GestureDetector(
            onTap: () {
              context.go("/login");
            },
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: Kolors.kPrimary,
            )),
        title: ReusableText(
            text: "New Account",
            style: appStyle(24, Kolors.kPrimary, FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                    hintText: 'Nom & Prenoms',
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
                          text: "Password",
                          style: appStyle(20, Kolors.kDark, FontWeight.w700)),
                    )),
                Padding(
                    padding: const EdgeInsets.only(left: 30.0, right: 30),
                    child: PasswordField(
                      radius: 13.r,
                      controller: _passwordController,
                      hintText: '**************',
                      showBorder: false,
                    ))
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
                    hintText: 'example@example.com',
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
                    hintText: '+225 07 07 07 07',
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
                      padding: const EdgeInsets.only(left: 50.0),
                      child: ReusableText(
                          text: "Date of birth",
                          style: appStyle(20, Kolors.kDark, FontWeight.w700)),
                    )),
                Padding(
                  padding: const EdgeInsets.only(left: 50.0, right: 30),
                  child: DateInputField(
                    controller: _dateinputController,
                    hintText: 'DD / MM /YYY',
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              height: 45.h,
              width: 273.w,
              child: Column(
                children: [
                  ReusableText(
                      text: "By continuing, you agree to ",
                      style: appStyle(12, Kolors.kDark, FontWeight.normal)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ReusableText(
                          text: "Terms of Use",
                          style: appStyle(12, Kolors.kPrimary, FontWeight.bold)),
                      SizedBox(
                        width: 5,
                      ),
                      ReusableText(
                          text: "and",
                          style: appStyle(12, Kolors.kDark, FontWeight.normal)),
                      SizedBox(
                        width: 5,
                      ),
                      ReusableText(
                          text: "Privacy Policy",
                          style: appStyle(12, Kolors.kPrimary, FontWeight.bold)),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomButton(
                text: 'Sign Up',
                onTap: () {
                  RegistrationModel model = RegistrationModel(
                      email:_useremailController.text,
                    password: _passwordController.text,
                    birthday: _dateinputController.text,
                    phone: _userephoneController.text,
                    fullName: _userfullnameController.text,

                  );
                  String data = registrationModelToJson(model);
                  context.read<AuthNotifier>().registrationFunc(data, context);
                },
                radius: 30.r,
                btnWidth: 207.w,
                btnHieght: 50.h,
                btnColor: Kolors.kPrimary,
                textSize: 24,
                borderColor: Kolors.kWhite),
            SizedBox(
              height: 10.h,
            ),
            ReusableText(
                text: "or sign up with",
                style: appStyle(12, Kolors.kDark, FontWeight.normal)),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 40.h,
                    width: 40.h,
                    child: Image.asset("assets/images/google.png"),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Kolors.kPrimaryLight),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 40.h,
                    width: 40.w,
                    child: Image.asset("assets/images/facebook.png"),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Kolors.kPrimaryLight),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 40.h,
                    width: 40.w,
                    child: Image.asset("assets/images/biometric.png"),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Kolors.kPrimaryLight),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ReusableText(
                    text: "Don’t have an account?",
                    style: appStyle(12, Kolors.kDark, FontWeight.normal)),
                SizedBox(
                  width: 5,
                ),
                GestureDetector(
                    onTap: () {
                      context.go('/login');
                    },
                    child: ReusableText(
                        text: "Sign In",
                        style: appStyle(12, Kolors.kPrimary, FontWeight.bold)))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
