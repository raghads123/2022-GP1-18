import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SettingUpProfileCopyWidget extends StatefulWidget {
  const SettingUpProfileCopyWidget({Key? key}) : super(key: key);

  @override
  _SettingUpProfileCopyWidgetState createState() =>
      _SettingUpProfileCopyWidgetState();
}

class _SettingUpProfileCopyWidgetState extends State<SettingUpProfileCopyWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'imageOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 400.ms,
          duration: 600.ms,
          begin: Offset(0, 0),
          end: Offset(0, -82),
        ),
      ],
    ),
    'textOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeIn,
          delay: 400.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 1200.ms,
          duration: 600.ms,
          begin: Offset(0, 0),
          end: Offset(0, -82),
        ),
      ],
    ),
    'textOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeIn,
          delay: 400.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 1300.ms,
          duration: 600.ms,
          begin: Offset(0, 0),
          end: Offset(0, -82),
        ),
      ],
    ),
    'columnOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeIn,
          delay: 400.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 1400.ms,
          duration: 600.ms,
          begin: Offset(0, 0),
          end: Offset(0, -82),
        ),
      ],
    ),
  };
  TextEditingController? nameController;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    nameController = TextEditingController();
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    nameController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF4F3F0),
      body: GestureDetector(
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
                                ).animateOnPageLoad(
                                    animationsMap['imageOnPageLoadAnimation']!),
                                SelectionArea(
                                    child: Text(
                                  '!اهلًا ِبك',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF0184BD),
                                        fontSize: 24,
                                      ),
                                )).animateOnPageLoad(
                                    animationsMap['textOnPageLoadAnimation1']!),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20, 0, 20, 10),
                                  child: SelectionArea(
                                      child: Text(
                                    'الرجاء إدخال اسم الجهة المسؤولة عن الأنشطة',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: Color(0xFF0184BD),
                                          fontSize: 20,
                                        ),
                                  )).animateOnPageLoad(animationsMap[
                                      'textOnPageLoadAnimation2']!),
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
                                          controller: nameController,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            hintText: 'الأسم',
                                            hintStyle: GoogleFonts.getFont(
                                              'Open Sans',
                                              color: Color(0xFF565656),
                                            ),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                            ),
                                            errorBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                            ),
                                            focusedErrorBorder:
                                                UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
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
                                          ),
                                          textAlign: TextAlign.start,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 20),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          final usersUpdateData =
                                              createUsersRecordData(
                                            displayName: nameController!.text,
                                          );
                                          await currentUserReference!
                                              .update(usersUpdateData);

                                          context.goNamed(
                                            'Settinginterests2',
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
                                        text: 'التالي',
                                        options: FFButtonOptions(
                                          width: 300,
                                          height: 50,
                                          color: Color(0xFFFF5757),
                                          textStyle: GoogleFonts.getFont(
                                            'Open Sans',
                                            color: Colors.white,
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
                                  ],
                                ).animateOnPageLoad(animationsMap[
                                    'columnOnPageLoadAnimation']!),
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
