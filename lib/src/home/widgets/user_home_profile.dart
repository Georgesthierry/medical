import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:medical/common/utils/kcolors.dart';
import 'package:medical/common/widgets/app_style.dart';
import 'package:medical/common/widgets/reusable_text.dart';
import 'package:medical/src/authentification/controlleur/auth_notifier.dart';
import 'package:medical/src/profile/models/profile_models.dart';
import 'package:provider/provider.dart';

class UserHomeProfile extends StatelessWidget {
  const UserHomeProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthNotifier>(builder: (context, authNotifier, child) {
      ProfileModel? user = authNotifier.getUserData();
      return Padding(
        padding: const EdgeInsets.only(left: 30.0, top: 20, right: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                    width: 50.w,
                    height:50.h,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(40),color: Kolors.kPrimary
                    ),
                    child: Center(
                      child: Text(
                        user!.lastName[0].toUpperCase() + user.firstName[0].toUpperCase(),style: appStyle(20, Kolors.kWhite, FontWeight.w600),
                      ),
                    )
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReusableText(
                        text: "Hi, Bienvenue",
                        style: appStyle(12, Kolors.kPrimary, FontWeight.w500)),
                    ReusableText(
                        text: user!.lastName + " " +user.firstName,
                        style: appStyle(14, Kolors.kDark, FontWeight.w600))
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Kolors.kPrimaryLight),
                    child: GestureDetector(
                        onTap: () {
                          context.go('/notifications');
                        },
                        child: Icon(
                          Icons.notifications_none,
                          color: Colors.black38,
                        ))),
                SizedBox(
                  width: 5,
                ),
                Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Kolors.kPrimaryLight),
                    child: GestureDetector(
                        onTap: () {},
                        child: Icon(
                          Icons.settings_outlined,
                          color: Colors.black38,
                        ))),
              ],
            )
          ],
        ),
      );
    });
  }
}
