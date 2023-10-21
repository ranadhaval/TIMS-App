import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tims/util/hex_code.dart';

import 'dark_theme.dart';
import 'light_theme.dart';

bool isTablet = SizerUtil.deviceType == DeviceType.tablet;

class AppTheme {
  AppTheme._();

  static ThemeData light = lightTheme;
  static ThemeData dark = darkTheme;

  static const String appFontName = 'Roboto';

  // Font Size
  static const double verySmall = 8;
  static const double small = 15;
  static const double medium = 15;
  static const double medium_1 = 16;
  static const double large = 18;
  static const double large_1 = 20;
  static const double extraLarge = 22;
  static const double doubleExtraLarge = 24;
  static const double authTitle = 25.5;
  static const double errorSize = 14;
  static const double appBarTextSize = 14;
  static const double NASize = 13;
  static const double PoupUpTitleSize = 12.5;

// Colors
  static Color colorPrimary = HexColor("#5867DD"); //184392, FFB71A,5867DD
  static Color colorAccent = HexColor("#5867DD");
  static Color colorStatusBar = HexColor("#6C92F4");
  static Color colorTransparent = Colors.transparent;
  static Color lightPrimary = HexColor('#F8BD0A');
  static Color loginPagePrimaryColor = HexColor("#32a4be");

  static const Color colorPrimaryTheme = Color(0xFF5867DD);
  static const Color colorAccentTheme = Color(0xFF5867DD);

  static const Color colorWhite = Colors.white;
  static Color colorBlack = HexColor("#000000");
  static Color colorLightBlack = colorBlack.withOpacity(0.6);
  static Color colorIconGrey = HexColor("#999999");
  static Color colorGrey = HexColor("#8d8d8d");
  static Color colorLightGrey = HexColor("#E4E4E4");
  static Color colorDisableGray = HexColor("#ABABAB");
  static Color colorGrayTxtBg = HexColor('#E9E9E9');

  static Color colorRed = HexColor("#F4516C");
  static Color colorError = HexColor("#D32F2E");
  static Color colorGreen = HexColor("#2ED47A");
  static Color colorBlue = HexColor("#1F77C1");

  static Color colorBlackStart = HexColor("#000000");
  static Color colorBlackEnd = HexColor("#212121");

  static Color colorProgress = HexColor("#5867DD");
  static Color colorProgressend = const Color(0xFFa4edeb);
  static Color colorProgressBg = HexColor("#d9d9d9");

  static Color colorPositive = HexColor("#87BCBF");
  static Color colorNagative = HexColor("#D97D54");

  static Color dividerColor = HexColor("#707070");

  static Color titleDark = HexColor('#334856');
  static Color titleNormal = HexColor('#899095');

  static Color colorBG = HexColor('#F0F3F4');
  static Color colorCardBtn = HexColor("#ECF0F1");
  static Color colorCardWhiteBtn = HexColor("#FBE7E2");
  static Color colorCardBg = HexColor("#F7F9F9");

  static Color appbar = HexColor("#5C70E2");
  static Color colorDrawerSelectedBg = HexColor("#F1F1F1");

  static Color colorGray = HexColor("#B0B8BF");
  static Color colorDarkGray = HexColor("#777984");
  static Color colorListItemGray = HexColor("#D6D6D8");

  static Color colorTimerBarend = HexColor('#eb891f');
  static Color colorTimerBarstart = HexColor('#f9be31');

  static Color colorFinishBtnrend = HexColor('#fc5e6e');
  static Color colorFinishBtnstart = HexColor('#cd1b83');

  static Color colorSNBtnrend = HexColor('#1c98bd');
  static Color colorSNBtnstart = HexColor('#78c4bb');

  static Color colorquemarkstart = HexColor('#388372');
  static Color colorquemarkend = HexColor('#46b386');

  static Color selectedBordercolor = HexColor('#368833');
  static Color wrongAnswerBordercolor = HexColor('#bd4339');

  static Color colorProgressresultStart = HexColor('#fcb762');
  static Color colorProgressresultend = HexColor('#f94a63');

