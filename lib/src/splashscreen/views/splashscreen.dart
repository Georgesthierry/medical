import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medical/common/services/storage.dart';
import 'package:medical/common/utils/kcolors.dart';
import 'package:medical/common/widgets/app_style.dart';
import 'package:medical/common/widgets/reusable_text.dart';
import 'package:medical/src/authentification/controlleur/auth_notifier.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {

  @override
  void initState() {
    super.initState();
    _navigator();
    Future.delayed(Duration(seconds: 2), () {
      AuthNotifier().checkAndRefreshToken(context); // Vérifie et rafraîchit le token
    });
  }

  void _navigator()async{
    await Future.delayed(const Duration(milliseconds : 5000),(){

      if (Storage().getBool('firstOpen') == null) {
        // Go to onbording Screen
        GoRouter.of(context).go('/welcome');
      } else {
        //   Go to Home screen
        GoRouter.of(context).go('/home');
      }

    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Kolors.kPrimary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image.asset('assets/images/splash_logo.png',fit: BoxFit.cover,width: 130,height: 130,)),
          SizedBox(height: 5,),
          ReusableText(text: 'Skin', style: appStyle(48, Kolors.kWhite, FontWeight.w100),),
          SizedBox(height: 5,),
          ReusableText(text: 'First', style: appStyle(48, Kolors.kWhite, FontWeight.w100),),
          SizedBox(height: 15,),
          ReusableText(text: 'Dermatology Center', style: appStyle(12, Kolors.kWhite, FontWeight.w600),),
        ],
      ),
    );
  }
}
