import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _userSigned = '';
  String get userSigned => _userSigned;
  set userSigned(String _value) {
    _userSigned = _value;
  }

  int _numskills = 1;
  int get numskills => _numskills;
  set numskills(int _value) {
    _numskills = _value;
  }

  List<String> _ActCategory = [];
  List<String> get ActCategory => _ActCategory;
  set ActCategory(List<String> _value) {
    _ActCategory = _value;
  }

  void addToActCategory(String _value) {
    _ActCategory.add(_value);
  }

  void removeFromActCategory(String _value) {
    _ActCategory.remove(_value);
  }

  void removeAtIndexFromActCategory(int _index) {
    _ActCategory.removeAt(_index);
  }

  List<String> _Skilllist = [];
  List<String> get Skilllist => _Skilllist;
  set Skilllist(List<String> _value) {
    _Skilllist = _value;
  }

  void addToSkilllist(String _value) {
    _Skilllist.add(_value);
  }

  void removeFromSkilllist(String _value) {
    _Skilllist.remove(_value);
  }

  void removeAtIndexFromSkilllist(int _index) {
    _Skilllist.removeAt(_index);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
