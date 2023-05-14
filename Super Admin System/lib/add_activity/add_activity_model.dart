import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/category_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddActivityModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for actName widget.
  TextEditingController? actNameController;
  String? Function(BuildContext, String?)? actNameControllerValidator;
  String? _actNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'يجب تعبئة الحقل';
    }

    return null;
  }

  // State field(s) for actLoc widget.
  TextEditingController? actLocController;
  String? Function(BuildContext, String?)? actLocControllerValidator;
  String? _actLocControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'يجب تعبئة الحقل';
    }

    return null;
  }

  // State field(s) for actBio widget.
  TextEditingController? actBioController;
  String? Function(BuildContext, String?)? actBioControllerValidator;
  String? _actBioControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'يجب تعبئة الحقل';
    }

    return null;
  }

  // State field(s) for actType widget.
  String? actTypeValue;
  FormFieldController<String>? actTypeValueController;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  DateTime? datePicked1;
  DateTime? datePicked2;
  DateTime? datePicked3;
  DateTime? datePicked4;
  // State field(s) for CheckboxListTile widget.
  bool? checkboxListTileValue;
  // State field(s) for TextField widget.
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    actNameControllerValidator = _actNameControllerValidator;
    actLocControllerValidator = _actLocControllerValidator;
    actBioControllerValidator = _actBioControllerValidator;
  }

  void dispose() {
    actNameController?.dispose();
    actLocController?.dispose();
    actBioController?.dispose();
    textController4?.dispose();
  }

  /// Additional helper methods are added here.

}
