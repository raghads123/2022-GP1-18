import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OpportunityApplyFormWidget extends StatefulWidget {
  const OpportunityApplyFormWidget({
    Key? key,
    this.opportunityID,
  }) : super(key: key);

  final String? opportunityID;

  @override
  _OpportunityApplyFormWidgetState createState() =>
      _OpportunityApplyFormWidgetState();
}

class _OpportunityApplyFormWidgetState
    extends State<OpportunityApplyFormWidget> {
  String? skillValue;
  TextEditingController? aboutmeController;
  TextEditingController? opemailController;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    aboutmeController = TextEditingController();
    opemailController = TextEditingController(text: currentUserEmail);
  }

  @override
  void dispose() {
    aboutmeController?.dispose();
    opemailController?.dispose();
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
                      child: StreamBuilder<List<OpportunitiesRecord>>(
                        stream: queryOpportunitiesRecord(
                          queryBuilder: (opportunitiesRecord) =>
                              opportunitiesRecord.where('oppName',
                                  isEqualTo: widget.opportunityID),
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
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
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
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 100, 0, 0),
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
                                        )),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
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
                                        )),
                                      ),
                                      if (formOpportunitiesRecord!.appliedBy!
                                          .toList()
                                          .contains(currentUserEmail))
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            if (!formOpportunitiesRecord!
                                                .appliedBy!
                                                .toList()
                                                .contains(currentUserEmail))
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(4, 0, 4, 15),
                                                child: Container(
                                                  width: 300,
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFE0E0E0),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                20, 0, 20, 0),
                                                    child: TextFormField(
                                                      controller:
                                                          opemailController,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
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
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
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
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
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
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
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
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
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
                                                      style:
                                                          GoogleFonts.getFont(
                                                        'Open Sans',
                                                        color:
                                                            Color(0xFF565656),
                                                      ),
                                                      textAlign: TextAlign.end,
                                                      keyboardType:
                                                          TextInputType
                                                              .emailAddress,
                                                      validator: (val) {
                                                        if (val == null ||
                                                            val.isEmpty) {
                                                          return 'الحقل مطلوب';
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
                                                height: 300,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFE0E0E0),
                                                  borderRadius:
                                                      BorderRadius.circular(25),
                                                ),
                                                child: Visibility(
                                                  visible:
                                                      !formOpportunitiesRecord!
                                                          .appliedBy!
                                                          .toList()
                                                          .contains(
                                                              currentUserEmail),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(20,
                                                                      0, 20, 0),
                                                          child: TextFormField(
                                                            controller:
                                                                aboutmeController,
                                                            onFieldSubmitted:
                                                                (_) async {
                                                              if (formKey.currentState ==
                                                                      null ||
                                                                  !formKey
                                                                      .currentState!
                                                                      .validate()) {
                                                                return;
                                                              }
                                                            },
                                                            obscureText: false,
                                                            decoration:
                                                                InputDecoration(
                                                              hintText:
                                                                  'نبذة عنك:',
                                                              hintStyle:
                                                                  GoogleFonts
                                                                      .getFont(
                                                                'Open Sans',
                                                                color: Color(
                                                                    0xFF565656),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                              enabledBorder:
                                                                  UnderlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Color(
                                                                      0x00000000),
                                                                  width: 1,
                                                                ),
                                                                borderRadius:
                                                                    const BorderRadius
                                                                        .only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          4.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          4.0),
                                                                ),
                                                              ),
                                                              focusedBorder:
                                                                  UnderlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Color(
                                                                      0x00000000),
                                                                  width: 1,
                                                                ),
                                                                borderRadius:
                                                                    const BorderRadius
                                                                        .only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          4.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          4.0),
                                                                ),
                                                              ),
                                                              errorBorder:
                                                                  UnderlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Color(
                                                                      0x00000000),
                                                                  width: 1,
                                                                ),
                                                                borderRadius:
                                                                    const BorderRadius
                                                                        .only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          4.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          4.0),
                                                                ),
                                                              ),
                                                              focusedErrorBorder:
                                                                  UnderlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Color(
                                                                      0x00000000),
                                                                  width: 1,
                                                                ),
                                                                borderRadius:
                                                                    const BorderRadius
                                                                        .only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          4.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          4.0),
                                                                ),
                                                              ),
                                                            ),
                                                            style: GoogleFonts
                                                                .getFont(
                                                              'Open Sans',
                                                              color: Color(
                                                                  0xFF565656),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                            ),
                                                            textAlign:
                                                                TextAlign.end,
                                                            maxLines: 50,
                                                            validator: (val) {
                                                              if (val == null ||
                                                                  val.isEmpty) {
                                                                return 'الحقل مطلوب';
                                                              }

                                                              if (val.length >
                                                                  280) {
                                                                return 'النبذة يجب أن تكون ٢٨٠ حرف فقط';
                                                              }

                                                              return null;
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            if (formOpportunitiesRecord!
                                                .appliedBy!
                                                .toList()
                                                .contains(currentUserEmail))
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(4, 0, 4, 15),
                                                child: Container(
                                                  width: 300,
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFE0E0E0),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25),
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
                                                        color:
                                                            Color(0xFF565656),
                                                      ),
                                                      hintText:
                                                          'حددي مهارتك______________________',
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
                                        ),
                                      if (!formOpportunitiesRecord!.appliedBy!
                                          .toList()
                                          .contains(currentUserEmail))
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 10, 0, 40),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              if (formKey.currentState ==
                                                      null ||
                                                  !formKey.currentState!
                                                      .validate()) {
                                                return;
                                              }

                                              if (skillValue == null) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'يجب تحديد مهارتك',
                                                      style: TextStyle(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBtnText,
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
                                                return;
                                              }

                                              if (formOpportunitiesRecord!
                                                  .appliedBy!
                                                  .toList()
                                                  .contains(currentUserEmail)) {
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
                                                  'applied_by':
                                                      FieldValue.arrayUnion(
                                                          [currentUserEmail]),
                                                };
                                                await formOpportunitiesRecord!
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
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
                                          ),
                                        ),
                                      if (formOpportunitiesRecord!.appliedBy!
                                          .toList()
                                          .contains(currentUserEmail))
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20, 0, 20, 0),
                                          child: SelectionArea(
                                              child: Text(
                                            'لقد تم تقديمك على هذه الفرصة مسبقاً.',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .title1
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          )),
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
