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

double actRatings(
  double rate1,
  double rate2,
  double rate3,
  double rate4,
) {
  // avarage number of ratings

  double? rate = (rate1 + rate2 + rate3 + rate4) / 4;
  return rate;
}

double? avgratings(List<double>? raingList) {
  if (raingList == null || raingList.isEmpty) {
    return 0.0;
  }
  return raingList.reduce((value, element) => value + element) /
      raingList.length;
}

List<int> rateSave(
  List<int> list,
  int index,
) {
  list[index] += 1;

  return list;
}

double rateDisplay(List<int> cRate) {
  double sum = 0;
  for (var i = 1; i < 6; i += 1) sum += i * cRate[i];
  return sum;
}
