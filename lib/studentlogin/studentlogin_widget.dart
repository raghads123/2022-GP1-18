import '/auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'studentlogin_model.dart';
export 'studentlogin_model.dart';

class StudentloginWidget extends StatefulWidget {
  const StudentloginWidget({Key? key}) : super(key: key);

  @override
  _StudentloginWidgetState createState() => _StudentloginWidgetState();
}

class _StudentloginWidgetState extends State<StudentloginWidget> {
  late StudentloginModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StudentloginModel());

    _model.emailController ??= TextEditingController();
    _model.passwordController ??= TextEditingController();
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Align(
              alignment: AlignmentDirectional(0.0, -1.0),
              child: Image.asset(
                'assets/images/40vyp_1.JPG',
                width: double.infinity,
                height: 250.0,
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 180.0, 0.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        height: 100.0,
                        decoration: BoxDecoration(
                          color: Color(0xFFF4F3F0),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(0.0),
                            topLeft: Radius.circular(30.0),
                            topRight: Radius.circular(30.0),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 25.0, 0.0, 0.0),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset(
                                  'assets/images/2logo.JPG',
                                  width: 190.0,
                                  fit: BoxFit.cover,
                                ),
                                Container(
                                  width: 350.0,
                                  child: Form(
                                    key: _model.formKey,
                                    autovalidateMode: AutovalidateMode.always,
                                    child: Container(
                                      width: 350.0,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.5,
                                      decoration: BoxDecoration(
                                        color: Color(0x6CE1D7C6),
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 0.0, 20.0, 15.0),
                                            child: Container(
                                              width: 300.0,
                                              child: TextFormField(
                                                controller:
                                                    _model.emailController,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelText: 'البريد الجامعي ',
                                                  labelStyle:
                                                      GoogleFonts.getFont(
                                                    'Open Sans',
                                                    color: Color(0xFF565656),
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                  hintText:
                                                      'ID@student.ksu.edu.sa',
                                                  hintStyle:
                                                      GoogleFonts.getFont(
                                                    'Open Sans',
                                                    color: Color(0xFF565656),
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0xFF7EAEBD),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0xFF7EAEBD),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25.0),
                                                  ),
                                                  filled: true,
                                                  fillColor: Color(0xFFE1D7C6),
                                                ),
                                                style: GoogleFonts.getFont(
                                                  'Open Sans',
                                                  color: Color(0xFF7EAEBD),
                                                  fontWeight: FontWeight.normal,
                                                ),
                                                textAlign: TextAlign.start,
                                                validator: _model
                                                    .emailControllerValidator
                                                    .asValidator(context),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 15.0, 20.0, 15.0),
                                            child: Container(
                                              width: 300.0,
                                              child: TextFormField(
                                                controller:
                                                    _model.passwordController,
                                                obscureText:
                                                    !_model.passwordVisibility,
                                                decoration: InputDecoration(
                                                  labelText: 'كلمة المرور ',
                                                  labelStyle:
                                                      GoogleFonts.getFont(
                                                    'Open Sans',
                                                    color: Color(0xFF565656),
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                  hintText: 'ادخلي كلمة المرور',
                                                  hintStyle:
                                                      GoogleFonts.getFont(
                                                    'Open Sans',
                                                    color: Color(0xFF565656),
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0xE1FF2323),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0xE1FF2323),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25.0),
                                                  ),
                                                  filled: true,
                                                  fillColor: Color(0xFFE1D7C6),
                                                  suffixIcon: InkWell(
                                                    onTap: () => setState(
                                                      () => _model
                                                              .passwordVisibility =
                                                          !_model
                                                              .passwordVisibility,
                                                    ),
                                                    focusNode: FocusNode(
                                                        skipTraversal: true),
                                                    child: Icon(
                                                      _model.passwordVisibility
                                                          ? Icons
                                                              .visibility_outlined
                                                          : Icons
                                                              .visibility_off_outlined,
                                                      color: Color(0xFF95A1AC),
                                                      size: 16.0,
                                                    ),
                                                  ),
                                                ),
                                                style: GoogleFonts.getFont(
                                                  'Open Sans',
                                                  color: Color(0xFF579BB1),
                                                  fontWeight: FontWeight.normal,
                                                ),
                                                textAlign: TextAlign.start,
                                                validator: _model
                                                    .passwordControllerValidator
                                                    .asValidator(context),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 15.0, 20.0, 0.0),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                GoRouter.of(context)
                                                    .prepareAuthEvent();

                                                final user =
                                                    await signInWithEmail(
                                                  context,
                                                  _model.emailController.text,
                                                  _model
                                                      .passwordController.text,
                                                );
                                                if (user == null) {
                                                  return;
                                                }

                                                context.goNamedAuth(
                                                    'HomePage', mounted);
                                              },
                                              text: 'تسجيل دخول',
                                              options: FFButtonOptions(
                                                width: 300.0,
                                                height: 50.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color: Color(0xFF7EAEBD),
                                                textStyle: GoogleFonts.getFont(
                                                  'Open Sans',
                                                  color: Color(0xFFFFFAF1),
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 18.0,
                                                ),
                                                elevation: 2.0,
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 0.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(25.0),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 15.0, 0.0, 5.0),
                                            child: InkWell(
                                              onTap: () async {
                                                if (_model.emailController.text
                                                    .isEmpty) {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'يجب إدخال البريد الإلكتروني',
                                                      ),
                                                    ),
                                                  );
                                                  return;
                                                }
                                                await resetPassword(
                                                  email: _model
                                                      .emailController.text,
                                                  context: context,
                                                );
                                              },
                                              child: Text(
                                                'استرجاع كلمة المرور؟',
                                                style: GoogleFonts.getFont(
                                                  'Open Sans',
                                                  color: Color(0xFF494646),
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 15.0, 0.0, 0.0),
                                            child: InkWell(
                                              onTap: () async {
                                                context.pushNamed(
                                                  'SignUp',
                                                  extra: <String, dynamic>{
                                                    kTransitionInfoKey:
                                                        TransitionInfo(
                                                      hasTransition: true,
                                                      transitionType:
                                                          PageTransitionType
                                                              .fade,
                                                      duration: Duration(
                                                          milliseconds: 0),
                                                    ),
                                                  },
                                                );
                                              },
                                              child: Text(
                                                'لم يسبق لك إنشاء حساب؟ إنشاء حساب جديد',
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
                  context.goNamed(
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
                  elevation: 3.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
                    child: Icon(
                      Icons.arrow_back_rounded,
                      color: Color(0xFF7EAEBD),
                      size: 24.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
