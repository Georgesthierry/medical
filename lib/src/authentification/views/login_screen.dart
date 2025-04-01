import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:medical/common/utils/app_routes.dart';
import 'package:medical/common/utils/kcolors.dart';
import 'package:medical/common/widgets/app_style.dart';
import 'package:medical/common/widgets/custom_button.dart';
import 'package:medical/common/widgets/email_field.dart';
import 'package:medical/common/widgets/password_field.dart';
import 'package:medical/common/widgets/reusable_text.dart';
import 'package:medical/src/authentification/controlleur/biometric_auth.dart';
import 'package:medical/src/authentification/models/login_models.dart';
import 'package:provider/provider.dart';
import '../controlleur/auth_notifier.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController _useremailController =
  TextEditingController();
  late final TextEditingController _passwordController =
  TextEditingController();

  @override
  void dispose() {
    _useremailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            context.go("/welcome");
          },
            child: const Icon(Icons.arrow_back_ios_new,color: Kolors.kPrimary,)),
        centerTitle: true,
        backgroundColor: Kolors.kWhite,
        title: ReusableText(text: "Log In", style: appStyle(24, Kolors.kPrimary, FontWeight.w600))
      ),
      backgroundColor: Kolors.kWhite,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(left:30.0,top: 10),
                child: ReusableText(text: "Welcome", style: appStyle(24, Kolors.kPrimary, FontWeight.w600)),
              ),
            ),
            SizedBox(height: 10.h,),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Container(
                  width: 299.w,
                    height: 30.h,
                    child: ReusableText(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ", style: appStyle(12, Kolors.kDark, FontWeight.normal))),
              ),
            ),
            SizedBox(height: 40.h,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: ReusableText(text: "Email or Mobile Number", style: appStyle(20, Kolors.kDark, FontWeight.w700)),
                    )
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0,right: 30),
                  child: EmailTextField(
                    radius: 13.r,
                    controller: _useremailController, hintText: 'example@example.com', backgroundColor: Kolors.kPrimaryLight, showBorder: false,),
                )
              ],
            ),
            SizedBox(height: 40.h,),
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
                )
              ],
            ),
            SizedBox(height: 10.h,),
            Align(alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 30.0),
                child: GestureDetector(
                  onTap: (){
                  },
                    child: ReusableText(text: "Forget Password", style: appStyle(12, Kolors.kPrimary, FontWeight.w800))),
              ),),
            SizedBox(height: 40.h,),
            CustomButton(text: 'Log In',onTap: (){
              LoginModel model = LoginModel(
                  email: _useremailController.text.trim(),
                  password: _passwordController.text.trim());
              String data = loginModelToJson(model);
              print(data);
              context.read<AuthNotifier>().loginFunc(data, context);

            },radius: 30.r,btnWidth: 207.w,btnHieght: 50.h,btnColor: Kolors.kPrimary,textSize:24,borderColor:Kolors.kWhite),
            SizedBox(height: 10.h,),
            ReusableText(text: "or sign up with", style: appStyle(12, Kolors.kDark, FontWeight.normal)),
            SizedBox(height: 10.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: (){},
                  child: Container(
                    height: 40,
                    width: 40,
                    child: Image.asset("assets/images/google.png"),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Kolors.kPrimaryLight),
                  ),
                ),
                SizedBox(width: 10,),
                GestureDetector(
                  onTap: (){},
                  child: Container(
                    height: 40,
                    width: 40,
                    child: Image.asset("assets/images/facebook.png"),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Kolors.kPrimaryLight),
                  ),
                ),
                SizedBox(width: 10,),
                GestureDetector(
                  onTap: () async{
                    bool auth = await Authentication.authentication();
                    if(auth){
                      context.go('/entrypoint');
                    }
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    child: Image.asset("assets/images/biometric.png"),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Kolors.kPrimaryLight),
                  ),
                ),
                SizedBox(width: 10,),

              ],
            ),
            SizedBox(height: 40.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ReusableText(text: "Don’t have an account?", style: appStyle(12, Kolors.kDark, FontWeight.normal)),
                SizedBox(width: 5,),
                GestureDetector(
                  onTap: (){
                    context.go("/register");
                  },
                    child: ReusableText(text: "Sign Up", style: appStyle(12, Kolors.kPrimary, FontWeight.bold)))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
