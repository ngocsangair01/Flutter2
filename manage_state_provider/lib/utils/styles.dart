//TextStyle
import 'package:flutter/material.dart';
import './colors.dart';

const textDarkH1 = TextStyle(
  fontSize: 12,
  color: Colors.black54,

  fontFamily: 'Gotham',
);

const textDarkBoldH1 = TextStyle(
  fontSize: 12,
  color: Colors.black54,
  fontWeight: FontWeight.bold,
  fontFamily: 'Gotham',
);
const textWhiteBoldH1 = TextStyle(
  fontSize: 12,
  color: Colors.black54,

  fontFamily: 'Gotham',
);
const textDarkBoldH2 = TextStyle(
  fontSize: 14,
  color: Colors.black54,
  fontWeight: FontWeight.bold,
  fontFamily: 'Gotham',
);
const textBackBoldH2 = TextStyle(
  fontSize: 14,
  color: Colors.black,
  fontWeight: FontWeight.bold,
  fontFamily: 'Gotham',
);

const textDarkBoldH3 = TextStyle(
  fontSize: 16,
  color: Colors.black54,
  fontWeight: FontWeight.bold,
  fontFamily: 'Gotham',
);
//OpenSans
const textBlackBoldH3 = TextStyle(
  fontSize: 16,
  color: Colors.black87,
  fontWeight: FontWeight.bold,
  fontFamily: 'Gotham',
);

const textContentH1 = TextStyle(
  fontSize: 12,
  color: Colors.grey,
  fontFamily: 'Gotham',
);

const textContentH0 = TextStyle(
  fontSize: 10,
  color: Colors.grey,
  fontFamily: 'Gotham',
);
//
const textGrayH3 = TextStyle(
  fontSize: 16,
  color: colorGrayText,
  fontFamily: 'Gotham',
);
const textGrayH2 = TextStyle(
  fontSize: 14,
  color: Color(0xff9B9B9B),
  fontFamily: 'Gotham',
);

const textPrimaryH1 = TextStyle(
  fontSize: 12,
  color: gradientStartColor,
  fontFamily: 'Gotham',
);

const textLabelH1 = TextStyle(
  fontSize: 12,
  color: Colors.black54,
  fontFamily: 'Gotham',
);

const textPrimaryH1Bold = TextStyle(
  fontSize: 12,
  color: gradientStartColor,
  fontFamily: 'Gotham',
  fontWeight: FontWeight.w600,
);

const textButton = TextStyle(
  color: Colors.white,
  letterSpacing: 1,
  fontSize: 12.0,

  fontFamily: 'Gotham',
);

const textLabelInput = TextStyle(
  color: primaryColor,
  letterSpacing: 1,
  fontSize: 12.0,

  fontFamily: 'Gotham',
);

const textDarkBoldH2Underline = TextStyle(
  fontSize: 14,
  decoration: TextDecoration.underline,
  color: Colors.black54,
  fontWeight: FontWeight.bold,
  fontFamily: 'Gotham',
);
//custom border
class CustomBorder {
  static var enabledBorder = const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(15)),
      );

  static var focusBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: primaryMaterialColor,)
  );

  static var errorBorder = const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(15)),
      borderSide: BorderSide(color: Colors.red, width: 1));
}

//custom textstyle
class CustomTextStyle {
  static var textFormFieldRegular = const TextStyle(
      fontSize: 12,
      fontFamily: "Helvetica",
      color: Colors.black,
      fontWeight: FontWeight.w400);

  static var textFormFieldLight =
  textFormFieldRegular.copyWith(fontWeight: FontWeight.w200);

  static var textFormFieldMedium =
  textFormFieldRegular.copyWith(fontWeight: FontWeight.w500);

  static var textFormFieldSemiBold =
  textFormFieldRegular.copyWith(fontWeight: FontWeight.w600);

  static var textFormFieldBold =
  textFormFieldRegular.copyWith(fontWeight: FontWeight.w700);

  static var textFormFieldBlack =
  textFormFieldRegular.copyWith(fontWeight: FontWeight.w900);
}

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static double? defaultSize;
  static Orientation? orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  }
}

// Get the proportionate height as per screen size
double getProportionateScreenHeight(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight;
  // 812 is the layout height that designer use
  return (inputHeight / 812.0) * screenHeight;
}

// Get the proportionate height as per screen size
double getProportionateScreenWidth(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth;
  // 375 is the layout width that designer use
  return (inputWidth / 375.0) * screenWidth;
}


