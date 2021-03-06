// ignore_for_file: unused_import, import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const kGrey1 = Color(0xFF9F9F9F);
const kGrey2 = Color(0xFF6D6D6D);
const kGrey3 = Color(0xFFEAEAEA);
const kBlack = Color(0xFF1C1C1C);

var kNonActiveTabStyle = GoogleFonts.roboto(
  // ignore: prefer_const_constructors
  textStyle: TextStyle(
    fontSize: 14.0,
    color: kGrey2,
  ),
);
var kActiveTabStyle = GoogleFonts.roboto(
  // ignore: prefer_const_constructors
  textStyle: TextStyle(
    fontSize: 16.0,
    color: kBlack,
    fontWeight:FontWeight.bold,
  ),
);
var kCategoryTitle = GoogleFonts.roboto(
  // ignore: prefer_const_constructors
  textStyle: TextStyle(
    fontSize: 14.0,
    color: kGrey1,
    fontWeight:FontWeight.bold,
  )
);
var kDetailContent = GoogleFonts.roboto(
  // ignore: prefer_const_constructors
  textStyle: TextStyle(
    fontSize: 14.0,
    color: kGrey2,
  )
);
var kTitleCard = GoogleFonts.roboto(
  // ignore: prefer_const_constructors
  textStyle: TextStyle(
    fontSize: 18.0,
    color: kBlack,
    fontWeight:FontWeight.bold,
  )
);