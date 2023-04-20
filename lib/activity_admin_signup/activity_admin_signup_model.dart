import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ActivityAdminSignupModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey3 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  // State field(s) for Email widget.
  TextEditingController? emailController;
  String? Function(BuildContext, String?)? emailControllerValidator;
  String? _emailControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'يجب تعبئة الحقل';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'الرجاء التأكد من صيغة البريد الإلكتروني';
    }
    return null;
  }

  // State field(s) for Password widget.
  TextEditingController? passwordController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordControllerValidator;
  String? _passwordControllerValidator(BuildContext context, String? val) {
    RegExp upper = RegExp(r"(?=.*[A-Z])");
    RegExp num = RegExp(r"[0-9]");
    RegExp small = RegExp(r"(?=.*[a-z])");
    RegExp char = RegExp(r"(?=.*[@\$!%*?&/><.,~`\':;{}[+=_#^*()±§|-])");
    if (val == null || val.isEmpty) {
      return 'الرجاء تعبئة الحقل';
    }

    if (val.length < 8) {
      return 'كلمة المرور يجب أن تتكون من ٨ خانات على الأقل';
    } else if (val.length < 8 &&
        !upper.hasMatch(val) &&
        !num.hasMatch(val) &&
        !small.hasMatch(val)) {
      return "كلمة المرور يجب أن تتكون من ٨ خانات وحرف كبير وصغير على الأقل ";
    } else if (val.length < 8 && !upper.hasMatch(val)) {
      return "كلمة المرور يجب أن تتكون من ٨ خانات وحرف كبير على الأقل ";
    } else if (val.length < 8 && !small.hasMatch(val)) {
      return "كلمة المرور يجب أن تتكون من ٨ خانات وحرف صغير على الأقل ";
    } else if (!upper.hasMatch(val) && !small.hasMatch(val)) {
      return "كلمة المرور يجب أن تحتوي على حرف كبير وصغير على الأقل ";
    } else if (!upper.hasMatch(val)) {
      return "كلمة المرور يجب أن تحتوي على حرف كبير على الأقل";
    } else if (!small.hasMatch(val)) {
      return "كلمة المرور يجب أن تحتوي على حرف صغير على الأقل";
    } else if (!num.hasMatch(val)) {
      return "كلمة المرور يجب أن تحتوي على رقم على الأقل ";
    } else if (!char.hasMatch(val))
      return "كلمة المرور يجب أن تحتوي على رمز خاص واحد على الأقل";
    return null;
  }

  // State field(s) for Confirmpassword widget.
  TextEditingController? confirmpasswordController;
  late bool confirmpasswordVisibility;
  String? Function(BuildContext, String?)? confirmpasswordControllerValidator;
  String? _confirmpasswordControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'الرجاء تعبئة الحقل';
    }

    if (val.length < 8) {
      return 'الرجاء تأكيد كلمة المرور';
    }

    if (!RegExp(
            '^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@\$!%*?&/><.,~`\':;{}[+=_#^*()±§|-])[A-Za-z\\d@\$!%*?&/><.,~`\':;{}[+=_#^*()±§|-]{8,}\$')
        .hasMatch(val)) {
      return 'الرجاء تأكيد كلمة المرور';
    }
    return null;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    emailControllerValidator = _emailControllerValidator;
    passwordVisibility = false;
    passwordControllerValidator = _passwordControllerValidator;
    confirmpasswordVisibility = false;
    confirmpasswordControllerValidator = _confirmpasswordControllerValidator;
  }

  void dispose() {
    emailController?.dispose();
    passwordController?.dispose();
    confirmpasswordController?.dispose();
  }

  /// Additional helper methods are added here.

}
