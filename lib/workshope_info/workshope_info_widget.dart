import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_expanded_image_view.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'workshope_info_model.dart';
export 'workshope_info_model.dart';

class WorkshopeInfoWidget extends StatefulWidget {
  const WorkshopeInfoWidget({
    Key? key,
    this.workshopid,
  }) : super(key: key);

  final String? workshopid;

  @override
  _WorkshopeInfoWidgetState createState() => _WorkshopeInfoWidgetState();
}

class _WorkshopeInfoWidgetState extends State<WorkshopeInfoWidget> {
  late WorkshopeInfoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WorkshopeInfoModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF4F3F0),
      body: StreamBuilder<List<ExtraActsRecord>>(
        stream: queryExtraActsRecord(
          queryBuilder: (extraActsRecord) =>
              extraActsRecord.where('Act_ID', isEqualTo: widget.workshopid),
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
                  color: Color(0xFF0184BD),
                ),
              ),
            );
          }
          List<ExtraActsRecord> scrollingContainerExtraActsRecordList =
              snapshot.data!;
          // Return an empty Container when the item does not exist.
          if (snapshot.data!.isEmpty) {
            return Container();
          }
          final scrollingContainerExtraActsRecord =
              scrollingContainerExtraActsRecordList.isNotEmpty
                  ? scrollingContainerExtraActsRecordList.first
                  : null;
          return SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Stack(
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0, -4.18),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 50),
                                  child: InkWell(
                                    onTap: () async {
                                      await Navigator.push(
                                        context,
                                        PageTransition(
                                          type: PageTransitionType.fade,
                                          child: FlutterFlowExpandedImageView(
                                            image: Image.network(
                                              valueOrDefault<String>(
                                                scrollingContainerExtraActsRecord!
                                                    .actPic,
                                                'https://identity.ksu.edu.sa/themes/custom/gavias_enzio/logo.png',
                                              ),
                                              fit: BoxFit.contain,
                                            ),
                                            allowRotation: false,
                                            tag: valueOrDefault<String>(
                                              scrollingContainerExtraActsRecord!
                                                  .actPic,
                                              'https://identity.ksu.edu.sa/themes/custom/gavias_enzio/logo.png',
                                            ),
                                            useHeroAnimation: true,
                                          ),
                                        ),
                                      );
                                    },
                                    child: Hero(
                                      tag: valueOrDefault<String>(
                                        scrollingContainerExtraActsRecord!
                                            .actPic,
                                        'https://identity.ksu.edu.sa/themes/custom/gavias_enzio/logo.png',
                                      ),
                                      transitionOnUserGestures: true,
                                      child: Image.network(
                                        valueOrDefault<String>(
                                          scrollingContainerExtraActsRecord!
                                              .actPic,
                                          'https://identity.ksu.edu.sa/themes/custom/gavias_enzio/logo.png',
                                        ),
                                        width: double.infinity,
                                        height: 300,
                                        fit: BoxFit.scaleDown,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0, -0.8),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 90,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0xB3090F13),
                                        Color(0x00090F13)
                                      ],
                                      stops: [0, 1],
                                      begin: AlignmentDirectional(0, -1),
                                      end: AlignmentDirectional(0, 1),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-1, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 40, 16, 16),
                                  child: InkWell(
                                    onTap: () async {
                                      if (Navigator.of(context).canPop()) {
                                        context.pop();
                                      }
                                      context.pushNamed(
                                        'workshops',
                                        extra: <String, dynamic>{
                                          kTransitionInfoKey: TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.rightToLeft,
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
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            4, 4, 4, 4),
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
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(12, 0, 12, 4),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 6, 0),
                                    child: Text(
                                      scrollingContainerExtraActsRecord!
                                          .actName!,
                                      textAlign: TextAlign.start,
                                      style:
                                          FlutterFlowTheme.of(context).title2,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(12, 4, 12, 8),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 4),
                                  child: Icon(
                                    Icons.schedule,
                                    color: Color(0xFF0184BD),
                                    size: 20,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 4, 0),
                                  child: Text(
                                    dateTimeFormat(
                                      'M/d h:mm a',
                                      scrollingContainerExtraActsRecord!.sdate!,
                                      locale: FFLocalizations.of(context)
                                          .languageCode,
                                    ),
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: Color(0xFF0184BD),
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 4),
                                  child: Icon(
                                    Icons.schedule,
                                    color: Color(0xFF0184BD),
                                    size: 20,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 4, 0),
                                  child: Text(
                                    dateTimeFormat(
                                      'M/d h:mm a',
                                      scrollingContainerExtraActsRecord!.edate!,
                                      locale: FFLocalizations.of(context)
                                          .languageCode,
                                    ),
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: Color(0xFF0184BD),
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(12, 4, 12, 8),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 4),
                                  child: Icon(
                                    Icons.location_on_sharp,
                                    color: Color(0xFF0184BD),
                                    size: 20,
                                  ),
                                ),
                                Text(
                                  scrollingContainerExtraActsRecord!.actLoc!,
                                  textAlign: TextAlign.end,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF0184BD),
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(12, 4, 12, 8),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                if (scrollingContainerExtraActsRecord!.seats ??
                                    true)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 4),
                                    child: Icon(
                                      Icons.event_seat_rounded,
                                      color: Color(0xFF0184BD),
                                      size: 20,
                                    ),
                                  ),
                                if (scrollingContainerExtraActsRecord!.seats ??
                                    true)
                                  Text(
                                    scrollingContainerExtraActsRecord!.numSeats!
                                        .toString(),
                                    textAlign: TextAlign.end,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: Color(0xFF0184BD),
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(12, 4, 12, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 4, 0, 4),
                                    child: Text(
                                      'تفاصيل ورشة العمل',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText2
                                          .override(
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(12, 0, 12, 4),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 4, 0, 4),
                                    child: Text(
                                      scrollingContainerExtraActsRecord!
                                          .actDec!,
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (getCurrentTimestamp >=
                              scrollingContainerExtraActsRecord!.edate!)
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(12, 0, 12, 4),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 4, 0, 4),
                                      child: Text(
                                        'لقد إنتهت فرصة الإلتحاق هذه ورشة العمل شكراً لاهتمامك!',
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Color(0xFFB72F31),
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          if ((valueOrDefault(currentUserDocument?.type, '') ==
                                  'student') &&
                              (getCurrentTimestamp <
                                  scrollingContainerExtraActsRecord!.edate!))
                            AuthUserStreamWidget(
                              builder: (context) =>
                                  StreamBuilder<List<UsersRecord>>(
                                stream: queryUsersRecord(
                                  queryBuilder: (usersRecord) =>
                                      usersRecord.where('email',
                                          isEqualTo: currentUserEmail),
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
                                          color: Color(0xFF0184BD),
                                        ),
                                      ),
                                    );
                                  }
                                  List<UsersRecord> columnUsersRecordList =
                                      snapshot.data!;
                                  final columnUsersRecord =
                                      columnUsersRecordList.isNotEmpty
                                          ? columnUsersRecordList.first
                                          : null;
                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      if (!columnUsersRecord!.usersActs!
                                          .toList()
                                          .contains(
                                              scrollingContainerExtraActsRecord!
                                                  .actID))
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 10, 0, 40),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              if (scrollingContainerExtraActsRecord!
                                                  .seats!) {
                                                if (scrollingContainerExtraActsRecord!
                                                        .numSeats ==
                                                    0) {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return AlertDialog(
                                                        title: Text(
                                                            'عذراً لا تتوفر مقاعد'),
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
                                                  final usersUpdateData1 = {
                                                    'users_acts':
                                                        FieldValue.arrayUnion([
                                                      scrollingContainerExtraActsRecord!
                                                          .actID
                                                    ]),
                                                  };
                                                  await columnUsersRecord!
                                                      .reference
                                                      .update(usersUpdateData1);

                                                  final extraActsUpdateData = {
                                                    'num_seats':
                                                        FieldValue.increment(
                                                            -(1)),
                                                  };
                                                  await scrollingContainerExtraActsRecord!
                                                      .reference
                                                      .update(
                                                          extraActsUpdateData);
                                                }
                                              } else {
                                                final usersUpdateData2 = {
                                                  'users_acts':
                                                      FieldValue.arrayUnion([
                                                    scrollingContainerExtraActsRecord!
                                                        .actID
                                                  ]),
                                                };
                                                await columnUsersRecord!
                                                    .reference
                                                    .update(usersUpdateData2);
                                              }

                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'تم إلتحاقك في هذا النشاط بنجاح',
                                                    style: GoogleFonts.getFont(
                                                      'Open Sans',
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      Color(0xE15BD85B),
                                                ),
                                              );
                                            },
                                            text: 'إلتحاق',
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
                                  );
                                },
                              ),
                            ),
                          Container(
                            width: 380,
                            height: 183,
                            decoration: BoxDecoration(
                              color: Color(0xFFF4F3F0),
                            ),
                            child: FutureBuilder<ApiCallResponse>(
                              future: WorkshopCBCall.call(
                                userID: currentUserEmail,
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: CircularProgressIndicator(
                                        color: Color(0xFF0184BD),
                                      ),
                                    ),
                                  );
                                }
                                final listViewWorkshopCBResponse =
                                    snapshot.data!;
                                return Builder(
                                  builder: (context) {
                                    final workshopCBdata = getJsonField(
                                      listViewWorkshopCBResponse.jsonBody,
                                      r'''$.data''',
                                    ).toList();
                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: workshopCBdata.length,
                                      itemBuilder:
                                          (context, workshopCBdataIndex) {
                                        final workshopCBdataItem =
                                            workshopCBdata[workshopCBdataIndex];
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 20, 0),
                                          child: InkWell(
                                            onTap: () async {
                                              context.pushNamed(
                                                'workshope_info',
                                                queryParams: {
                                                  'workshopid': serializeParam(
                                                    getJsonField(
                                                      workshopCBdataItem,
                                                      r'''$.Act_ID''',
                                                    ).toString(),
                                                    ParamType.String,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            },
                                            child: Container(
                                              width: 130,
                                              height: 175,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 4,
                                                    color: Color(0x33000000),
                                                    offset: Offset(0, 2),
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                                shape: BoxShape.rectangle,
                                              ),
                                              child: Stack(
                                                children: [
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        25),
                                                            child:
                                                                Image.network(
                                                              valueOrDefault<
                                                                  String>(
                                                                getJsonField(
                                                                  workshopCBdataItem,
                                                                  r'''$.Act_pic''',
                                                                ),
                                                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRS95ie8G-8S3i_QsaD4Gjs1HQHIxBMPcoVLA&usqp=CAU',
                                                              ),
                                                              width: 90,
                                                              height: 90,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          6,
                                                                          0,
                                                                          6,
                                                                          0),
                                                              child: Text(
                                                                getJsonField(
                                                                  workshopCBdataItem,
                                                                  r'''$.Act_name''',
                                                                ).toString(),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      color: Color(
                                                                          0xFF57636C),
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
