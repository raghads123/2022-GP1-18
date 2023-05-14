import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/firebase_auth/auth_util.dart';

bool showSearchResult(
  String textSearchFor,
  String textSearchIn,
) {
  return textSearchIn.toLowerCase().contains(textSearchFor.toLowerCase());
}

bool showSearchResultCourse(
  String textSearchFor2,
  String textSearchIn2,
) {
  return textSearchIn2.toLowerCase().contains(textSearchFor2.toLowerCase());
}

bool showSearchResultWorkshops(
  String textSearchFor3,
  String textSearchIn3,
) {
  return textSearchIn3.toLowerCase().contains(textSearchFor3.toLowerCase());
}

bool showSearchResultOp(
  String textSearchFor4,
  String textSearchIn4,
) {
  return textSearchIn4.toLowerCase().contains(textSearchFor4.toLowerCase());
}

int allpending(
  int allacts,
  int allopps,
) {
  // get the sun of given numbers and return a zero if they are empty
  return allacts + allopps;
}

double rateDisplay(
  int num1,
  int num2,
  int num3,
  int num4,
  int num5,
  int count,
) {
  // 5 star survey
  // get the sun of given numbers and return a zero if they are empty

  return ((num1 + num2 * 2 + num3 * 3 + num4 * 4 + num5 * 5) / count)
      .roundToDouble();
}
