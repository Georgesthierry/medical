import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


TextStyle appStyle(double size, Color color, FontWeight fw) {
  return TextStyle(
    fontFamily: 'LeagueSpartan', // Utilise votre police personnalisée
    fontSize: size,
    color: color,
    fontWeight: fw,
  );
}