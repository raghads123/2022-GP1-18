import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EventInfoWidget extends StatefulWidget {
  const EventInfoWidget({
    Key? key,
    this.eventid,
  }) : super(key: key);

  final String? eventid;

  @override
  _EventInfoWidgetState createState() => _EventInfoWidgetState();
}

class _EventInfoWidgetState extends State<EventInfoWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<ExtraActsRecord>>(
      stream: queryExtraActsRecord(
        queryBuilder: (extraActsRecord) =>
            extraActsRecord.where('Act_name', isEqualTo: widget.eventid),
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
        List<ExtraActsRecord> eventInfoExtraActsRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final eventInfoExtraActsRecord = eventInfoExtraActsRecordList.isNotEmpty
            ? eventInfoExtraActsRecordList.first
            : null;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 50),
                              child: Image.network(
                                eventInfoExtraActsRecord!.actPic!,
                                width: double.infinity,
                                height: 300,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
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
                                      'events',
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
                          padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 4),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 6, 0),
                                  child: Text(
                                    eventInfoExtraActsRecord!.actName!,
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context).title2,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 7),
                                child: FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30,
                                  borderWidth: 1,
                                  buttonSize: 40,
                                  icon: Icon(
                                    Icons.notifications,
                                    color: Color(0xFF57636C),
                                    size: 30,
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
                          padding: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 8),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                                child: Icon(
                                  Icons.schedule,
                                  color: Color(0xFF0184BD),
                                  size: 20,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 4, 0),
                                child: Text(
                                  dateTimeFormat(
                                    'M/d h:mm a',
                                    eventInfoExtraActsRecord!.sdate!,
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  ),
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
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                                child: Icon(
                                  Icons.schedule,
                                  color: Color(0xFF0184BD),
                                  size: 20,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 4, 0),
                                child: Text(
                                  dateTimeFormat(
                                    'M/d h:mm a',
                                    eventInfoExtraActsRecord!.edate!,
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  ),
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
                          padding: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 8),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                                child: Icon(
                                  Icons.location_on_sharp,
                                  color: Color(0xFF0184BD),
                                  size: 20,
                                ),
                              ),
                              Text(
                                eventInfoExtraActsRecord!.actLoc!,
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
                          padding: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 8),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              if (eventInfoExtraActsRecord!.seats ?? true)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 4),
                                  child: Icon(
                                    Icons.event_seat_rounded,
                                    color: Color(0xFF0184BD),
                                    size: 20,
                                  ),
                                ),
                              if (eventInfoExtraActsRecord!.seats ?? true)
                                SelectionArea(
                                    child: Text(
                                  eventInfoExtraActsRecord!.numSeats!
                                      .toString(),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
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
                          padding: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 4, 0, 4),
                                  child: Text(
                                    'تفاصيل الفعالية',
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .title2
                                        .override(
                                          fontFamily: 'Poppins',
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 4),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 4, 0, 4),
                                  child: Text(
                                    eventInfoExtraActsRecord!.actDec!,
                                    textAlign: TextAlign.start,
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (valueOrDefault(currentUserDocument?.type, '') !=
                            'admin')
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
                                            eventInfoExtraActsRecord!.actName))
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 10, 0, 40),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            if (eventInfoExtraActsRecord!
                                                .seats!) {
                                              if (eventInfoExtraActsRecord!
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
                                                final usersUpdateData = {
                                                  'users_acts':
                                                      FieldValue.arrayUnion([
                                                    eventInfoExtraActsRecord!
                                                        .actName
                                                  ]),
                                                };
                                                await columnUsersRecord!
                                                    .reference
                                                    .update(usersUpdateData);

                                                final extraActsUpdateData = {
                                                  'num_seats':
                                                      FieldValue.increment(
                                                          -(1)),
                                                };
                                                await eventInfoExtraActsRecord!
                                                    .reference
                                                    .update(
                                                        extraActsUpdateData);
                                              }
                                            } else {
                                              final usersUpdateData = {
                                                'users_acts':
                                                    FieldValue.arrayUnion([
                                                  eventInfoExtraActsRecord!
                                                      .actName
                                                ]),
                                              };
                                              await columnUsersRecord!.reference
                                                  .update(usersUpdateData);
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
                                    if (columnUsersRecord!.usersActs!
                                        .toList()
                                        .contains(
                                            eventInfoExtraActsRecord!.actName))
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 10, 0, 40),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: Text(
                                                      'تم إلتحاقك بذا النشاط مسبقاً'),
                                                  content: Text(
                                                      'يمكنك تفقد صفحة \"أنشطتي\" لإلغاء الإلتحاق'),
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
                                          },
                                          text: 'تم إلتحاقك بهذا النشاط ',
                                          options: FFButtonOptions(
                                            width: 270,
                                            height: 50,
                                            color: Color(0xFF575F6C),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .subtitle1
                                                    .override(
                                                      fontFamily: 'Poppins',
                                                      color: Color(0xFFF3F4F4),
                                                      fontWeight:
                                                          FontWeight.w900,
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
