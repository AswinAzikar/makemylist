import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:makemylist/utils/size_utils.dart';

delayed({Duration duration = const Duration(seconds: 2)}) async {
  return await Future.delayed(duration);
}

const double padding = 8;
const double paddingLarge = 16;
const double paddingXL = 32;
const double paddingXXL = 64;
const double paddingSmall = 4;
const double paddingTiny = 2;

final gap = Gap(padding.h);
final gapLarge = Gap(paddingLarge.h);
final gapXL = Gap(paddingXL.h);
final gapXXL = Gap(paddingXXL.h);
final gapSmall = Gap(paddingSmall.h);
final gapTiny = Gap(paddingTiny.h);

List<BoxShadow> constShadow = [
  BoxShadow(
    color: Colors.black.withOpacity(0.2),
    spreadRadius: 2,
    blurRadius: 10,
    offset: const Offset(0, 5), // changes position of shadow
  ),
];

LinearGradient primaryGradient = const LinearGradient(
  colors: [
    Color(0xffEF6161),
    Color(0xFFF2D50F),
  ],
  stops: [0.15, 0.79],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);
Color primalColor = const Color(0xFFFA9A35);
Color offwhite = const Color(0xffF5F7F8);
Color pureWhite = const Color(0xffFFFFFF);
Color headingText = const Color(0xff000000);
Color miniHeadingText = const Color(0xffA3A5A7);
const Color greyBorder = Color(0xFFA3A5A7);
Color contentOffWhite = const Color(0xffEFEFEF);
Color navBarColor = const Color(0xffFfffff);
Color mildGray = const Color(0xffC8C8C8);
Color inactiveGray = mildGray;
Color textBlack = const Color(0xff000000);
Color textYellow = const Color(0xffCC971C);
Color textGreyLight = const Color(0xff05070B).withValues(alpha: 0.90);

// colors of the border
Color borderStroke = const Color(0xffCCC9C9);

// const Color primaryColor = Color(0xff9D696A);

const Color primaryColor = Color(0xff6b45bc);

const Duration animationDuration = Duration(milliseconds: 300);
const Duration animationDurationLarge = Duration(seconds: 1);
