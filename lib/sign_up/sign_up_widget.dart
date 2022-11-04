import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({Key? key}) : super(key: key);

  @override
  _SignUpWidgetState createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  TextEditingController? confirmpasswordController;

  late bool confirmpasswordVisibility;
  TextEditingController? emailController;
  TextEditingController? passwordController;

  late bool passwordVisibility;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    confirmpasswordController = TextEditingController();
    confirmpasswordVisibility = false;
    emailController = TextEditingController();
    passwordController = TextEditingController();
    passwordVisibility = false;
  }

  @override
  void dispose() {
    confirmpasswordController?.dispose();
    emailController?.dispose();
    passwordController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          children: [
            Align(
              alignment: AlignmentDirectional(0, -1),
              child: Image.asset(
                'assets/images/mcatd_1.png',
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 180, 0, 0),
                      child: Container(
                        width: double.infinity,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset(
                                  'assets/images/9hsjc_2.png',
                                  width: 190,
                                  fit: BoxFit.cover,
                                ),
                                Form(
                                  key: formKey,
                                  autovalidateMode: AutovalidateMode.disabled,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            4, 0, 4, 15),
                                        child: Container(
                                          width: 300,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFE0E0E0),
                                            borderRadius:
                                                BorderRadius.circular(25),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20, 0, 20, 0),
                                            child: TextFormField(
                                              controller: emailController,
                                              onFieldSubmitted: (_) async {
                                                if (formKey.currentState ==
                                                        null ||
                                                    !formKey.currentState!
                                                        .validate()) {
                                                  return;
                                                }
                                              },
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                hintText: 'البريد الإلكتروني',
                                                hintStyle: GoogleFonts.getFont(
                                                  'Open Sans',
                                                  color: Color(0xFF565656),
                                                  fontWeight: FontWeight.normal,
                                                ),
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(4.0),
                                                    topRight:
                                                        Radius.circular(4.0),
                                                  ),
                                                ),
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(4.0),
                                                    topRight:
                                                        Radius.circular(4.0),
                                                  ),
                                                ),
                                                errorBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(4.0),
                                                    topRight:
                                                        Radius.circular(4.0),
                                                  ),
                                                ),
                                                focusedErrorBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(4.0),
                                                    topRight:
                                                        Radius.circular(4.0),
                                                  ),
                                                ),
                                              ),
                                              style: GoogleFonts.getFont(
                                                'Open Sans',
                                                color: Color(0xFF565656),
                                                fontWeight: FontWeight.normal,
                                              ),
                                              textAlign: TextAlign.end,
                                              validator: (val) {
                                                if (val == null ||
                                                    val.isEmpty) {
                                                  return 'الرجاء إدخال البريد الإلكتروني';
                                                }

                                                if (!RegExp(
                                                        kTextValidatorEmailRegex)
                                                    .hasMatch(val)) {
                                                  return 'الرجاء التأكد من صيغة البريد الإلكتروني';
                                                }
                                                return null;
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            4, 0, 4, 15),
                                        child: Container(
                                          width: 300,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFE0E0E0),
                                            borderRadius:
                                                BorderRadius.circular(25),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20, 0, 20, 0),
                                            child: TextFormField(
                                              controller: passwordController,
                                              onFieldSubmitted: (_) async {
                                                if (formKey.currentState ==
                                                        null ||
                                                    !formKey.currentState!
                                                        .validate()) {
                                                  return;
                                                }
                                              },
                                              obscureText: !passwordVisibility,
                                              decoration: InputDecoration(
                                                hintText: 'كلمة المرور',
                                                hintStyle: GoogleFonts.getFont(
                                                  'Open Sans',
                                                  color: Color(0xFF565656),
                                                  fontWeight: FontWeight.normal,
                                                ),
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(4.0),
                                                    topRight:
                                                        Radius.circular(4.0),
                                                  ),
                                                ),
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(4.0),
                                                    topRight:
                                                        Radius.circular(4.0),
                                                  ),
                                                ),
                                                errorBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(4.0),
                                                    topRight:
                                                        Radius.circular(4.0),
                                                  ),
                                                ),
                                                focusedErrorBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(4.0),
                                                    topRight:
                                                        Radius.circular(4.0),
                                                  ),
                                                ),
                                                suffixIcon: InkWell(
                                                  onTap: () => setState(
                                                    () => passwordVisibility =
                                                        !passwordVisibility,
                                                  ),
                                                  focusNode: FocusNode(
                                                      skipTraversal: true),
                                                  child: Icon(
                                                    passwordVisibility
                                                        ? Icons
                                                            .visibility_outlined
                                                        : Icons
                                                            .visibility_off_outlined,
                                                    color: Color(0xFF95A1AC),
                                                    size: 16,
                                                  ),
                                                ),
                                              ),
                                              style: GoogleFonts.getFont(
                                                'Open Sans',
                                                color: Color(0xFF565656),
                                                fontWeight: FontWeight.normal,
                                              ),
                                              textAlign: TextAlign.end,
                                              validator: (val) {
                                                if (val == null ||
                                                    val.isEmpty) {
                                                  return 'الرجاء إدخال كلمة المرور';
                                                }

                                                if (val.length < 8) {
                                                  return 'كلمة المرور يجب أن حتوي على ٨ حروف على الأقل';
                                                }

                                                if (!RegExp(
                                                        r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$")
                                                    .hasMatch(val)) {
                                                  return 'كلمة المرور يجب أن تحتوي على الأقل على: حرف كبير - حرف صغير - رقم - رمز';
                                                }
                                                return null;
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            4, 0, 4, 15),
                                        child: Container(
                                          width: 300,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFE0E0E0),
                                            borderRadius:
                                                BorderRadius.circular(25),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20, 0, 20, 0),
                                            child: TextFormField(
                                              controller:
                                                  confirmpasswordController,
                                              onFieldSubmitted: (_) async {
                                                if (formKey.currentState ==
                                                        null ||
                                                    !formKey.currentState!
                                                        .validate()) {
                                                  return;
                                                }
                                              },
                                              obscureText:
                                                  !confirmpasswordVisibility,
                                              decoration: InputDecoration(
                                                hintText: 'تأكيد كلمة المرور',
                                                hintStyle: GoogleFonts.getFont(
                                                  'Open Sans',
                                                  color: Color(0xFF565656),
                                                  fontWeight: FontWeight.normal,
                                                ),
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(4.0),
                                                    topRight:
                                                        Radius.circular(4.0),
                                                  ),
                                                ),
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(4.0),
                                                    topRight:
                                                        Radius.circular(4.0),
                                                  ),
                                                ),
                                                errorBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(4.0),
                                                    topRight:
                                                        Radius.circular(4.0),
                                                  ),
                                                ),
                                                focusedErrorBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(4.0),
                                                    topRight:
                                                        Radius.circular(4.0),
                                                  ),
                                                ),
                                                suffixIcon: InkWell(
                                                  onTap: () => setState(
                                                    () => confirmpasswordVisibility =
                                                        !confirmpasswordVisibility,
                                                  ),
                                                  focusNode: FocusNode(
                                                      skipTraversal: true),
                                                  child: Icon(
                                                    confirmpasswordVisibility
                                                        ? Icons
                                                            .visibility_outlined
                                                        : Icons
                                                            .visibility_off_outlined,
                                                    color: Color(0xFF95A1AC),
                                                    size: 16,
                                                  ),
                                                ),
                                              ),
                                              style: GoogleFonts.getFont(
                                                'Open Sans',
                                                color: Color(0xFF565656),
                                                fontWeight: FontWeight.normal,
                                              ),
                                              textAlign: TextAlign.end,
                                              validator: (val) {
                                                if (val == null ||
                                                    val.isEmpty) {
                                                  return 'الرجاء تأكيد كلمة المرور';
                                                }

                                                if (val.length < 8) {
                                                  return 'الرجاء تأكيد كلمة المرور';
                                                }

                                                return null;
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 20),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            if (formKey.currentState == null ||
                                                !formKey.currentState!
                                                    .validate()) {
                                              return;
                                            }

                                            if (passwordController!.text !=
                                                confirmpasswordController!
                                                    .text) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'كلمة المرور لا تتطابق',
                                                    style: GoogleFonts.getFont(
                                                      'Open Sans',
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      Color(0xE1FF2323),
                                                ),
                                              );
                                            }
                                            GoRouter.of(context)
                                                .prepareAuthEvent();
                                            if (passwordController?.text !=
                                                confirmpasswordController
                                                    ?.text) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Passwords don\'t match!',
                                                  ),
                                                ),
                                              );
                                              return;
                                            }

                                            final user =
                                                await createAccountWithEmail(
                                              context,
                                              emailController!.text,
                                              passwordController!.text,
                                            );
                                            if (user == null) {
                                              return;
                                            }

                                            context.goNamedAuth(
                                              'SettingUpProfile',
                                              mounted,
                                              extra: <String, dynamic>{
                                                kTransitionInfoKey:
                                                    TransitionInfo(
                                                  hasTransition: true,
                                                  transitionType:
                                                      PageTransitionType.fade,
                                                ),
                                              },
                                            );
                                          },
                                          text: 'إنشاء حساب',
                                          options: FFButtonOptions(
                                            width: 300,
                                            height: 50,
                                            color: Color(0xFFFF5757),
                                            textStyle: GoogleFonts.getFont(
                                              'Open Sans',
                                              color: Color(0xFFFFFAF1),
                                              fontSize: 16,
                                            ),
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(25),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          context.goNamed('LogIn');
                                        },
                                        child: Text(
                                          'تم إنشاء حساب مسبقاً؟ تسجيل  الدخول',
                                          style: GoogleFonts.getFont(
                                            'Open Sans',
                                            color: Color(0xFFA6A6A6),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
