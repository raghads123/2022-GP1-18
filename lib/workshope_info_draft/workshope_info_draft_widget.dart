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
import 'workshope_info_draft_model.dart';
export 'workshope_info_draft_model.dart';

class WorkshopeInfoDraftWidget extends StatefulWidget {
  const WorkshopeInfoDraftWidget({
    Key? key,
    this.workshopid,
  }) : super(key: key);

  final String? workshopid;

  @override
  _WorkshopeInfoDraftWidgetState createState() =>
      _WorkshopeInfoDraftWidgetState();
}

class _WorkshopeInfoDraftWidgetState extends State<WorkshopeInfoDraftWidget> {
  late WorkshopeInfoDraftModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WorkshopeInfoDraftModel());
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
      backgroundColor: Colors.white,
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
          'معلومات الورشة ',
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
                width: 50.0,
                height: 50.0,
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
          return Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Stack(
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, -4.18),
                        child: InkWell(
                          onTap: () async {
                            await Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.fade,
                                child: FlutterFlowExpandedImageView(
                                  image: Image.network(
                                    valueOrDefault<String>(
                                      scrollingContainerExtraActsRecord!.actPic,
                                      'https://identity.ksu.edu.sa/themes/custom/gavias_enzio/logo.png',
                                    ),
                                    fit: BoxFit.contain,
                                  ),
                                  allowRotation: false,
                                  tag: valueOrDefault<String>(
                                    scrollingContainerExtraActsRecord!.actPic,
                                    'https://identity.ksu.edu.sa/themes/custom/gavias_enzio/logo.png',
                                  ),
                                  useHeroAnimation: true,
                                ),
                              ),
                            );
                          },
                          child: Hero(
                            tag: valueOrDefault<String>(
                              scrollingContainerExtraActsRecord!.actPic,
                              'https://identity.ksu.edu.sa/themes/custom/gavias_enzio/logo.png',
                            ),
                            transitionOnUserGestures: true,
                            child: Image.network(
                              valueOrDefault<String>(
                                scrollingContainerExtraActsRecord!.actPic,
                                'https://identity.ksu.edu.sa/themes/custom/gavias_enzio/logo.png',
                              ),
                              width: double.infinity,
                              height: 204.5,
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFF4F3F0),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4.0,
                          color: Color(0x33000000),
                        )
                      ],
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0.0),
                        bottomRight: Radius.circular(0.0),
                        topLeft: Radius.circular(50.0),
                        topRight: Radius.circular(50.0),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          25.0, 25.0, 25.0, 25.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
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
                                        scrollingContainerExtraActsRecord!
                                            .actName!,
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .headlineMedium,
                                      ),
                                    ),
                                  ),
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
                                        'تفاصيل الورشة ',
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall
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
                                        scrollingContainerExtraActsRecord!
                                            .sdate!,
                                        locale: FFLocalizations.of(context)
                                            .languageCode,
                                      ),
                                      textAlign: TextAlign.start,
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
                                        scrollingContainerExtraActsRecord!
                                            .edate!,
                                        locale: FFLocalizations.of(context)
                                            .languageCode,
                                      ),
                                      textAlign: TextAlign.start,
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
                                    scrollingContainerExtraActsRecord!.actLoc!,
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
                            if (scrollingContainerExtraActsRecord!.seats ??
                                true)
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
                                        Icons.event_seat_rounded,
                                        color: Color(0xFF0184BD),
                                        size: 20.0,
                                      ),
                                    ),
                                    Text(
                                      scrollingContainerExtraActsRecord!
                                          .numSeats!
                                          .toString(),
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
                                        'معلومات الورشة ',
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall
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
                                        scrollingContainerExtraActsRecord!
                                            .actDec!,
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            if (getCurrentTimestamp >=
                                scrollingContainerExtraActsRecord!.edate!)
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
                                          'لقد إنتهت فرصة الإلتحاق بهذه الورشة شكراً لاهتمامك!',
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
                            if ((valueOrDefault(
                                        currentUserDocument?.type, '') ==
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
                                            .contains(
                                                scrollingContainerExtraActsRecord!
                                                    .actID))
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 10.0, 0.0, 40.0),
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
                                                      'users_acts': FieldValue
                                                          .arrayUnion([
                                                        scrollingContainerExtraActsRecord!
                                                            .actID
                                                      ]),
                                                    };
                                                    await columnUsersRecord!
                                                        .reference
                                                        .update(
                                                            usersUpdateData1);

                                                    final extraActsUpdateData =
                                                        {
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
                                                      style:
                                                          GoogleFonts.getFont(
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
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color: Color(0xFF7EAEBD),
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color:
                                                              Color(0xFFF4F3F0),
                                                        ),
                                                elevation: 2.0,
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(25.0),
                                              ),
                                            ),
                                          ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            Container(
                              width: 380.0,
                              height: 183.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).lineColor,
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
                                        width: 50.0,
                                        height: 50.0,
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
                                              workshopCBdata[
                                                  workshopCBdataIndex];
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 20.0, 0.0),
                                            child: InkWell(
                                              onTap: () async {
                                                context.pushNamed(
                                                  'workshope_info_draft',
                                                  queryParams: {
                                                    'workshopid':
                                                        serializeParam(
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
                                                width: 130.0,
                                                height: 175.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 4.0,
                                                      color: Color(0x33000000),
                                                      offset: Offset(0.0, 2.0),
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25.0),
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
                                                                    workshopCBdataItem,
                                                                    r'''$.Act_pic''',
                                                                  ),
                                                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRS95ie8G-8S3i_QsaD4Gjs1HQHIxBMPcoVLA&usqp=CAU',
                                                                ),
                                                                width: 90.0,
                                                                height: 90.0,
                                                                fit: BoxFit
                                                                    .cover,
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
                                                                    workshopCBdataItem,
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
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
