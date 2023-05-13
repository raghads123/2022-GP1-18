import '/auth/firebase_auth/auth_util.dart';
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
import 'course_info_model.dart';
export 'course_info_model.dart';
import 'package:count_me_in/utils/utility.dart';

class CourseInfoWidget extends StatefulWidget {
  const CourseInfoWidget({
    Key? key,
    this.courseid,
  }) : super(key: key);

  final String? courseid;

  @override
  _CourseInfoWidgetState createState() => _CourseInfoWidgetState();
}

class _CourseInfoWidgetState extends State<CourseInfoWidget> with Utility {
  late CourseInfoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CourseInfoModel());
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
      appBar: AppBar(
        backgroundColor: Color(0xFFF4F3F0),
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30.0,
          buttonSize: 60.0,
          icon: Icon(
            Icons.chevron_left_rounded,
            color: Color(0xFF7EAEBD),
            size: 30.0,
          ),
          onPressed: () async {
            if (valueOrDefault(currentUserDocument?.type, '') == 'student') {
              context.safePop();
            } else {
              context.goNamed('coursesCopy');
            }
          },
        ),
        title: Text(
          'معلومات الدورة',
          style: FlutterFlowTheme.of(context).headlineMedium.override(
                fontFamily: 'Poppins',
                color: Color(0xFF7EAEBD),
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 2.0,
      ),
      body: StreamBuilder<List<ExtraActsRecord>>(
        stream: queryExtraActsRecord(
          queryBuilder: (extraActsRecord) =>
              extraActsRecord.where('Act_ID', isEqualTo: widget.courseid),
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
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Stack(
                          children: [
                            InkWell(
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
                                  height: 205.0,
                                  fit: BoxFit.scaleDown,
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
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 30.0, 20.0, 15.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5.0, 0.0, 0.0, 0.0),
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
                                    20.0, 0.0, 20.0, 5.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'تفاصيل الدورة',
                                        textAlign: TextAlign.end,
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 20.0, 5.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5.0, 0.0, 0.0, 4.0),
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
                                          5.0, 0.0, 0.0, 4.0),
                                      child: Icon(
                                        Icons.schedule,
                                        color: Color(0xFF0184BD),
                                        size: 20.0,
                                      ),
                                    ),
                                    Text(
                                      dateTimeFormat(
                                        'M/d h:mm a',
                                        scrollingContainerExtraActsRecord!
                                            .edate!,
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
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 20.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5.0, 0.0, 0.0, 4.0),
                                      child: Icon(
                                        Icons.schedule,
                                        color: Color(0xFF0184BD),
                                        size: 20.0,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        'آخر فرصة للالتحاق ${dateTimeFormat(
                                          'M/d h:mm a',
                                          scrollingContainerExtraActsRecord!
                                              .lastD2enroll,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        )}',
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
                                    20.0, 0.0, 20.0, 5.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5.0, 0.0, 0.0, 4.0),
                                      child: Icon(
                                        Icons.location_on_sharp,
                                        color: Color(0xFF0184BD),
                                        size: 20.0,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        scrollingContainerExtraActsRecord!
                                            .actLoc!,
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
                              if (scrollingContainerExtraActsRecord!.seats ??
                                  true)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 20.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5.0, 0.0, 0.0, 4.0),
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
                                    20.0, 15.0, 20.0, 5.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'وصف الدورة',
                                        textAlign: TextAlign.end,
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 20.0, 15.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5.0, 0.0, 0.0, 0.0),
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
                              if (getCurrentTimestamp >
                                  scrollingContainerExtraActsRecord!
                                      .lastD2enroll!)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 20.0, 15.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      if (valueOrDefault(
                                              currentUserDocument?.type, '') ==
                                          'student')
                                        Expanded(
                                          child: AuthUserStreamWidget(
                                            builder: (context) => Text(
                                              'لقد إنتهت فرصة الالتحاق بهذه الدورة شكراً لاهتمامك!',
                                              textAlign: TextAlign.start,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            Color(0xFFB72F31),
                                                      ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              if (getCurrentTimestamp <=
                                  scrollingContainerExtraActsRecord!
                                      .lastD2enroll!)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 15.0, 20.0, 15.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      if (valueOrDefault(
                                              currentUserDocument?.type, '') ==
                                          'student')
                                        AuthUserStreamWidget(
                                          builder: (context) =>
                                              StreamBuilder<List<UsersRecord>>(
                                            stream: queryUsersRecord(
                                              queryBuilder: (usersRecord) =>
                                                  usersRecord.where('email',
                                                      isEqualTo:
                                                          currentUserEmail),
                                              singleRecord: true,
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    child:
                                                        CircularProgressIndicator(
                                                      color: Color(0xFF0184BD),
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<UsersRecord>
                                                  buttonUsersRecordList =
                                                  snapshot.data!;
                                              final buttonUsersRecord =
                                                  buttonUsersRecordList
                                                          .isNotEmpty
                                                      ? buttonUsersRecordList
                                                          .first
                                                      : null;
                                              return FFButtonWidget(
                                                onPressed: buttonUsersRecord!
                                                        .usersActs!
                                                        .toList()
                                                        .contains(
                                                            scrollingContainerExtraActsRecord!
                                                                .actID)
                                                    ? null
                                                    : () async {
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
                                                                      onPressed:
                                                                          () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                      child: Text(
                                                                          'تم'),
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            );
                                                            return;
                                                          } else {
                                                            final usersUpdateData1 =
                                                                {
                                                              'users_acts':
                                                                  FieldValue
                                                                      .arrayUnion([
                                                                scrollingContainerExtraActsRecord!
                                                                    .actID
                                                              ]),
                                                            };
                                                            await currentUserReference!
                                                                .update(
                                                                    usersUpdateData1);

                                                            final extraActsUpdateData =
                                                                {
                                                              'num_seats':
                                                                  FieldValue
                                                                      .increment(
                                                                          -(1)),
                                                            };
                                                            await scrollingContainerExtraActsRecord!
                                                                .reference
                                                                .update(
                                                                    extraActsUpdateData);
                                                          }
                                                        } else {
                                                          final usersUpdateData2 =
                                                              {
                                                            'users_acts':
                                                                FieldValue
                                                                    .arrayUnion([
                                                              scrollingContainerExtraActsRecord!
                                                                  .actID
                                                            ]),
                                                          };
                                                          await currentUserReference!
                                                              .update(
                                                                  usersUpdateData2);
                                                        }

                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              'تم التحاقك في هذا النشاط بنجاح',
                                                              style: GoogleFonts
                                                                  .getFont(
                                                                'Open Sans',
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                            duration: Duration(
                                                                milliseconds:
                                                                    4000),
                                                            backgroundColor:
                                                                Color(
                                                                    0xE15BD85B),
                                                          ),
                                                        );
                                                        var confirmDialogResponse =
                                                            await showDialog<
                                                                    bool>(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (alertDialogContext) {
                                                                    return AlertDialog(
                                                                      title: Text(
                                                                          'إضافة للتقويم'),
                                                                      content: Text(
                                                                          'هل تريد إضافة هذه الدورة لتقومك الخاص؟'),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () => Navigator.pop(
                                                                              alertDialogContext,
                                                                              false),
                                                                          child:
                                                                              Text('لا'),
                                                                        ),
                                                                        TextButton(
                                                                          onPressed: () => Navigator.pop(
                                                                              alertDialogContext,
                                                                              true),
                                                                          child:
                                                                              Text('نعم'),
                                                                        ),
                                                                      ],
                                                                    );
                                                                  },
                                                                ) ??
                                                                false;
                                                        if (confirmDialogResponse) {
                                                          addToCalendar(
                                                            sdate:
                                                                scrollingContainerExtraActsRecord
                                                                    .sdate!,
                                                            edate:
                                                                scrollingContainerExtraActsRecord
                                                                    .edate,
                                                            type:
                                                                scrollingContainerExtraActsRecord
                                                                    .actType,
                                                            title:
                                                                scrollingContainerExtraActsRecord
                                                                    .actName,
                                                            location:
                                                                scrollingContainerExtraActsRecord
                                                                    .actLoc,
                                                          );
                                                        } else {
                                                          Navigator.pop(
                                                              context);
                                                        }
                                                      },
                                                text: 'التحاق',
                                                options: FFButtonOptions(
                                                  width: 270.0,
                                                  height: 50.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: Color(0xFF7EAEBD),
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .titleMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.white,
                                                      ),
                                                  elevation: 2.0,
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25.0),
                                                  disabledColor:
                                                      Color(0x79E0E0E0),
                                                  disabledTextColor:
                                                      Colors.white,
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              if (getCurrentTimestamp <=
                                  scrollingContainerExtraActsRecord!
                                      .lastD2disenroll!)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 15.0, 20.0, 15.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      if ((valueOrDefault(
                                                  currentUserDocument?.type,
                                                  '') ==
                                              'student') &&
                                          (scrollingContainerExtraActsRecord!
                                                  .numSeats ==
                                              0))
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 15.0, 20.0, 15.0),
                                            child: AuthUserStreamWidget(
                                              builder: (context) =>
                                                  StreamBuilder<
                                                      List<NotifyRecord>>(
                                                stream: queryNotifyRecord(
                                                  queryBuilder: (notifyRecord) =>
                                                      notifyRecord.where(
                                                          'act_ID',
                                                          isEqualTo:
                                                              scrollingContainerExtraActsRecord!
                                                                  .actID),
                                                  singleRecord: true,
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        child:
                                                            CircularProgressIndicator(
                                                          color:
                                                              Color(0xFF0184BD),
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<NotifyRecord>
                                                      switchListTileNotifyRecordList =
                                                      snapshot.data!;
                                                  final switchListTileNotifyRecord =
                                                      switchListTileNotifyRecordList
                                                              .isNotEmpty
                                                          ? switchListTileNotifyRecordList
                                                              .first
                                                          : null;
                                                  return SwitchListTile(
                                                    value: _model
                                                            .switchListTileValue ??=
                                                        false,
                                                    onChanged:
                                                        (newValue) async {
                                                      setState(() => _model
                                                              .switchListTileValue =
                                                          newValue!);
                                                      if (newValue!) {
                                                        if (switchListTileNotifyRecord !=
                                                            null) {
                                                          final notifyUpdateData =
                                                              {
                                                            'multiuser':
                                                                FieldValue
                                                                    .arrayUnion([
                                                              currentUserReference
                                                            ]),
                                                          };
                                                          await switchListTileNotifyRecord!
                                                              .reference
                                                              .update(
                                                                  notifyUpdateData);
                                                        } else {
                                                          final notifyCreateData =
                                                              {
                                                            ...createNotifyRecordData(
                                                              actID: widget
                                                                  .courseid,
                                                            ),
                                                            'multiuser': [
                                                              currentUserReference
                                                            ],
                                                          };
                                                          await NotifyRecord
                                                              .collection
                                                              .doc()
                                                              .set(
                                                                  notifyCreateData);
                                                        }
                                                      } else {
                                                        final notifyUpdateData =
                                                            {
                                                          ...createNotifyRecordData(
                                                            actID:
                                                                widget.courseid,
                                                          ),
                                                          'multiuser':
                                                              FieldValue
                                                                  .arrayRemove([
                                                            currentUserReference
                                                          ]),
                                                        };
                                                        await switchListTileNotifyRecord!
                                                            .reference
                                                            .update(
                                                                notifyUpdateData);
                                                      }
                                                    },
                                                    title: Text(
                                                      'نبهني في حال توفرت مقاعد',
                                                      style:
                                                          GoogleFonts.getFont(
                                                        'Open Sans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 18.0,
                                                      ),
                                                    ),
                                                    tileColor:
                                                        Color(0xFFF5F5F5),
                                                    dense: false,
                                                    controlAffinity:
                                                        ListTileControlAffinity
                                                            .trailing,
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              if (valueOrDefault(
                                      currentUserDocument?.type, '') ==
                                  'student')
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 20.0, 5.0),
                                  child: AuthUserStreamWidget(
                                    builder: (context) => Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'دورات مشابهة',
                                          textAlign: TextAlign.end,
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall
                                              .override(
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              if (valueOrDefault(
                                      currentUserDocument?.type, '') ==
                                  'student')
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 15.0),
                                  child: AuthUserStreamWidget(
                                    builder: (context) => Container(
                                      width: double.infinity,
                                      height: 183.0,
                                      decoration: BoxDecoration(),
                                      child: FutureBuilder<ApiCallResponse>(
                                        future: CoursesCBCall.call(
                                          userID: currentUserEmail,
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child:
                                                    CircularProgressIndicator(
                                                  color: Color(0xFF0184BD),
                                                ),
                                              ),
                                            );
                                          }
                                          final listViewCoursesCBResponse =
                                              snapshot.data!;
                                          return Builder(
                                            builder: (context) {
                                              final coursesCBdata =
                                                  getJsonField(
                                                listViewCoursesCBResponse
                                                    .jsonBody,
                                                r'''$.data[?(@.status=='موافق عليها')]''',
                                              ).toList();
                                              return ListView.builder(
                                                padding: EdgeInsets.zero,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount: coursesCBdata.length,
                                                itemBuilder: (context,
                                                    coursesCBdataIndex) {
                                                  final coursesCBdataItem =
                                                      coursesCBdata[
                                                          coursesCBdataIndex];
                                                  return Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 15.0,
                                                                20.0, 15.0),
                                                    child: StreamBuilder<
                                                        List<
                                                            UserHistoryRecord>>(
                                                      stream:
                                                          queryUserHistoryRecord(
                                                        queryBuilder:
                                                            (userHistoryRecord) =>
                                                                userHistoryRecord.where(
                                                                    'user_email',
                                                                    isEqualTo:
                                                                        currentUserEmail),
                                                        singleRecord: true,
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 50.0,
                                                              height: 50.0,
                                                              child:
                                                                  CircularProgressIndicator(
                                                                color: Color(
                                                                    0xFF0184BD),
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        List<UserHistoryRecord>
                                                            containerUserHistoryRecordList =
                                                            snapshot.data!;
                                                        final containerUserHistoryRecord =
                                                            containerUserHistoryRecordList
                                                                    .isNotEmpty
                                                                ? containerUserHistoryRecordList
                                                                    .first
                                                                : null;
                                                        return InkWell(
                                                          onTap: () async {
                                                            context.pushNamed(
                                                              'course_info',
                                                              queryParams: {
                                                                'courseid':
                                                                    serializeParam(
                                                                  getJsonField(
                                                                    coursesCBdataItem,
                                                                    r'''$.Act_ID''',
                                                                  ).toString(),
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                              }.withoutNulls,
                                                            );

                                                            if (containerUserHistoryRecord !=
                                                                null) {
                                                              final userHistoryUpdateData =
                                                                  createUserHistoryRecordData(
                                                                extraActivityID:
                                                                    getJsonField(
                                                                  coursesCBdataItem,
                                                                  r'''$.Act_ID''',
                                                                ).toString(),
                                                                aCTType:
                                                                    'دورة تدريبية',
                                                              );
                                                              await containerUserHistoryRecord!
                                                                  .reference
                                                                  .update(
                                                                      userHistoryUpdateData);
                                                            } else {
                                                              final userHistoryCreateData =
                                                                  createUserHistoryRecordData(
                                                                userEmail:
                                                                    currentUserEmail,
                                                                extraActivityID:
                                                                    getJsonField(
                                                                  coursesCBdataItem,
                                                                  r'''$.Act_ID''',
                                                                ).toString(),
                                                                aCTType:
                                                                    'دورة تدريبية',
                                                              );
                                                              await UserHistoryRecord
                                                                  .collection
                                                                  .doc()
                                                                  .set(
                                                                      userHistoryCreateData);
                                                            }
                                                          },
                                                          child: Container(
                                                            width: 180.0,
                                                            height: 175.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  blurRadius:
                                                                      4.0,
                                                                  color: Color(
                                                                      0x33000000),
                                                                  offset:
                                                                      Offset(
                                                                          0.0,
                                                                          2.0),
                                                                )
                                                              ],
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          25.0),
                                                              shape: BoxShape
                                                                  .rectangle,
                                                            ),
                                                            child: Stack(
                                                              children: [
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceEvenly,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          15.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.min,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.circular(25.0),
                                                                            child:
                                                                                Image.network(
                                                                              valueOrDefault<String>(
                                                                                getJsonField(
                                                                                  coursesCBdataItem,
                                                                                  r'''$.Act_pic''',
                                                                                ),
                                                                                'https://identity.ksu.edu.sa/themes/custom/gavias_enzio/logo.png',
                                                                              ),
                                                                              width: 150.0,
                                                                              height: 80.0,
                                                                              fit: BoxFit.fitWidth,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(6.0, 6.0, 6.0, 6.0),
                                                                              child: Text(
                                                                                getJsonField(
                                                                                  coursesCBdataItem,
                                                                                  r'''$.Act_name''',
                                                                                ).toString(),
                                                                                textAlign: TextAlign.center,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Poppins',
                                                                                      color: Color(0xFF57636C),
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        );
                                                      },
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
                                ),
                            ],
                          ),
                        ),
                      ],
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
