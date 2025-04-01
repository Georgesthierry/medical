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

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Kolors.kWhite,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Kolors.kWhite,
          title: ReusableText(
              text: "My Profile",
              style: appStyle(24, Kolors.kPrimary, FontWeight.w700)),
        ),
        body: SingleChildScrollView(child: Consumer<AuthNotifier>(
          builder: (context, authNotifier, child) {
            ProfileModel? user = authNotifier.getUserData();
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: Image.asset(
                    "assets/images/doctor_image.png",
                    height: 107.h,
                    width: 107.w,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                ReusableText(
                    text: user!.fullName,
                    style: appStyle(24, Kolors.kDark, FontWeight.w700)),
                SizedBox(
                  height: 20.h,
                ),
                GestureDetector(
                  onTap: () {
                    context.go("/profilepage");
                  },
                  child: ListTile(
                    leading: Container(
                      height: 40.h,
                      width: 40.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Kolors.kPrimaryLight),
                      child: Icon(
                        Icons.person_outline_rounded,
                        color: Kolors.kPrimary,
                        size: 25,
                      ),
                    ),
                    title: ReusableText(
                        text: "Profile",
                        style: appStyle(20, Kolors.kDark, FontWeight.w600)),
                    trailing: Icon(
                      Icons.arrow_forward_ios_sharp,
                      color: Kolors.kPrimary,
                      size: 20,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                ListTile(
                  leading: Container(
                    height: 40.h,
                    width: 40.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Kolors.kPrimaryLight),
                    child: Icon(
                      Icons.favorite_border,
                      color: Kolors.kPrimary,
                      size: 25,
                    ),
                  ),
                  title: ReusableText(
                      text: "Favorite",
                      style: appStyle(20, Kolors.kDark, FontWeight.w600)),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Kolors.kPrimary,
                    size: 20,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                ListTile(
                  leading: Container(
                    height: 40.h,
                    width: 40.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Kolors.kPrimaryLight),
                    child: Icon(
                      Icons.account_balance_wallet_outlined,
                      color: Kolors.kPrimary,
                      size: 25,
                    ),
                  ),
                  title: ReusableText(
                      text: "Payment Method",
                      style: appStyle(20, Kolors.kDark, FontWeight.w600)),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Kolors.kPrimary,
                    size: 20,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                ListTile(
                  leading: Container(
                    height: 40.h,
                    width: 40.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Kolors.kPrimaryLight),
                    child: Icon(
                      Icons.lock_outline,
                      color: Kolors.kPrimary,
                      size: 25,
                    ),
                  ),
                  title: ReusableText(
                      text: "Privacy Policy",
                      style: appStyle(20, Kolors.kDark, FontWeight.w600)),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Kolors.kPrimary,
                    size: 20,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                ListTile(
                  leading: Container(
                    height: 40.h,
                    width: 40.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Kolors.kPrimaryLight),
                    child: Icon(
                      Icons.settings_outlined,
                      color: Kolors.kPrimary,
                      size: 25,
                    ),
                  ),
                  title: ReusableText(
                      text: "Settings",
                      style: appStyle(20, Kolors.kDark, FontWeight.w600)),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Kolors.kPrimary,
                    size: 20,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                ListTile(
                  leading: Container(
                    height: 40.h,
                    width: 40.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Kolors.kPrimaryLight),
                    child: Icon(
                      Icons.question_mark,
                      color: Kolors.kPrimary,
                      size: 25,
                    ),
                  ),
                  title: ReusableText(
                      text: "Help",
                      style: appStyle(20, Kolors.kDark, FontWeight.w600)),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Kolors.kPrimary,
                    size: 20,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                GestureDetector(
                  onTap: () async {
                    bool shouldLogout = await showLogoutDialog(context);
                    if (shouldLogout) {
                      context.read<AuthNotifier>().logoutFunc(context);
                    }
                  },
                  child: ListTile(
                    leading: Container(
                      height: 40.h,
                      width: 40.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Kolors.kPrimaryLight),
                      child: Icon(
                        Icons.logout,
                        color: Kolors.kPrimary,
                        size: 25,
                      ),
                    ),
                    title: ReusableText(
                        text: "Logout",
                        style: appStyle(20, Kolors.kDark, FontWeight.w600)),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Kolors.kPrimary,
                      size: 20,
                    ),
                  ),
                ),
              ],
            );
          },
        )));
  }

  Future<bool> showLogoutDialog(BuildContext context) async {
    return await showDialog(
          context: context,
          builder: (BuildContext context) {
            return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Logout",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Are you sure you want to log out?",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.black87),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context, false); // Annuler
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.blue.shade100,
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Text(
                            "Cancel",
                            style: TextStyle(fontSize: 16, color: Colors.blue),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context, true); // Confirmer
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.blue,
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Text(
                            "Yes, Logout",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ) ??
        false;
  }
}
