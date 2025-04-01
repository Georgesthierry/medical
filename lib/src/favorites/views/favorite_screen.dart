import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:medical/common/utils/kcolors.dart';
import 'package:medical/common/widgets/app_style.dart';
import 'package:medical/common/widgets/reusable_text.dart';
import 'package:medical/src/favorites/views/service_favorite.dart';

import 'doctor_favorite.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Kolors.kWhite,
          leading: GestureDetector(

              onTap: (){
                context.go('/entrypoint');
              },
              child: Icon(Icons.arrow_back_ios_new,color: Kolors.kPrimary,size: 25.sp,)),
          title: ReusableText(text: "Favorite", style: appStyle(24, Kolors.kPrimary, FontWeight.w700)),
        ),
        backgroundColor: Kolors.kWhite,
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 10,right: 10),
              decoration: BoxDecoration(// Arrière-plan rouge pour les onglets non sélectionnés
                borderRadius: BorderRadius.circular(20),

              ),
              child: TabBar(
                dividerColor: Colors.transparent,
                labelColor: Colors.white,
                unselectedLabelColor:Kolors.kPrimary,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Kolors.kPrimary,
                ),
                tabs: [
                  Container(
                    width: 143.w,
                    height: 45.h,
                    decoration: BoxDecoration(
                        color: Kolors.kPrimaryLight,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Tab(
                      text: "Doctors",
                    ),
                  ),
                  Container(
                    height: 45.h,
                    width: 143.w,
                    decoration: BoxDecoration(
                      color: Kolors.kPrimaryLight,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Tab(
                      text: "Services",
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                  children: [
                    DoctorFavorite(),
                    ServiceFavorite()
                  ]),
            )
          ],
        ),
      ),
      );
  }
}
