import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

double MAX_HEIGHT = Get.height;
double MAX_WIDTH = Get.width;

// Size size = WidgetsBinding.instance.window.physicalSize;

const double HEIGHT_PADDING = 20;

const String AUTH_TOKEN = 'auth_token';
const String LANGUAGE_CODE = 'language_code';
const String FCM_TOKEN = 'fcm_token';

const String RESTAURANT_ID = "QizoiAmXjqTFvuTBev5Cvw==";
const String RESTAURANT_NAME = "KABAB KING";

//=============language===================//

const String ENGLISH = 'en-us';
const String URDU = 'ur-pk';
const String BANGLA = 'bn-bd';
const String HINDI = 'hi-in';


//===================Regex=======================//

final LETTER_ONLY = FilteringTextInputFormatter.allow(
  RegExp(r"[a-zA-Z]+|\s"),
);

final NUMBER_ONLY = FilteringTextInputFormatter.allow(
  RegExp(r"\d"),
);

final NUMBER_ONLY_WITH_OUT_ZERO_PREFIX_DIGIT =
FilteringTextInputFormatter.allow(
  RegExp(r'^(?:[1-9]|[1-9][0-9]{0,2}|[12][0-9]{3}|1000)$'),
);

final MAX_LENGTH_400 = FilteringTextInputFormatter.allow(
  RegExp(r'^.{1,400}$'),
);


//==============box decoration==================//
BorderRadius ROUNDED_2 = BorderRadius.circular(2);
BorderRadius ROUNDED_FULL = BorderRadius.circular(50);

//=============text style======================//
//===============gaps========================//
SizedBox VERTICAL_GAP_2 = const SizedBox(height: 2);
SizedBox VERTICAL_GAP_5 = const SizedBox(height: 5);
SizedBox VERTICAL_GAP_8 = const SizedBox(height: 8);
SizedBox VERTICAL_GAP_10 = const SizedBox(height: 10);
SizedBox VERTICAL_GAP_12 = const SizedBox(height: 12);
SizedBox VERTICAL_GAP_16 = const SizedBox(height: 16);
SizedBox VERTICAL_GAP_20 = const SizedBox(height: 20);
SizedBox VERTICAL_GAP_24 = const SizedBox(height: 24);
SizedBox VERTICAL_GAP_32 = const SizedBox(height: 32);

Widget EXPANDED = const Expanded(child: SizedBox());

SizedBox HORIZONTAL_GAP_2 = const SizedBox(width: 2);
SizedBox HORIZONTAL_GAP_4 = const SizedBox(width: 5);
SizedBox HORIZONTAL_GAP_5 = const SizedBox(width: 5);
SizedBox HORIZONTAL_GAP_8 = const SizedBox(width: 8);
SizedBox HORIZONTAL_GAP_10 = const SizedBox(width: 10);
SizedBox HORIZONTAL_GAP_12 = const SizedBox(width: 12);
SizedBox HORIZONTAL_GAP_16 = const SizedBox(width: 16);
SizedBox HORIZONTAL_GAP_20 = const SizedBox(width: 20);
SizedBox HORIZONTAL_GAP_24 = const SizedBox(width: 24);
SizedBox HORIZONTAL_GAP_32 = const SizedBox(width: 32);

//=====================textStyle================
TextStyle ERROR_TEXT_STYLE =
const TextStyle(color: RED, fontWeight: FontWeight.w500, fontSize: 10);
TextStyle N300_14_NORMAL = GoogleFonts.poppins(
    color: NEUTRAL_N300, fontSize: 14, fontWeight: FontWeight.normal); //done
TextStyle N300_14_W500 = GoogleFonts.poppins(
    color: NEUTRAL_N300, fontSize: 14, fontWeight: FontWeight.w500);
TextStyle N300_12_W500 = GoogleFonts.poppins(
    color: NEUTRAL_N300, fontSize: 12, fontWeight: FontWeight.normal);
TextStyle N500_14_W400 = GoogleFonts.poppins(
    color: NEUTRAL_N500, fontSize: 14, fontWeight: FontWeight.normal);
TextStyle N700_18_NORMAL = GoogleFonts.poppins(
    color: NEUTRAL_N700, fontSize: 18, fontWeight: FontWeight.normal);
TextStyle WHITE_18_NORMAL = GoogleFonts.poppins(
    color: WHITE, fontSize: 18, fontWeight: FontWeight.normal);
TextStyle N300_16_W500 = GoogleFonts.poppins(
    color: NEUTRAL_N300, fontSize: 16, fontWeight: FontWeight.w500); //done
TextStyle N300_22_NORMAL = GoogleFonts.poppins(
    color: NEUTRAL_N300, fontSize: 22, fontWeight: FontWeight.normal); //done
TextStyle N700_12_NORMAL = GoogleFonts.poppins(
    color: NEUTRAL_N700, fontSize: 12, fontWeight: FontWeight.normal); //done
TextStyle N700_12_W500 = GoogleFonts.poppins(
    color: NEUTRAL_N700, fontSize: 12, fontWeight: FontWeight.w500); //done
TextStyle N700_14_NORMAL = GoogleFonts.poppins(
    color: NEUTRAL_N700, fontSize: 14, fontWeight: FontWeight.normal); //done
TextStyle N700_14_W500 = GoogleFonts.poppins(
    color: NEUTRAL_N700, fontSize: 14, fontWeight: FontWeight.w500); //done
TextStyle N700_16_W500 = GoogleFonts.poppins(
    color: NEUTRAL_N700, fontSize: 16, fontWeight: FontWeight.w500); //done
TextStyle N700_16_W500_LINE_THROUGH = GoogleFonts.poppins(
    color: NEUTRAL_N700,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    decoration: TextDecoration.lineThrough); //done
TextStyle N300_16_W500_LINE_THROUGH = GoogleFonts.poppins(
    color: NEUTRAL_N300,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    decoration: TextDecoration.lineThrough); //done
TextStyle E500_16_W500 = GoogleFonts.poppins(
    color: ERROR_500, fontSize: 16, fontWeight: FontWeight.w500); //done
TextStyle N700_20_W500 = GoogleFonts.poppins(
    color: NEUTRAL_N700, fontSize: 20, fontWeight: FontWeight.w500);
TextStyle N700_24_W500 = GoogleFonts.poppins(
    color: NEUTRAL_N700, fontSize: 24, fontWeight: FontWeight.w500);
TextStyle PRIMARY_14_W500 = GoogleFonts.poppins(
    color: PRIMARY_COLOR, fontSize: 14, fontWeight: FontWeight.w500);
TextStyle PRIMARY_20_W500 = GoogleFonts.poppins(
    color: PRIMARY_COLOR, fontSize: 20, fontWeight: FontWeight.w500);
TextStyle N100_14_W500 = GoogleFonts.poppins(
    color: NEUTRAL_N100, fontSize: 14, fontWeight: FontWeight.w500);
TextStyle N200_14_W500 = GoogleFonts.poppins(
    color: NEUTRAL_N200, fontSize: 14, fontWeight: FontWeight.w500);

TextStyle WHITE_14_W500 = GoogleFonts.poppins(
    color: WHITE, fontSize: 14, fontWeight: FontWeight.w500);
TextStyle MEGEBTA_SEED_20_W500 = GoogleFonts.poppins(
    color: PRIMARY_COLOR, fontSize: 20, fontWeight: FontWeight.w500);
TextStyle MEGEBTA_SEED_14_W500 = GoogleFonts.poppins(
    color: PRIMARY_COLOR, fontSize: 14, fontWeight: FontWeight.w500);
