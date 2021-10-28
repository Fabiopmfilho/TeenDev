import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTextStyles {
  static final TextStyle title = GoogleFonts.notoSans(
    color: AppColors.white,
    fontSize: 20,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle titleBold = GoogleFonts.notoSans(
    color: AppColors.white,
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle splash = GoogleFonts.notoSans(
    color: AppColors.white,
    fontSize: 50,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle splashBold = GoogleFonts.notoSans(
    color: AppColors.white,
    fontSize: 50,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle heading = GoogleFonts.notoSans(
    color: AppColors.black,
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle heading40 = GoogleFonts.notoSans(
    color: AppColors.black,
    fontSize: 40,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle heading15 = GoogleFonts.notoSans(
    color: AppColors.black,
    fontSize: 15,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle body = GoogleFonts.notoSans(
    color: AppColors.white,
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );

  static final TextStyle bodyBold = GoogleFonts.notoSans(
    color: AppColors.white,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle bodyBlack = GoogleFonts.notoSans(
    color: AppColors.black,
    fontSize: 22,
    fontWeight: FontWeight.normal,
  );
  
  static final TextStyle body11 = GoogleFonts.notoSans(
    color: AppColors.grey,
    fontSize: 11,
    fontWeight: FontWeight.normal,
  );

  static final TextStyle body16 = GoogleFonts.notoSans(
    color: AppColors.white,
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );

  static final TextStyle body20 = GoogleFonts.notoSans(
    color: AppColors.white,
    fontSize: 20,
    fontWeight: FontWeight.w700,
  );

  static final buttonGray = GoogleFonts.inter(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: AppColors.grey,
  );
  
  static final timer = GoogleFonts.inter(
    fontSize: 35,
    fontWeight: FontWeight.w700,
    color: AppColors.black,
  );


}
