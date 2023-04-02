import '/auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'event_info_draft_model.dart';
export 'event_info_draft_model.dart';

class EventInfoDraftWidget extends StatefulWidget {
  const EventInfoDraftWidget({
    Key? key,
    this.eventid,
  }) : super(key: key);

  final String? eventid;

  @override
  _EventInfoDraftWidgetState createState() => _EventInfoDraftWidgetState();
}

class _EventInfoDraftWidgetState extends State<EventInfoDraftWidget> {
  late EventInfoDraftModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EventInfoDraftModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<ExtraActsRecord>>(
      stream: queryExtraActsRecord(
        queryBuilder: (extraActsRecord) =>
            extraActsRecord.where('Act_ID', isEqualTo: widget.eventid),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: CircularProgressIndicator(
                color: Color(0xFF0184BD),
              ),
            ),
          );
        }
        List<ExtraActsRecord> eventInfoDraftExtraActsRecordList =
            snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final eventInfoDraftExtraActsRecord =
            eventInfoDraftExtraActsRecordList.isNotEmpty
                ? eventInfoDraftExtraActsRecordList.first
                : null;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: Color(0xFFF4F3F0),
          appBar: AppBar(
            backgroundColor: Color(0xFFF4F3F0),
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              borderWidth: 1.0,
              buttonSize: 52.0,
              icon: Icon(
                Icons.arrow_back,
                color: Color(0xFF7EAEBD),
                size: 22.0,
              ),
              onPressed: () async {
                context.pop();
              },
            ),
            title: Text(
              'Page Title',
              style: FlutterFlowTheme.of(context).displaySmall.override(
                    fontFamily: 'Poppins',
                    color: Color(0xFF7EAEBD),
                    fontSize: 22.0,
                  ),
            ),
            actions: [],
            centerTitle: true,
            elevation: 2.0,
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Stack(
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 50.0),
                              child: InkWell(
                                onTap: () async {
                                  await Navigator.push(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.fade,
                                      child: FlutterFlowExpandedImageView(
                                        image: Image.network(
                                          valueOrDefault<String>(
                                            eventInfoDraftExtraActsRecord!
                                                .actPic,
                                            'https://identity.ksu.edu.sa/themes/custom/gavias_enzio/logo.png',
                                          ),
                                          fit: BoxFit.contain,
                                        ),
                                        allowRotation: false,
                                        tag: valueOrDefault<String>(
                                          eventInfoDraftExtraActsRecord!.actPic,
                                          'https://identity.ksu.edu.sa/themes/custom/gavias_enzio/logo.png',
                                        ),
                                        useHeroAnimation: true,
                                      ),
                                    ),
                                  );
                                },
                                child: Hero(
                                  tag: valueOrDefault<String>(
                                    eventInfoDraftExtraActsRecord!.actPic,
                                    'https://identity.ksu.edu.sa/themes/custom/gavias_enzio/logo.png',
                                  ),
                                  transitionOnUserGestures: true,
                                  child: Image.network(
                                    valueOrDefault<String>(
                                      eventInfoDraftExtraActsRecord!.actPic,
                                      'https://identity.ksu.edu.sa/themes/custom/gavias_enzio/logo.png',
                                    ),
                                    width: double.infinity,
                                    height: 300.0,
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 12.0, 4.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 6.0, 0.0),
                                  child: Text(
                                    eventInfoDraftExtraActsRecord!.actName!,
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .headlineMedium,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 7.0),
                                child: FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30.0,
                                  borderWidth: 1.0,
                                  buttonSize: 40.0,
                                  icon: Icon(
                                    Icons.notifications,
                                    color: Color(0xFF57636C),
                                    size: 30.0,
                                  ),
                                  onPressed: () {
                                    print('IconButton pressed ...');
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 4.0, 12.0, 8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 4.0),
                                child: Icon(
                                  Icons.schedule,
                                  color: Color(0xFF0184BD),
                                  size: 20.0,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 4.0, 0.0),
                                child: Text(
                                  dateTimeFormat(
                                    'M/d h:mm a',
                                    eventInfoDraftExtraActsRecord!.sdate!,
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF0184BD),
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 4.0),
                                child: Icon(
                                  Icons.schedule,
                                  color: Color(0xFF0184BD),
                                  size: 20.0,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 4.0, 0.0),
                                child: Text(
                                  dateTimeFormat(
                                    'M/d h:mm a',
                                    eventInfoDraftExtraActsRecord!.edate!,
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
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
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 4.0, 12.0, 8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 4.0),
                                child: Icon(
                                  Icons.location_on_sharp,
                                  color: Color(0xFF0184BD),
                                  size: 20.0,
                                ),
                              ),
                              Text(
                                eventInfoDraftExtraActsRecord!.actLoc!,
                                textAlign: TextAlign.end,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
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
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 4.0, 12.0, 8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              if (eventInfoDraftExtraActsRecord!.seats ?? true)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 4.0),
                                  child: Icon(
                                    Icons.event_seat_rounded,
                                    color: Color(0xFF0184BD),
                                    size: 20.0,
                                  ),
                                ),
                              if (eventInfoDraftExtraActsRecord!.seats ?? true)
                                SelectionArea(
                                    child: Text(
                                  eventInfoDraftExtraActsRecord!.numSeats!
                                      .toString(),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF0184BD),
                                        fontWeight: FontWeight.w500,
                                      ),
                                )),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 4.0, 12.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 4.0, 0.0, 4.0),
                                  child: Text(
                                    'تفاصيل الفعالية',
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .headlineMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 12.0, 4.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 4.0, 0.0, 4.0),
                                  child: Text(
                                    eventInfoDraftExtraActsRecord!.actDec!,
                                    textAlign: TextAlign.start,
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (getCurrentTimestamp >=
                            eventInfoDraftExtraActsRecord!.edate!)
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 12.0, 4.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 4.0, 0.0, 4.0),
                                    child: Text(
                                      'لقد إنتهت فرصة الإلتحاق بهذه الفعالية شكراً لاهتمامك!',
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
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
                                eventInfoDraftExtraActsRecord!.edate!))
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
                                      width: 50.0,
                                      height: 50.0,
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
                                        .contains(eventInfoDraftExtraActsRecord!
                                            .actID))
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 0.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            if (eventInfoDraftExtraActsRecord!
                                                .seats!) {
                                              if (eventInfoDraftExtraActsRecord!
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
                                                    eventInfoDraftExtraActsRecord!
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
                                                await eventInfoDraftExtraActsRecord!
                                                    .reference
                                                    .update(
                                                        extraActsUpdateData);
                                              }
                                            } else {
                                              final usersUpdateData2 = {
                                                'users_acts':
                                                    FieldValue.arrayUnion([
                                                  eventInfoDraftExtraActsRecord!
                                                      .actID
                                                ]),
                                              };
                                              await columnUsersRecord!.reference
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
                                            width: 270.0,
                                            height: 50.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: Color(0xFF1C8EC1),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleMedium
                                                    .override(
                                                      fontFamily: 'Poppins',
                                                      color: Colors.white,
                                                    ),
                                            elevation: 2.0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                  ],
                                );
                              },
                            ),
                          ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 15.0, 0.0, 40.0),
                          child: Container(
                            width: 380.0,
                            height: 183.0,
                            decoration: BoxDecoration(
                              color: Color(0xFFF4F3F0),
                            ),
                            child: FutureBuilder<ApiCallResponse>(
                              future: EvetnCBCall.call(
                                userID: currentUserEmail,
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        color: Color(0xFF0184BD),
                                      ),
                                    ),
                                  );
                                }
                                final listViewEvetnCBResponse = snapshot.data!;
                                return Builder(
                                  builder: (context) {
                                    final eventCBdata = getJsonField(
                                      listViewEvetnCBResponse.jsonBody,
                                      r'''$.data''',
                                    ).toList();
                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: eventCBdata.length,
                                      itemBuilder: (context, eventCBdataIndex) {
                                        final eventCBdataItem =
                                            eventCBdata[eventCBdataIndex];
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 20.0, 0.0),
                                          child: InkWell(
                                            onTap: () async {
                                              if (Navigator.of(context)
                                                  .canPop()) {
                                                context.pop();
                                              }
                                              context.pushNamed(
                                                'event_info_draft',
                                                queryParams: {
                                                  'eventid': serializeParam(
                                                    getJsonField(
                                                      eventCBdataItem,
                                                      r'''$.Act_ID''',
                                                    ).toString(),
                                                    ParamType.String,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            },
                                            child: Container(
                                              width: 130.0,
                                              height: 175.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 4.0,
                                                    color: Color(0x33000000),
                                                    offset: Offset(0.0, 2.0),
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(25.0),
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
                                                                        25.0),
                                                            child:
                                                                Image.network(
                                                              valueOrDefault<
                                                                  String>(
                                                                getJsonField(
                                                                  eventCBdataItem,
                                                                  r'''$.Act_pic''',
                                                                ),
                                                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRS95ie8G-8S3i_QsaD4Gjs1HQHIxBMPcoVLA&usqp=CAU',
                                                              ),
                                                              width: 90.0,
                                                              height: 90.0,
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
                                                                          6.0,
                                                                          0.0,
                                                                          6.0,
                                                                          0.0),
                                                              child: Text(
                                                                getJsonField(
                                                                  eventCBdataItem,
                                                                  r'''$.Act_name''',
                                                                ).toString(),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
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
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
