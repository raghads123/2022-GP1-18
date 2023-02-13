import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditActModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // State field(s) for actName widget.
  TextEditingController? actNameController;
  String? Function(BuildContext, String?)? actNameControllerValidator;
  // State field(s) for actLoc widget.
  TextEditingController? actLocController;
  String? Function(BuildContext, String?)? actLocControllerValidator;
  // State field(s) for actBio widget.
  TextEditingController? actBioController;
  String? Function(BuildContext, String?)? actBioControllerValidator;
  bool isMediaUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  DateTime? datePicked;
  // State field(s) for TextField widget.
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    actNameController?.dispose();
    actLocController?.dispose();
    actBioController?.dispose();
    textController4?.dispose();
  }

  /// Additional helper methods are added here.

}
