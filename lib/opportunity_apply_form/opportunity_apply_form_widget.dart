import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/oppapplicationform_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
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
  final scaffoldKey = GlobalKey<ScaffoldState>();

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
                            containerOpportunitiesRecordList = snapshot.data!;
                        // Return an empty Container when the document does not exist.
                        if (snapshot.data!.isEmpty) {
                          return Container();
                        }
                        final containerOpportunitiesRecord =
                            containerOpportunitiesRecordList.isNotEmpty
                                ? containerOpportunitiesRecordList.first
                                : null;
                        return Container(
                          width: double.infinity,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: SingleChildScrollView(
                            primary: false,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 130, 0, 0),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 15),
                                            child: Image.network(
                                              containerOpportunitiesRecord!
                                                  .opProviderLogo!,
                                              width: 130,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 15),
                                                  child: SelectionArea(
                                                      child: Text(
                                                    containerOpportunitiesRecord!
                                                        .oppName!,
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .title1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color:
                                                              Color(0xFF0184BD),
                                                        ),
                                                  )),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 0, 15),
                                                child: SelectionArea(
                                                    child: Text(
                                                  'تقدم فرصة',
                                                  textAlign: TextAlign.end,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                      ),
                                                )),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 15, 15),
                                                child: SelectionArea(
                                                    child: Text(
                                                  containerOpportunitiesRecord!
                                                      .opProvider!,
                                                  textAlign: TextAlign.end,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                      ),
                                                )),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(15, 0, 15, 15),
                                                child: SelectionArea(
                                                    child: Text(
                                                  'تفاصيل الفرصة:',
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText2,
                                                )),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(15, 0, 15, 15),
                                                  child: SelectionArea(
                                                      child: Text(
                                                    containerOpportunitiesRecord!
                                                        .opDesc!,
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText2
                                                        .override(
                                                          fontFamily:
                                                              'Open Sans',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .black600,
                                                          fontSize: 16,
                                                        ),
                                                  )),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 15, 0, 0),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                if (containerOpportunitiesRecord!
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
                                                            '.لقد تم تقديمك على هذه الفرصة مسبقاً'),
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
                                                  showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    context: context,
                                                    builder: (context) {
                                                      return Padding(
                                                        padding: MediaQuery.of(
                                                                context)
                                                            .viewInsets,
                                                        child: Container(
                                                          height: 400,
                                                          child:
                                                              OppapplicationformWidget(
                                                            oppappform:
                                                                containerOpportunitiesRecord!
                                                                    .oppName,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      setState(() {}));
                                                }
                                              },
                                              text: 'تقديم',
                                              options: FFButtonOptions(
                                                width: 270,
                                                height: 50,
                                                color: Color(0xFF1C8EC1),
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
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: AlignmentDirectional(-1, -1),
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
                        Icons.arrow_back_rounded,
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
