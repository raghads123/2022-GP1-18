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

class Settinginterests2Widget extends StatefulWidget {
  const Settinginterests2Widget({Key? key}) : super(key: key);

  @override
  _Settinginterests2WidgetState createState() =>
      _Settinginterests2WidgetState();
}

class _Settinginterests2WidgetState extends State<Settinginterests2Widget>
    with TickerProviderStateMixin {
  Map<CategoryRecord, bool> checkboxListTileValueMap = {};
  List<CategoryRecord> get checkboxListTileCheckedItems =>
      checkboxListTileValueMap.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  final scaffoldKey = GlobalKey<ScaffoldState>();

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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<CategoryRecord>>(
      stream: queryCategoryRecord(),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.of(context).primaryColor,
              ),
            ),
          );
        }
        List<CategoryRecord> settinginterests2CategoryRecordList =
            snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.asset(
                                    'assets/images/9hsjc_2.png',
                                    width: 190,
                                    fit: BoxFit.cover,
                                  ).animateOnPageLoad(animationsMap[
                                      'imageOnPageLoadAnimation']!),
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
                                  )).animateOnPageLoad(animationsMap[
                                      'textOnPageLoadAnimation1']!),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 2),
                                    child: SelectionArea(
                                        child: Text(
                                      'حددي إهتماماتك',
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
                                      Stack(
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 10),
                                            child: Container(
                                              width: double.infinity,
                                              height: 200,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .grayIcon,
                                                ),
                                              ),
                                              child: Builder(
                                                builder: (context) {
                                                  final categories =
                                                      settinginterests2CategoryRecordList
                                                          .toList();
                                                  return ListView.builder(
                                                    padding: EdgeInsets.zero,
                                                    primary: false,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount:
                                                        categories.length,
                                                    itemBuilder: (context,
                                                        categoriesIndex) {
                                                      final categoriesItem =
                                                          categories[
                                                              categoriesIndex];
                                                      return Container(
                                                        width: 100,
                                                        height: 90,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                        ),
                                                        child: Theme(
                                                          data: ThemeData(
                                                            unselectedWidgetColor:
                                                                Color(
                                                                    0xFF95A1AC),
                                                          ),
                                                          child:
                                                              CheckboxListTile(
                                                            value: checkboxListTileValueMap[
                                                                    categoriesItem] ??=
                                                                false,
                                                            onChanged:
                                                                (newValue) async {
                                                              setState(() =>
                                                                  checkboxListTileValueMap[
                                                                          categoriesItem] =
                                                                      newValue!);
                                                              if (newValue!) {
                                                                final usersUpdateData =
                                                                    {
                                                                  'intrests':
                                                                      FieldValue
                                                                          .arrayUnion([
                                                                    checkboxListTileCheckedItems
                                                                        .toString()
                                                                  ]),
                                                                };
                                                                await currentUserReference!
                                                                    .update(
                                                                        usersUpdateData);
                                                              } else {
                                                                final usersUpdateData =
                                                                    {
                                                                  'intrests':
                                                                      FieldValue
                                                                          .arrayRemove([
                                                                    checkboxListTileCheckedItems
                                                                        .toString()
                                                                  ]),
                                                                };
                                                                await currentUserReference!
                                                                    .update(
                                                                        usersUpdateData);
                                                              }
                                                            },
                                                            title: Text(
                                                              categoriesItem
                                                                  .name!,
                                                              textAlign:
                                                                  TextAlign.end,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .title3
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: Color(
                                                                        0xFF494646),
                                                                  ),
                                                            ),
                                                            tileColor: Color(
                                                                0xFFF5F5F5),
                                                            checkColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                            dense: false,
                                                            controlAffinity:
                                                                ListTileControlAffinity
                                                                    .trailing,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 20),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            context.goNamed(
                                              'HomePage',
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
                                          text: 'إنهاء',
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
                                    ],
                                  ).animateOnPageLoad(animationsMap[
                                      'columnOnPageLoadAnimation']!),
                                ],
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
      },
    );
  }
}
