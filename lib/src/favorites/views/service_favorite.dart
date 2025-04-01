import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical/common/widgets/app_style.dart';
import 'package:medical/common/widgets/reusable_text.dart';

import '../../../common/utils/kcolors.dart';

class ServiceFavorite extends StatefulWidget {
  const ServiceFavorite({super.key});

  @override
  State<ServiceFavorite> createState() => _ServiceFavoriteState();
}

class _ServiceFavoriteState extends State<ServiceFavorite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Kolors.kWhite,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height-100,
          child: ListView.builder(
              itemCount: 11,
              itemBuilder: (context,index){
                return Padding(
                  padding: const EdgeInsets.only(left: 30.0,right: 30,top: 25),
                  child: Container(
                    height: 40.h,
                    width: 300.w,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(18),
                        color: Kolors.kPrimary),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            children: [
                              Icon(Icons.favorite,size: 30,color: Kolors.kWhite,),
                              SizedBox(width: 5,),
                              ReusableText(text: "Dermato-Endocrinology", style: appStyle(20, Kolors.kWhite, FontWeight.w700))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Container(
                            height: 24.h,
                            width: 24.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),color: Kolors.kWhite
                            ),
                              child: Icon(Icons.keyboard_arrow_down_outlined,size: 25,color: Kolors.kPrimary,)),
                        )
                      ],
                    )
                  ),
                );
              }),

        ),
      ),
    );
  }
}
