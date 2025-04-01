import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:medical/common/utils/app_routes.dart';
import 'package:medical/common/utils/kcolors.dart';
import 'package:medical/common/widgets/app_style.dart';
import 'package:medical/common/widgets/reusable_text.dart';
import 'package:medical/src/home/widgets/doctors_listes.dart';
import 'package:medical/src/home/widgets/programme_widget.dart';
import 'package:medical/src/home/widgets/user_home_profile.dart';

import '../../../common/widgets/search_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final TextEditingController _searchController = TextEditingController();


  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Kolors.kWhite,
      body: ListView(
        children: [
          UserHomeProfile(),
          SizedBox(height: 20.h,),
          Padding(
            padding: const EdgeInsets.only(left: 30.0,right: 30),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (){
                      context.go('/doctorlists');
                    },
                    child: Column(
                      children: [
                        Image.asset('assets/images/stethoscope.png',height: 30,color: Kolors.kPrimary,),
                        ReusableText(text: "Doctors", style: appStyle(12, Kolors.kPrimary, FontWeight.w600))
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      context.go('/favorite');
                    },
                    child: Column(
                      children: [
                        Icon(Icons.favorite_border,size: 30,color: Kolors.kPrimary,),
                        ReusableText(text: "Favorites", style: appStyle(12, Kolors.kPrimary, FontWeight.w600))
                      ],
                    ),
                  ),
                  Container(
                    height: 35.h,
                    width: 190.w,
                    child: SearchField(controller: _searchController, hintText: '', showBorder: false,radius: 23,),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 20.h,),
          ProgrammeWidget(),
          SizedBox(height: 10.h,),
          DoctorsListes()
        ],
      )
      );
  }
}
