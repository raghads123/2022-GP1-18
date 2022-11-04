import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class OpportunityApplyFormWidget extends StatefulWidget {
  const OpportunityApplyFormWidget({Key? key}) : super(key: key);

  @override
  _OpportunityApplyFormWidgetState createState() =>
      _OpportunityApplyFormWidgetState();
}

class _OpportunityApplyFormWidgetState extends State<OpportunityApplyFormWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
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
  String? skillValue;
  TextEditingController? opemailController;
  TextEditingController? textController2;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    opemailController = TextEditingController(text: currentUserEmail);
    textController2 = TextEditingController();
  }

  @override
  void dispose() {
    opemailController?.dispose();
    textController2?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          children: [
            Align(
              alignment: AlignmentDirectional(0, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      width: double.infinity,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                        child: StreamBuilder<List<OpportunitiesRecord>>(
                          stream: queryOpportunitiesRecord(
                            singleRecord: true,
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: CircularProgressIndicator(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                  ),
                                ),
                              );
                            }
                            List<OpportunitiesRecord>
                                formOpportunitiesRecordList = snapshot.data!;
                            // Return an empty Container when the document does not exist.
                            if (snapshot.data!.isEmpty) {
                              return Container();
                            }
                            final formOpportunitiesRecord =
                                formOpportunitiesRecordList.isNotEmpty
                                    ? formOpportunitiesRecordList.first
                                    : null;
                            return Container(
                              width: double.infinity,
                              child: Form(
                                key: formKey,
                                autovalidateMode: AutovalidateMode.disabled,
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 25, 0, 0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 140, 0, 0),
                                          child: SelectionArea(
                                              child: Text(
                                            formOpportunitiesRecord!.oppName!,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: Color(0xFF0184BD),
                                                  fontSize: 24,
                                                ),
                                          )).animateOnPageLoad(animationsMap[
                                              'textOnPageLoadAnimation1']!),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 10, 0, 10),
                                          child: SelectionArea(
                                              child: Text(
                                            formOpportunitiesRecord!.opDesc!,
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
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(4, 0, 4, 15),
                                              child: Container(
                                                width: 300,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFE0E0E0),
                                                  borderRadius:
                                                      BorderRadius.circular(25),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(20, 0, 20, 0),
                                                  child: TextFormField(
                                                    controller:
                                                        opemailController,
                                                    autofocus: true,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      hintText:
                                                          'البريد الإلكتروني:',
                                                      hintStyle:
                                                          GoogleFonts.getFont(
                                                        'Open Sans',
                                                        color:
                                                            Color(0xFF565656),
                                                      ),
                                                      enabledBorder:
                                                          UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1,
                                                        ),
                                                        borderRadius:
                                                            const BorderRadius
                                                                .only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  4.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  4.0),
                                                        ),
                                                      ),
                                                      focusedBorder:
                                                          UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1,
                                                        ),
                                                        borderRadius:
                                                            const BorderRadius
                                                                .only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  4.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  4.0),
                                                        ),
                                                      ),
                                                      errorBorder:
                                                          UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1,
                                                        ),
                                                        borderRadius:
                                                            const BorderRadius
                                                                .only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  4.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  4.0),
                                                        ),
                                                      ),
                                                      focusedErrorBorder:
                                                          UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1,
                                                        ),
                                                        borderRadius:
                                                            const BorderRadius
                                                                .only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  4.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  4.0),
                                                        ),
                                                      ),
                                                    ),
                                                    style: GoogleFonts.getFont(
                                                      'Open Sans',
                                                      color: Color(0xFF565656),
                                                    ),
                                                    textAlign: TextAlign.end,
                                                    keyboardType: TextInputType
                                                        .emailAddress,
                                                    validator: (val) {
                                                      if (val == null ||
                                                          val.isEmpty) {
                                                        return 'Field is required';
                                                      }

                                                      if (!RegExp(
                                                              kTextValidatorEmailRegex)
                                                          .hasMatch(val)) {
                                                        return 'Has to be a valid email address.';
                                                      }
                                                      return null;
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(4, 0, 4, 15),
                                              child: Container(
                                                width: 300,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFE0E0E0),
                                                  borderRadius:
                                                      BorderRadius.circular(25),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(20, 0, 20, 0),
                                                  child: TextFormField(
                                                    controller: textController2,
                                                    autofocus: true,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      hintText: ': نبذة عنك',
                                                      hintStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText2,
                                                      enabledBorder:
                                                          UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1,
                                                        ),
                                                        borderRadius:
                                                            const BorderRadius
                                                                .only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  4.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  4.0),
                                                        ),
                                                      ),
                                                      focusedBorder:
                                                          UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1,
                                                        ),
                                                        borderRadius:
                                                            const BorderRadius
                                                                .only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  4.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  4.0),
                                                        ),
                                                      ),
                                                      errorBorder:
                                                          UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1,
                                                        ),
                                                        borderRadius:
                                                            const BorderRadius
                                                                .only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  4.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  4.0),
                                                        ),
                                                      ),
                                                      focusedErrorBorder:
                                                          UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1,
                                                        ),
                                                        borderRadius:
                                                            const BorderRadius
                                                                .only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  4.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  4.0),
                                                        ),
                                                      ),
                                                    ),
                                                    style: GoogleFonts.getFont(
                                                      'Open Sans',
                                                      color: Color(0xFF565656),
                                                    ),
                                                    textAlign: TextAlign.end,
                                                    maxLines: null,
                                                    validator: (val) {
                                                      if (val == null ||
                                                          val.isEmpty) {
                                                        return 'Field is required';
                                                      }

                                                      if (val.length > 280) {
                                                        return 'تستطيعين كتابة ٢٨٠ حرف فقط';
                                                      }

                                                      return null;
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(4, 0, 4, 15),
                                              child: Container(
                                                width: 300,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFE0E0E0),
                                                  borderRadius:
                                                      BorderRadius.circular(25),
                                                ),
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0, 0),
                                                  child: FlutterFlowDropDown(
                                                    options:
                                                        formOpportunitiesRecord!
                                                            .opSkills!
                                                            .toList()
                                                            .toList(),
                                                    onChanged: (val) =>
                                                        setState(() =>
                                                            skillValue = val),
                                                    width: 300,
                                                    height: 50,
                                                    textStyle:
                                                        GoogleFonts.getFont(
                                                      'Open Sans',
                                                      color: Color(0xFF565656),
                                                    ),
                                                    hintText:
                                                        'حددي مهاراتك______________________',
                                                    fillColor:
                                                        Color(0xFFE0E0E0),
                                                    elevation: 2,
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderWidth: 0,
                                                    borderRadius: 0,
                                                    margin:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                12, 4, 12, 4),
                                                    hidesUnderline: true,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ).animateOnPageLoad(animationsMap[
                                            'columnOnPageLoadAnimation']!),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 10, 0, 40),
                                          child: StreamBuilder<
                                              List<OpportunitiesRecord>>(
                                            stream: queryOpportunitiesRecord(
                                              singleRecord: true,
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50,
                                                    height: 50,
                                                    child:
                                                        CircularProgressIndicator(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryColor,
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<OpportunitiesRecord>
                                                  buttonOpportunitiesRecordList =
                                                  snapshot.data!;
                                              final buttonOpportunitiesRecord =
                                                  buttonOpportunitiesRecordList
                                                          .isNotEmpty
                                                      ? buttonOpportunitiesRecordList
                                                          .first
                                                      : null;
                                              return FFButtonWidget(
                                                onPressed: () async {
                                                  if (buttonOpportunitiesRecord!
                                                      .appliedBy!
                                                      .toList()
                                                      .contains(
                                                          currentUserEmail)) {
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          title: Text(
                                                              '.لقد تم تقديمه على هذه الفرصة مسبقاً'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext),
                                                              child: Text('تم'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                  } else {
                                                    final opportunitiesUpdateData =
                                                        {
                                                      'applied_by': FieldValue
                                                          .arrayUnion([
                                                        currentUserEmail
                                                      ]),
                                                    };
                                                    await buttonOpportunitiesRecord!
                                                        .reference
                                                        .update(
                                                            opportunitiesUpdateData);
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          title: Text(
                                                              'لقد تم تقديمك على هذه الفرصة بنجاح.'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext),
                                                              child: Text('تم'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                  }
                                                },
                                                text: 'تقديم',
                                                options: FFButtonOptions(
                                                  width: 270,
                                                  height: 50,
                                                  color: Color(0xE15BD85B),
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .subtitle1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.white,
                                                      ),
                                                  elevation: 2,
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1,
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: AlignmentDirectional(1, -1),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 40, 16, 16),
                child: InkWell(
                  onTap: () async {
                    if (Navigator.of(context).canPop()) {
                      context.pop();
                    }
                    context.pushNamed(
                      'Opportunities',
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
                        Icons.arrow_forward_rounded,
                        color: Color(0xFFFF5757),
                        size: 24,
                      ),
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