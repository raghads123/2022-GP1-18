import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ActivityAdminSignupWidget extends StatefulWidget {
  const ActivityAdminSignupWidget({Key? key}) : super(key: key);

  @override
  _ActivityAdminSignupWidgetState createState() =>
      _ActivityAdminSignupWidgetState();
}

class _ActivityAdminSignupWidgetState extends State<ActivityAdminSignupWidget> {
  TextEditingController? confirmpasswordController;
  late bool confirmpasswordVisibility;
  TextEditingController? emailController;
  TextEditingController? passwordController;
  late bool passwordVisibility;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

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
    _unfocusNode.dispose();
    confirmpasswordController?.dispose();
    emailController?.dispose();
    passwordController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
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
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                            child: SingleChildScrollView(
                              primary: false,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20, 0, 20, 14),
                                          child: Container(
                                            width: 300,
                                            child: TextFormField(
                                              controller: emailController,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelText: 'البريد الإلكتروني ',
                                                labelStyle: GoogleFonts.getFont(
                                                  'Open Sans',
                                                  color: Color(0xFF565656),
                                                  fontWeight: FontWeight.normal,
                                                ),
                                                hintText: 'example@email.com',
                                                hintStyle: GoogleFonts.getFont(
                                                  'Open Sans',
                                                  color: Color(0xFF565656),
                                                  fontWeight: FontWeight.normal,
                                                ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(25),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(25),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0xE1FF2323),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(25),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0xE1FF2323),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(25),
                                                ),
                                                filled: true,
                                                fillColor: Color(0xFFE0E0E0),
                                              ),
                                              style: GoogleFonts.getFont(
                                                'Open Sans',
                                                color: Color(0xFF565656),
                                                fontWeight: FontWeight.normal,
                                              ),
                                              textAlign: TextAlign.start,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20, 0, 20, 14),
                                          child: Container(
                                            width: 300,
                                            child: TextFormField(
                                              controller: passwordController,
                                              obscureText: !passwordVisibility,
                                              decoration: InputDecoration(
                                                labelText: 'كلمة المرور ',
                                                labelStyle: GoogleFonts.getFont(
                                                  'Open Sans',
                                                  color: Color(0xFF565656),
                                                  fontWeight: FontWeight.normal,
                                                ),
                                                hintText: 'ادخلي كلمة المرور',
                                                hintStyle: GoogleFonts.getFont(
                                                  'Open Sans',
                                                  color: Color(0xFF565656),
                                                  fontWeight: FontWeight.normal,
                                                ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(25),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(25),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0xE1FF2323),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(25),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0xE1FF2323),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(25),
                                                ),
                                                filled: true,
                                                fillColor: Color(0xFFE0E0E0),
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
                                              textAlign: TextAlign.start,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20, 0, 20, 1),
                                          child: Container(
                                            width: 300,
                                            child: TextFormField(
                                              controller:
                                                  confirmpasswordController,
                                              obscureText:
                                                  !confirmpasswordVisibility,
                                              decoration: InputDecoration(
                                                labelText: 'تأكيد كلمة المرور',
                                                labelStyle: GoogleFonts.getFont(
                                                  'Open Sans',
                                                  color: Color(0xFF565656),
                                                  fontWeight: FontWeight.normal,
                                                ),
                                                hintText: 'ادخلي كلمة المرور',
                                                hintStyle: GoogleFonts.getFont(
                                                  'Open Sans',
                                                  color: Color(0xFF565656),
                                                  fontWeight: FontWeight.normal,
                                                ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(25),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(25),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0xE1FF2323),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(25),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0xE1FF2323),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(25),
                                                ),
                                                filled: true,
                                                fillColor: Color(0xFFE0E0E0),
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
                                              textAlign: TextAlign.start,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 13, 0, 2),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              GoRouter.of(context)
                                                  .prepareAuthEvent();
                                              if (passwordController?.text !=
                                                  confirmpasswordController
                                                      ?.text) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'كلمة المرور لا تتطابق',
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

                                              final usersCreateData =
                                                  createUsersRecordData(
                                                type: 'student',
                                              );
                                              await UsersRecord.collection
                                                  .doc(user.uid)
                                                  .update(usersCreateData);

                                              final usersUpdateData =
                                                  createUsersRecordData(
                                                type: 'admin',
                                              );
                                              await currentUserReference!
                                                  .update(usersUpdateData);

                                              context.goNamedAuth(
                                                  'HomePage', mounted);
                                            },
                                            text: 'إنشاء حساب',
                                            options: FFButtonOptions(
                                              width: 300,
                                              height: 50,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              textStyle: GoogleFonts.getFont(
                                                'Open Sans',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBtnText,
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
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 5, 0, 0),
                                          child: InkWell(
                                            onTap: () async {
                                              if (Navigator.of(context)
                                                  .canPop()) {
                                                context.pop();
                                              }
                                              context.pushNamed(
                                                'ActivityAdminLogin',
                                                extra: <String, dynamic>{
                                                  kTransitionInfoKey:
                                                      TransitionInfo(
                                                    hasTransition: true,
                                                    transitionType:
                                                        PageTransitionType.fade,
                                                    duration: Duration(
                                                        milliseconds: 0),
                                                  ),
                                                },
                                              );
                                            },
                                            child: Text(
                                              'تم إنشاء حساب مسبقاً؟ تسجيل  الدخول',
                                              style: GoogleFonts.getFont(
                                                'Open Sans',
                                                color: Color(0xFF494646),
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
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-0.9, -0.95),
                child: InkWell(
                  onTap: () async {
                    if (Navigator.of(context).canPop()) {
                      context.pop();
                    }
                    context.pushNamed(
                      'FirstPage',
                      extra: <String, dynamic>{
                        kTransitionInfoKey: TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.rightToLeft,
                        ),
                      },
                    );
                  },
                  child: Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                      child: Icon(
                        Icons.arrow_back_rounded,
                        color: Color(0xFFFF5757),
                        size: 24,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
