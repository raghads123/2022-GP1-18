import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ActivityDashWidget extends StatefulWidget {
  const ActivityDashWidget({Key? key}) : super(key: key);

  @override
  _ActivityDashWidgetState createState() => _ActivityDashWidgetState();
}

class _ActivityDashWidgetState extends State<ActivityDashWidget> {
  Completer<List<OpportunitiesRecord>>? _firestoreRequestCompleter;
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
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
                    length: 1,
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
                              text: 'فرص قمت بطرحها  ',
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
                                    FutureBuilder<List<OpportunitiesRecord>>(
                                      future: (_firestoreRequestCompleter ??=
                                              Completer<
                                                  List<OpportunitiesRecord>>()
                                                ..complete(
                                                    queryOpportunitiesRecordOnce(
                                                  queryBuilder:
                                                      (opportunitiesRecord) =>
                                                          opportunitiesRecord
                                                              .whereIn(
                                                                  'oppName',
                                                                  tabBarUsersRecord!
                                                                      .usersOpp!
                                                                      .toList()),
                                                )))
                                          .future,
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
                                        List<OpportunitiesRecord>
                                            listViewOpportunitiesRecordList =
                                            snapshot.data!;
                                        return RefreshIndicator(
                                          onRefresh: () async {
                                            setState(() =>
                                                _firestoreRequestCompleter =
                                                    null);
                                            await waitForFirestoreRequestCompleter();
                                          },
                                          child: ListView.builder(
                                            padding: EdgeInsets.zero,
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
                                              return StreamBuilder<
                                                  List<OppApplicationsRecord>>(
                                                stream:
                                                    queryOppApplicationsRecord(
                                                  queryBuilder: (oppApplicationsRecord) =>
                                                      oppApplicationsRecord.where(
                                                          'oppprovider_email',
                                                          isEqualTo:
                                                              currentUserEmail),
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
                                                  List<OppApplicationsRecord>
                                                      columnOppApplicationsRecordList =
                                                      snapshot.data!;
                                                  // Return an empty Container when the item does not exist.
                                                  if (snapshot.data!.isEmpty) {
                                                    return Container();
                                                  }
                                                  final columnOppApplicationsRecord =
                                                      columnOppApplicationsRecordList
                                                              .isNotEmpty
                                                          ? columnOppApplicationsRecordList
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
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            230,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                        child:
                                                                            Text(
                                                                          listViewOpportunitiesRecord
                                                                              .oppName!,
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
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      InkWell(
                                                                        onTap:
                                                                            () async {
                                                                          context
                                                                              .pushNamed('app_management');
                                                                        },
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .arrow_back_ios,
                                                                          color:
                                                                              Color(0xFFA6A6A6),
                                                                          size:
                                                                              24,
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            180,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                        child: SelectionArea(
                                                                            child: Text(
                                                                          listViewOpportunitiesRecord
                                                                              .opQ!
                                                                              .toString(),
                                                                          style:
                                                                              FlutterFlowTheme.of(context).bodyText1,
                                                                        )),
                                                                      ),
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            -0.1,
                                                                            0),
                                                                        child: SelectionArea(
                                                                            child: Text(
                                                                          'عدد المتقدمين ',
                                                                          textAlign:
                                                                              TextAlign.end,
                                                                          style:
                                                                              FlutterFlowTheme.of(context).subtitle1,
                                                                        )),
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
                                          ),
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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(23, 10, 0, 0),
                child: InkWell(
                  onTap: () async {
                    context.pushNamed('HomePage');
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Color(0xFFA6A6A6),
                    size: 24,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future waitForFirestoreRequestCompleter({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = _firestoreRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
