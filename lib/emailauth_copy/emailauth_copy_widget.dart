import '/auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'emailauth_copy_model.dart';
export 'emailauth_copy_model.dart';

class EmailauthCopyWidget extends StatefulWidget {
  const EmailauthCopyWidget({Key? key}) : super(key: key);

  @override
  _EmailauthCopyWidgetState createState() => _EmailauthCopyWidgetState();
}

class _EmailauthCopyWidgetState extends State<EmailauthCopyWidget> {
  late EmailauthCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmailauthCopyModel());
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

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
        child: Stack(
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
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 25.0, 0.0, 0.0),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset(
                                  'assets/images/2logo.JPG',
                                  width: 190.0,
                                  fit: BoxFit.cover,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 40.0, 0.0, 0.0),
                                  child: SelectionArea(
                                      child: Text(
                                    'اهلاً بك',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: Color(0xFF0184BD),
                                          fontSize: 24.0,
                                        ),
                                  )),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 10.0),
                                  child: SelectionArea(
                                      child: Text(
                                    'تم ارسال رابط توثيق على البريد الإلكتروني',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: Color(0xFF0184BD),
                                          fontSize: 20.0,
                                        ),
                                  )),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 10.0),
                                  child: SelectionArea(
                                      child: Text(
                                    'الرجاء توثيق البريد للتمتع بالتطبيق',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: Color(0xFF0184BD),
                                          fontSize: 20.0,
                                        ),
                                  )),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 20.0, 20.0, 20.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      if (currentUserEmailVerified) {
                                        context.goNamed('SettingUpProfileCopy');
                                      }
                                    },
                                    text: 'تم التوثيق',
                                    options: FFButtonOptions(
                                      width: 300.0,
                                      height: 50.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: Color(0xFFFFFAF1),
                                      textStyle: GoogleFonts.getFont(
                                        'Open Sans',
                                        color: Color(0xFF7EAEBD),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20.0,
                                      ),
                                      elevation: 2.0,
                                      borderSide: BorderSide(
                                        color: Color(0xFF7EAEBD),
                                      ),
                                      borderRadius: BorderRadius.circular(25.0),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 20.0, 20.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      await sendEmailVerification();
                                    },
                                    text: 'إعادة إرسال البريد',
                                    options: FFButtonOptions(
                                      width: 300.0,
                                      height: 50.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: Color(0xFF7EAEBD),
                                      textStyle: GoogleFonts.getFont(
                                        'Open Sans',
                                        color: Color(0xFFFFFAF1),
                                        fontSize: 20.0,
                                      ),
                                      elevation: 2.0,
                                      borderRadius: BorderRadius.circular(25.0),
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
          ],
        ),
      ),
    );
  }
}
