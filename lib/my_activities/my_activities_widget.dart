import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/edit_act_widget.dart';
import '../components/ratecollection_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MyActivitiesWidget extends StatefulWidget {
  const MyActivitiesWidget({Key? key}) : super(key: key);

  @override
  _MyActivitiesWidgetState createState() => _MyActivitiesWidgetState();
}

class _MyActivitiesWidgetState extends State<MyActivitiesWidget> {
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Stack(
            children: [
              StreamBuilder<List<UsersRecord>>(
                stream: queryUsersRecord(
                  queryBuilder: (usersRecord) =>
                      usersRecord.where('email', isEqualTo: currentUserEmail),
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
                  List<UsersRecord> tabBarUsersRecordList = snapshot.data!;
                  // Return an empty Container when the item does not exist.
                  if (snapshot.data!.isEmpty) {
                    return Container();
                  }
                  final tabBarUsersRecord = tabBarUsersRecordList.isNotEmpty
                      ? tabBarUsersRecordList.first
                      : null;
                  return DefaultTabController(
                    length: 2,
                    initialIndex: 0,
                    child: Column(
                      children: [
                        TabBar(
                          labelColor: Color(0xFF777373),
                          labelStyle:
                              FlutterFlowTheme.of(context).title2.override(
                                    fontFamily: 'Poppins',
                                    fontSize: 16,
                                  ),
                          indicatorColor:
                              FlutterFlowTheme.of(context).alternate,
                          tabs: [
                            Tab(
                              text: 'فرصي',
                            ),
                            Tab(
                              text: 'أنشطتي',
                            ),
                          ],
                        ),
                        Expanded(
                          child: TabBarView(
                            children: [
                              SingleChildScrollView(
                                primary: false,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    if (tabBarUsersRecord!.type == 'student')
                                      ListView(
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        children: [
                                          StreamBuilder<
                                              List<OppApplicationsRecord>>(
                                            stream: queryOppApplicationsRecord(
                                              queryBuilder:
                                                  (oppApplicationsRecord) =>
                                                      oppApplicationsRecord.where(
                                                          'app_email',
                                                          isEqualTo:
                                                              currentUserEmail),
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
                                                      color: Color(0xFF0184BD),
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<OppApplicationsRecord>
                                                  columnOppApplicationsRecordList =
                                                  snapshot.data!;
                                              return Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: List.generate(
                                                    columnOppApplicationsRecordList
                                                        .length, (columnIndex) {
                                                  final columnOppApplicationsRecord =
                                                      columnOppApplicationsRecordList[
                                                          columnIndex];
                                                  return Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                6, 6, 6, 6),
                                                    child: Container(
                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            blurRadius: 7,
                                                            color: Color(
                                                                0xFF777373),
                                                            offset:
                                                                Offset(0, 3),
                                                          )
                                                        ],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                        border: Border.all(
                                                          color:
                                                              Color(0xFFE4DFDA),
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(12,
                                                                    12, 12, 12),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          8,
                                                                          0,
                                                                          8),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    columnOppApplicationsRecord
                                                                        .oppName!,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .end,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .title3
                                                                        .override(
                                                                          fontFamily:
                                                                              'Outfit',
                                                                          color:
                                                                              Color(0xFF1C8EC1),
                                                                          fontSize:
                                                                              20,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          4,
                                                                          0,
                                                                          0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  SelectionArea(
                                                                      child:
                                                                          Text(
                                                                    'حالة التقديم',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .subtitle1,
                                                                  )),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            60,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                    child: Icon(
                                                                      Icons
                                                                          .flaky,
                                                                      color: Color(
                                                                          0xFF575F6C),
                                                                      size: 24,
                                                                    ),
                                                                  ),
                                                                  SelectionArea(
                                                                      child:
                                                                          Text(
                                                                    columnOppApplicationsRecord
                                                                        .status!,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1,
                                                                  )),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    if (tabBarUsersRecord!.type == 'admin')
                                      StreamBuilder<List<OpportunitiesRecord>>(
                                        stream: queryOpportunitiesRecord(
                                          queryBuilder: (opportunitiesRecord) =>
                                              opportunitiesRecord.where(
                                                  'OpProvider',
                                                  isEqualTo: currentUserEmail),
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
                                                  color: Color(0xFF0184BD),
                                                ),
                                              ),
                                            );
                                          }
                                          List<OpportunitiesRecord>
                                              listViewOpportunitiesRecordList =
                                              snapshot.data!;
                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            primary: false,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount:
                                                listViewOpportunitiesRecordList
                                                    .length,
                                            itemBuilder:
                                                (context, listViewIndex) {
                                              final listViewOpportunitiesRecord =
                                                  listViewOpportunitiesRecordList[
                                                      listViewIndex];
                                              return Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(16, 12, 16, 0),
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 3,
                                                        color:
                                                            Color(0x25000000),
                                                        offset: Offset(0, 2),
                                                      )
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Icon(
                                                        Icons.settings_outlined,
                                                        color: Colors.black,
                                                        size: 24,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(12,
                                                                    12, 16, 12),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              listViewOpportunitiesRecord
                                                                  .oppName!,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .title2
                                                                  .override(
                                                                    fontFamily:
                                                                        'Outfit',
                                                                    color: Color(
                                                                        0xFF101213),
                                                                    fontSize:
                                                                        22,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          4,
                                                                          0,
                                                                          0),
                                                              child: Text(
                                                                listViewOpportunitiesRecord
                                                                    .opProvider!,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText2
                                                                    .override(
                                                                      fontFamily:
                                                                          'Outfit',
                                                                      color: Color(
                                                                          0xFF57636C),
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          4,
                                                                          0,
                                                                          0),
                                                              child: Text(
                                                                listViewOpportunitiesRecord
                                                                    .status!,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Outfit',
                                                                      color: Color(
                                                                          0xFF4B39EF),
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
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
                                        },
                                      ),
                                  ],
                                ),
                              ),
                              SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    if ((tabBarUsersRecord!.type ==
                                            'student') &&
                                        (tabBarUsersRecord!.email ==
                                            currentUserEmail))
                                      Builder(
                                        builder: (context) {
                                          final useractlist = tabBarUsersRecord!
                                              .usersActs!
                                              .toList();
                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount: useractlist.length,
                                            itemBuilder:
                                                (context, useractlistIndex) {
                                              final useractlistItem =
                                                  useractlist[useractlistIndex];
                                              return StreamBuilder<
                                                  List<ExtraActsRecord>>(
                                                stream: queryExtraActsRecord(
                                                  queryBuilder:
                                                      (extraActsRecord) =>
                                                          extraActsRecord.where(
                                                              'Act_name',
                                                              isEqualTo:
                                                                  useractlistItem),
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
                                                              Color(0xFF0184BD),
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<ExtraActsRecord>
                                                      columnExtraActsRecordList =
                                                      snapshot.data!;
                                                  // Return an empty Container when the item does not exist.
                                                  if (snapshot.data!.isEmpty) {
                                                    return Container();
                                                  }
                                                  final columnExtraActsRecord =
                                                      columnExtraActsRecordList
                                                              .isNotEmpty
                                                          ? columnExtraActsRecordList
                                                              .first
                                                          : null;
                                                  return Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    6, 6, 6, 6),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                blurRadius: 7,
                                                                color: Color(
                                                                    0xFF777373),
                                                                offset: Offset(
                                                                    0, 3),
                                                              )
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                            border: Border.all(
                                                              color: Color(
                                                                  0xFFE4DFDA),
                                                            ),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12,
                                                                        12,
                                                                        12,
                                                                        12),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          8,
                                                                          0,
                                                                          8),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        useractlistItem,
                                                                        textAlign:
                                                                            TextAlign.end,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .title3
                                                                            .override(
                                                                              fontFamily: 'Outfit',
                                                                              color: Color(0xFF1C8EC1),
                                                                              fontSize: 20,
                                                                              fontWeight: FontWeight.w500,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          4,
                                                                          0,
                                                                          0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              0,
                                                                              0,
                                                                              5),
                                                                          child:
                                                                              FFButtonWidget(
                                                                            onPressed:
                                                                                () async {
                                                                              if (columnExtraActsRecord!.seats!) {
                                                                                var confirmDialogResponse = await showDialog<bool>(
                                                                                      context: context,
                                                                                      builder: (alertDialogContext) {
                                                                                        return AlertDialog(
                                                                                          title: Text('هل تريد إلغاء تسجيلك في هذا النشاط؟'),
                                                                                          actions: [
                                                                                            TextButton(
                                                                                              onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                              child: Text('لا'),
                                                                                            ),
                                                                                            TextButton(
                                                                                              onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                              child: Text('نعم'),
                                                                                            ),
                                                                                          ],
                                                                                        );
                                                                                      },
                                                                                    ) ??
                                                                                    false;
                                                                                if (confirmDialogResponse) {
                                                                                  final usersUpdateData = {
                                                                                    'users_acts': FieldValue.arrayRemove([
                                                                                      useractlistItem
                                                                                    ]),
                                                                                  };
                                                                                  await tabBarUsersRecord!.reference.update(usersUpdateData);

                                                                                  final extraActsUpdateData = {
                                                                                    'num_seats': FieldValue.increment(1),
                                                                                  };
                                                                                  await columnExtraActsRecord!.reference.update(extraActsUpdateData);
                                                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                                                    SnackBar(
                                                                                      content: Text(
                                                                                        'تم إلغاء تسجيلك بنجاح!',
                                                                                        style: TextStyle(
                                                                                          color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                          fontWeight: FontWeight.bold,
                                                                                        ),
                                                                                      ),
                                                                                      duration: Duration(milliseconds: 4000),
                                                                                      backgroundColor: Color(0xE15BD85B),
                                                                                    ),
                                                                                  );
                                                                                }
                                                                              } else {
                                                                                var confirmDialogResponse = await showDialog<bool>(
                                                                                      context: context,
                                                                                      builder: (alertDialogContext) {
                                                                                        return AlertDialog(
                                                                                          title: Text('هل تريد إلغاء تسجيلك في هذا النشاط؟'),
                                                                                          actions: [
                                                                                            TextButton(
                                                                                              onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                              child: Text('لا'),
                                                                                            ),
                                                                                            TextButton(
                                                                                              onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                              child: Text('نعم'),
                                                                                            ),
                                                                                          ],
                                                                                        );
                                                                                      },
                                                                                    ) ??
                                                                                    false;
                                                                                if (confirmDialogResponse) {
                                                                                  final usersUpdateData = {
                                                                                    'users_acts': FieldValue.arrayRemove([
                                                                                      useractlistItem
                                                                                    ]),
                                                                                  };
                                                                                  await tabBarUsersRecord!.reference.update(usersUpdateData);
                                                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                                                    SnackBar(
                                                                                      content: Text(
                                                                                        'تم إلغاء تسجيلك بنجاح!',
                                                                                        style: TextStyle(
                                                                                          color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                          fontWeight: FontWeight.bold,
                                                                                        ),
                                                                                      ),
                                                                                      duration: Duration(milliseconds: 4000),
                                                                                      backgroundColor: Color(0xE15BD85B),
                                                                                    ),
                                                                                  );
                                                                                }
                                                                              }
                                                                            },
                                                                            text:
                                                                                'إلغاء التسجيل',
                                                                            options:
                                                                                FFButtonOptions(
                                                                              width: 130,
                                                                              height: 30,
                                                                              color: Color(0xE1FF2323),
                                                                              textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                    fontFamily: 'Poppins',
                                                                                    color: Colors.white,
                                                                                  ),
                                                                              borderSide: BorderSide(
                                                                                color: Colors.transparent,
                                                                                width: 1,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          4,
                                                                          0,
                                                                          0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      if (getCurrentTimestamp >=
                                                                          columnExtraActsRecord!
                                                                              .edate!)
                                                                        Expanded(
                                                                          child:
                                                                              FFButtonWidget(
                                                                            onPressed:
                                                                                () async {
                                                                              await showModalBottomSheet(
                                                                                isScrollControlled: true,
                                                                                context: context,
                                                                                builder: (context) {
                                                                                  return Padding(
                                                                                    padding: MediaQuery.of(context).viewInsets,
                                                                                    child: Container(
                                                                                      height: 500,
                                                                                      child: RatecollectionWidget(
                                                                                        ratingactID: columnExtraActsRecord!.actID,
                                                                                        ratingtype: columnExtraActsRecord!.actType,
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              ).then((value) => setState(() {}));
                                                                            },
                                                                            text:
                                                                                'قيمي النشاط',
                                                                            options:
                                                                                FFButtonOptions(
                                                                              width: 130,
                                                                              height: 30,
                                                                              color: Color(0xFF1C8EC1),
                                                                              textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                    fontFamily: 'Poppins',
                                                                                    color: Colors.white,
                                                                                  ),
                                                                              borderSide: BorderSide(
                                                                                color: Colors.transparent,
                                                                                width: 1,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    if (tabBarUsersRecord!.type == 'admin')
                                      StreamBuilder<List<ExtraActsRecord>>(
                                        stream: queryExtraActsRecord(
                                          queryBuilder: (extraActsRecord) =>
                                              extraActsRecord.where(
                                                  'Act_provider',
                                                  isEqualTo: currentUserEmail),
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
                                                  color: Color(0xFF0184BD),
                                                ),
                                              ),
                                            );
                                          }
                                          List<ExtraActsRecord>
                                              listViewExtraActsRecordList =
                                              snapshot.data!;
                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            primary: false,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount:
                                                listViewExtraActsRecordList
                                                    .length,
                                            itemBuilder:
                                                (context, listViewIndex) {
                                              final listViewExtraActsRecord =
                                                  listViewExtraActsRecordList[
                                                      listViewIndex];
                                              return Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(16, 12, 16, 0),
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 3,
                                                        color:
                                                            Color(0x25000000),
                                                        offset: Offset(0, 2),
                                                      )
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(12,
                                                                    12, 16, 12),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              listViewExtraActsRecord
                                                                  .actName!,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .title2
                                                                  .override(
                                                                    fontFamily:
                                                                        'Outfit',
                                                                    color: Color(
                                                                        0xFF101213),
                                                                    fontSize:
                                                                        22,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          4,
                                                                          0,
                                                                          0),
                                                              child: Text(
                                                                currentUserEmail,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText2
                                                                    .override(
                                                                      fontFamily:
                                                                          'Outfit',
                                                                      color: Color(
                                                                          0xFF57636C),
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          4,
                                                                          0,
                                                                          0),
                                                              child: Text(
                                                                listViewExtraActsRecord
                                                                    .status!,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Outfit',
                                                                      color: Color(
                                                                          0xFF4B39EF),
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(160,
                                                                    0, 0, 0),
                                                        child:
                                                            FlutterFlowIconButton(
                                                          borderColor: Colors
                                                              .transparent,
                                                          borderRadius: 10,
                                                          borderWidth: 1,
                                                          buttonSize: 40,
                                                          icon: Icon(
                                                            Icons.edit_outlined,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryColor,
                                                            size: 25,
                                                          ),
                                                          onPressed: () async {
                                                            await showModalBottomSheet(
                                                              isScrollControlled:
                                                                  true,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              enableDrag: false,
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return Padding(
                                                                  padding: MediaQuery.of(
                                                                          context)
                                                                      .viewInsets,
                                                                  child:
                                                                      EditActWidget(
                                                                    actname:
                                                                        listViewExtraActsRecord
                                                                            .actName,
                                                                  ),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                setState(
                                                                    () {}));
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
