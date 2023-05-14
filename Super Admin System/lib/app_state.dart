import 'package:flutter/material.dart';
import 'backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

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

  List<DocumentReference> _userswantnotif = [];
  List<DocumentReference> get userswantnotif => _userswantnotif;
  set userswantnotif(List<DocumentReference> _value) {
    _userswantnotif = _value;
  }

  void addToUserswantnotif(DocumentReference _value) {
    _userswantnotif.add(_value);
  }

  void removeFromUserswantnotif(DocumentReference _value) {
    _userswantnotif.remove(_value);
  }

  void removeAtIndexFromUserswantnotif(int _index) {
    _userswantnotif.removeAt(_index);
  }

  List<String> _skilllist = [];
  List<String> get skilllist => _skilllist;
  set skilllist(List<String> _value) {
    _skilllist = _value;
  }

  void addToSkilllist(String _value) {
    _skilllist.add(_value);
  }

  void removeFromSkilllist(String _value) {
    _skilllist.remove(_value);
  }

  void removeAtIndexFromSkilllist(int _index) {
    _skilllist.removeAt(_index);
  }

  List<String> _numskills = [];
  List<String> get numskills => _numskills;
  set numskills(List<String> _value) {
    _numskills = _value;
  }

  void addToNumskills(String _value) {
    _numskills.add(_value);
  }

  void removeFromNumskills(String _value) {
    _numskills.remove(_value);
  }

  void removeAtIndexFromNumskills(int _index) {
    _numskills.removeAt(_index);
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
