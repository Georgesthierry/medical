import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical/common/utils/kcolors.dart';
import 'package:medical/common/widgets/app_style.dart';
import 'package:medical/common/widgets/reusable_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onTap, this.btnWidth, this.btnHieght, this.radius, required this.text, this.textSize, this.borderColor, this.btnColor,});

  final void Function()? onTap;
  final double? btnWidth;
  final double? btnHieght;
  final double? radius;
  final String text;
  final double? textSize;
  final Color? borderColor;
  final Color? btnColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: btnWidth ?? ScreenUtil().screenWidth / 2,
        height: btnHieght ?? 35.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius??6),
          color: btnColor?? const Color.fromARGB(35, 78, 113, 255),
          border: Border.all(width: 0.5.h, color:borderColor?? Kolors.kWhite),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w),
            child: ReusableText(
                text: text, style: appStyle(textSize??13, borderColor??Kolors.kPrimary, FontWeight.w500)),
          ),
        ),
      ),
    );
  }
}