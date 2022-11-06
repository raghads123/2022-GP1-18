import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LogInWidget extends StatefulWidget {
  const LogInWidget({Key? key}) : super(key: key);

  @override
  _LogInWidgetState createState() => _LogInWidgetState();
}

class _LogInWidgetState extends State<LogInWidget> {
  TextEditingController? emailController;
  TextEditingController? passwordController;

  late bool passwordVisibility;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    passwordVisibility = false;
  }

  @override
  void dispose() {
    emailController?.dispose();
    passwordController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: Stack(
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
          Column(
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
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                              child: Image.asset(
                                'assets/images/9hsjc_2.png',
                                width: 190,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20, 0, 20, 15),
                                  child: Container(
                                    width: 300,
                                    child: TextFormField(
                                      controller: emailController,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'البريد الإلكتروني',
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
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(25),
                                        ),
                                        focusedBorder: OutlineInputBorder(
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
                                        focusedErrorBorder: OutlineInputBorder(
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
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20, 0, 20, 15),
                                  child: Container(
                                    width: 300,
                                    child: TextFormField(
                                      controller: passwordController,
                                      obscureText: !passwordVisibility,
                                      decoration: InputDecoration(
                                        labelText: 'كلمة المرور',
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
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(25),
                                        ),
                                        focusedBorder: OutlineInputBorder(
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
                                        focusedErrorBorder: OutlineInputBorder(
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
                                          focusNode:
                                              FocusNode(skipTraversal: true),
                                          child: Icon(
                                            passwordVisibility
                                                ? Icons.visibility_outlined
                                                : Icons.visibility_off_outlined,
                                            color: FlutterFlowTheme.of(context)
                                                .grayIcon,
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
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 20),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      GoRouter.of(context).prepareAuthEvent();

                                      final user = await signInWithEmail(
                                        context,
                                        emailController!.text,
                                        passwordController!.text,
                                      );
                                      if (user == null) {
                                        return;
                                      }

                                      setState(() => FFAppState().userSigned =
                                          currentUserEmail);

                                      context.pushNamedAuth(
                                          'HomePage', mounted);
                                    },
                                    text: 'تسجيل الدخول',
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
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () async {
                                    if (emailController!.text.isEmpty) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Email required!',
                                          ),
                                        ),
                                      );
                                      return;
                                    }
                                    await resetPassword(
                                      email: emailController!.text,
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
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 4, 0),
                                      child: InkWell(
                                        onTap: () async {
                                          context.pushNamed('SignUp');
                                        },
                                        child: SelectionArea(
                                            child: Text(
                                          'إنشاء حساب جديد',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Poppins',
                                                color: Color(0xFF494646),
                                              ),
                                        )),
                                      ),
                                    ),
                                    SelectionArea(
                                        child: Text(
                                      'لم يسبق لك إنشاء حساب ؟',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: Color(0xFF494646),
                                            fontWeight: FontWeight.normal,
                                          ),
                                    )),
                                  ],
                                ),
                              ],
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
        ],
      ),
    );
  }
}
