import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/edit_info_component_widget.dart';
import '/components/edit_interests_component_widget.dart';
import '/components/edit_notification_component_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfileCopyModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for name widget.
  TextEditingController? nameController;
  String? Function(BuildContext, String?)? nameControllerValidator;
  // State field(s) for college widget.
  String? collegeValue;
  FormFieldController<String>? collegeController;
  // State field(s) for level widget.
  String? levelValue;
  FormFieldController<String>? levelController;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue1;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue2;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    nameController?.dispose();
  }

  /// Additional helper methods are added here.

}