  static Color pinkContainerShadow = HexColor('#edb2c1');
  static Color pinkContainerStart = HexColor('#ea53a9');
  static Color pinkContainerEnd = HexColor('#edb2c1');
  static Color blueContainerShadow = HexColor('#8dd9f2');
  static Color blueContainerStart = HexColor('#3b95f4');
  static Color blueContainerEnd = HexColor('#8dd9f2');
  static Color resultCorrectStart = HexColor('#149ba4');
  static Color resultInCorrectStart = HexColor('#9f4996');
  static Color resultTimeTakenStart = HexColor('#2c4556');
  static Color resultTimeTakenEnd = HexColor('#348ac2');
  static Color resultCorrectEnd = HexColor('#23e1b0');
  static Color resultInCorrectEnd = HexColor('#d96d99');
  static Color progressbgresult = HexColor("#dfe6ec");

  static Color caFontColor = HexColor('#93bec0');

  static Color popupTitleStart = HexColor('#7ac0bf');
  static Color popupTitleEnd = HexColor('#2591aa');
  static Color popupInputColor = HexColor('#ecf0f2');

  //onboarding
  static Color skip1BodyColor = HexColor("#43a9cd");
  static Color skip1BorderColor = Colors.transparent;
  static Color skip1CircleBorder = HexColor("#96d1d8");

  static Color skip2BodyColor = HexColor("#f19b10");
  static Color skip2BorderColor = HexColor("#eec480");

  static Color skip3BodyColor = HexColor("#e2615c");
  static Color skip3BorderColor = HexColor("#efb9be");

  static Color skip4BodyColor = HexColor("#8964b2");
  static Color skip4BorderColor = HexColor("#d1c0e3");

  // matrix page colors
  static Color AppbarColor = HexColor("#50b3c0");
  static Color gradientColor = HexColor("#61b9bb");
  static Color gradientColor2 = HexColor("#40aaba");
  static Color gradientColor3 = HexColor("#37a7bd");
  static Color colorx = Colors.pink;
  static Color tileColor = HexColor("#76c6b9").withOpacity(0.2);
  static Color tileContainerColor = HexColor("#76c6b9");
  static Color texttilecolor = HexColor("#76c6b9");

  // Login box colors
  static Color logoCircle = HexColor("#ece5dd");
  static Color textfeildColor = HexColor("#ecf0f2");
  static Color loginboxColor1 = HexColor("#6fbfbc");
  static Color loginboxColor2 = HexColor("#55aebe");
  static Color loginboxColor3 = HexColor("#2ca2bc");

  //viewmaterial theme

  static Color overlapstartColor = HexColor('#74c5bf');
  static Color overlapendColor = HexColor('#398da2');

  // text style
  static TextStyle textStyle(
      {fontWeight = FontWeight.normal,
      fontSize = medium,
      color = Colors.black}) {
    return TextStyle(
        fontFamily: appFontName,
        fontWeight: fontWeight,
        fontSize: fontSize,
        color: color,
        height: 1);
  }

  // dropdown text style
  static TextStyle dropdownTextStyle = TextStyle(
    color: AppTheme.colorBlack,
    fontSize: AppTheme.large,
    fontWeight: FontWeight.w400,
    height: 1,
    fontFamily: AppTheme.appFontName,
    decoration: TextDecoration.none,
  );

  // dropdown error style
  static TextStyle dropdownErrorStyle = TextStyle(
    color: AppTheme.colorError,
    fontWeight: FontWeight.normal,
    fontSize: AppTheme.errorSize,
  );

  // dropdown label style
  static TextStyle dropdownLabelStyle = TextStyle(
    color: AppTheme.colorBlack,
    fontSize: AppTheme.large,
    fontWeight: FontWeight.normal,
    height: 1,
    fontFamily: AppTheme.appFontName,
    decoration: TextDecoration.none,
  );

  // dropdown hint style
  static TextStyle dropdownHintStyle = TextStyle(
    fontSize: AppTheme.large,
    fontWeight: FontWeight.normal,
    height: 1,
    color: AppTheme.colorIconGrey,
    fontFamily: AppTheme.appFontName,
    decoration: TextDecoration.none,
  );

  static TextTheme textTheme = TextTheme(
      bodyMedium: TextStyle(
          fontFamily: appFontName,
          fontWeight: FontWeight.normal,
          fontSize: small.sp,
          color: Colors.black,
          height: 1));
}
