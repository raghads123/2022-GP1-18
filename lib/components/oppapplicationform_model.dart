import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OppapplicationformModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for userEmail widget.
  TextEditingController? userEmailController;
  String? Function(BuildContext, String?)? userEmailControllerValidator;
  // State field(s) for Skill widget.
  String? skillValue;
  // State field(s) for shortbio widget.
  TextEditingController? shortbioController;
  String? Function(BuildContext, String?)? shortbioControllerValidator;
  String? _shortbioControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'يجب تعبئة الحقل';
    }

    if (val.length > 280) {
      return 'يمكنك كتابة ٢٨٠ حرف فقط';
    }

    return null;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    shortbioControllerValidator = _shortbioControllerValidator;
  }

  void dispose() {
    userEmailController?.dispose();
    shortbioController?.dispose();
  }

  /// Additional helper methods are added here.

}
