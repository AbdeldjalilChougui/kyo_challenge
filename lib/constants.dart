import 'package:flutter/cupertino.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';

const Color kMainColor = Color(0xffE50043);

const Widget horizontalSpaceTiny = SizedBox(width: 5.0);
const Widget horizontalSpaceSmall = SizedBox(width: 10.0);
const Widget horizontalSpaceRegular = SizedBox(width: 18.0);
const Widget horizontalSpaceMedium = SizedBox(width: 25.0);
const Widget horizontalSpaceLarge = SizedBox(width: 50.0);

const Widget verticalSpaceTiny = SizedBox(height: 5.0);
const Widget verticalSpaceSmall = SizedBox(height: 10.0);
const Widget verticalSpaceRegular = SizedBox(height: 18.0);
const Widget verticalSpaceMedium = SizedBox(height: 25.0);
const Widget verticalSpaceLarge = SizedBox(height: 50.0);

const Color kMainGray = Color(0xff89807A);
const Color kMainDisabledGray = Color(0xffDDDDDD);
const Color kTextFiledMainColor = Color(0xfff3f7FB);
const Color kTextFiledGrayColor = Color(0xffF0F0F0);
const Color kGrayText = Color(0xff9FA0B4);

const kMainGradient = LinearGradient(
  colors: [
    kMainColor,
    kMainColor,
  ],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

const kMainDisabledGradient = LinearGradient(
  colors: [
    kMainDisabledGray,
    kMainDisabledGray,
  ],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

const kDisabledGradient = LinearGradient(
  colors: [
    kTextFiledGrayColor,
    kTextFiledGrayColor,
  ],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

double screenHeightPercentage(BuildContext context, {double percentage = 1}) =>
    screenHeight(context) * percentage;

double screenWidthPercentage(BuildContext context, {double percentage = 1}) =>
    screenWidth(context) * percentage;

showMotionToast({BuildContext? context, String? title, String? msg, MotionToastType? type}) {
  if (type == MotionToastType.warning) {
    MotionToast.warning(
      title: Text(title!),
      description: Text(msg!),
      animationCurve: Curves.easeIn,
      animationDuration: const Duration(milliseconds: 200),
    ).show(context!);
  } else if (type == MotionToastType.success) {
    MotionToast.success(
      title: Text(title!),
      description: Text(msg!),
      animationCurve: Curves.easeIn,
      animationDuration: const Duration(milliseconds: 200),
    ).show(context!);
  } else if (type == MotionToastType.error) {
    MotionToast.error(
      title: Text(title!),
      description: Text(msg!),
      animationCurve: Curves.easeIn,
      animationDuration: const Duration(milliseconds: 200),
    ).show(context!);
  } else if (type == MotionToastType.delete) {
    MotionToast.delete(
      title: Text(title!),
      description: Text(msg!),
      animationCurve: Curves.easeIn,
      animationDuration: const Duration(milliseconds: 200),
    ).show(context!);
  } else {
    MotionToast.info(
      title: Text(title!),
      description: Text(msg!),
      animationCurve: Curves.easeIn,
      animationDuration: const Duration(milliseconds: 200),
    ).show(context!);
  }
}