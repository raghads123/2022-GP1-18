import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddoppModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for oppName widget.
  TextEditingController? oppNameController;
  String? Function(BuildContext, String?)? oppNameControllerValidator;
  String? _oppNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'يجب تعبئة الحقل';
    }

    return null;
  }

  // State field(s) for oppskill1 widget.
  TextEditingController? oppskill1Controller;
  String? Function(BuildContext, String?)? oppskill1ControllerValidator;
  String? _oppskill1ControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'يجب تعبئة الحقل';
    }

    return null;
  }

  // State field(s) for oppskill2 widget.
  TextEditingController? oppskill2Controller;
  String? Function(BuildContext, String?)? oppskill2ControllerValidator;
  // State field(s) for oppskill3 widget.
  TextEditingController? oppskill3Controller;
  String? Function(BuildContext, String?)? oppskill3ControllerValidator;
  // State field(s) for oppskill4 widget.
  TextEditingController? oppskill4Controller;
  String? Function(BuildContext, String?)? oppskill4ControllerValidator;
  // State field(s) for oppskill5 widget.
  TextEditingController? oppskill5Controller;
  String? Function(BuildContext, String?)? oppskill5ControllerValidator;
  // State field(s) for oppdes widget.
  TextEditingController? oppdesController;
  String? Function(BuildContext, String?)? oppdesControllerValidator;
  String? _oppdesControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'يجب تعبئة الحقل';
    }

    return null;
  }

  DateTime? datePicked1;
  DateTime? datePicked2;
  DateTime? datePicked3;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    oppNameControllerValidator = _oppNameControllerValidator;
    oppskill1ControllerValidator = _oppskill1ControllerValidator;
    oppdesControllerValidator = _oppdesControllerValidator;
  }

  void dispose() {
    oppNameController?.dispose();
    oppskill1Controller?.dispose();
    oppskill2Controller?.dispose();
    oppskill3Controller?.dispose();
    oppskill4Controller?.dispose();
    oppskill5Controller?.dispose();
    oppdesController?.dispose();
  }

  /// Additional helper methods are added here.

}
