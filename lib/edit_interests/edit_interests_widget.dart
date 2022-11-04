import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class EditInterestsWidget extends StatefulWidget {
  const EditInterestsWidget({Key? key}) : super(key: key);

  @override
  _EditInterestsWidgetState createState() => _EditInterestsWidgetState();
}

class _EditInterestsWidgetState extends State<EditInterestsWidget>
    with TickerProviderStateMixin {
  Map<CategoryRecord, bool> checkboxListTileValueMap = {};
  List<CategoryRecord> get checkboxListTileCheckedItems =>
      checkboxListTileValueMap.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<CategoryRecord>>(
      stream: queryCategoryRecord(),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.of(context).primaryColor,
              ),
            ),
          );
        }
        List<CategoryRecord> editInterestsCategoryRecordList = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).alternate,
            automaticallyImplyLeading: false,
            title: Align(
              alignment: AlignmentDirectional(0.35, 0),
              child: Text(
                'إهتماماتك',
                textAlign: TextAlign.end,
                style: FlutterFlowTheme.of(context).title1.override(
                      fontFamily: 'Poppins',
                      color: FlutterFlowTheme.of(context).primaryBtnText,
                    ),
              ),
            ),
            actions: [
              FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30,
                borderWidth: 1,
                buttonSize: 60,
                icon: Icon(
                  Icons.arrow_forward_rounded,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: () async {
                  context.pushNamed(
                    'Profile',
                    extra: <String, dynamic>{
                      kTransitionInfoKey: TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.rightToLeft,
                      ),
                    },
                  );
                },
              ),
            ],
            centerTitle: false,
            elevation: 0,
          ),
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: SingleChildScrollView(
                primary: false,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                      child: Container(
                        width: double.infinity,
                        height: 120,
                        decoration: BoxDecoration(),
                        child: StreamBuilder<List<UsersRecord>>(
                          stream: queryUsersRecord(
                            queryBuilder: (usersRecord) => usersRecord
                                .where('email', isEqualTo: currentUserEmail),
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
                            List<UsersRecord> stackUsersRecordList =
                                snapshot.data!;
                            // Return an empty Container when the document does not exist.
                            if (snapshot.data!.isEmpty) {
                              return Container();
                            }
                            final stackUsersRecord =
                                stackUsersRecordList.isNotEmpty
                                    ? stackUsersRecordList.first
                                    : null;
                            return Container(
                              height: 160,
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Builder(
                                      builder: (context) {
                                        final intrestslist = stackUsersRecord!
                                            .intrests!
                                            .toList();
                                        return ListView.builder(
                                          padding: EdgeInsets.zero,
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          itemCount: intrestslist.length,
                                          itemBuilder:
                                              (context, intrestslistIndex) {
                                            final intrestslistItem =
                                                intrestslist[intrestslistIndex];
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(10, 0, 0, 0),
                                              child: Container(
                                                width: 200,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 4,
                                                      color: Color(0x1F000000),
                                                      offset: Offset(0, 2),
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 1,
                                                  ),
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 5, 5, 0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1, -0.9),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          0,
                                                                          8),
                                                              child: StreamBuilder<
                                                                  List<
                                                                      UsersRecord>>(
                                                                stream:
                                                                    queryUsersRecord(
                                                                  singleRecord:
                                                                      true,
                                                                ),
                                                                builder: (context,
                                                                    snapshot) {
                                                                  // Customize what your widget looks like when it's loading.
                                                                  if (!snapshot
                                                                      .hasData) {
                                                                    return Center(
                                                                      child:
                                                                          SizedBox(
                                                                        width:
                                                                            50,
                                                                        height:
                                                                            50,
                                                                        child:
                                                                            CircularProgressIndicator(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryColor,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }
                                                                  List<UsersRecord>
                                                                      iconUsersRecordList =
                                                                      snapshot
                                                                          .data!;
                                                                  // Return an empty Container when the document does not exist.
                                                                  if (snapshot
                                                                      .data!
                                                                      .isEmpty) {
                                                                    return Container();
                                                                  }
                                                                  final iconUsersRecord = iconUsersRecordList
                                                                          .isNotEmpty
                                                                      ? iconUsersRecordList
                                                                          .first
                                                                      : null;
                                                                  return InkWell(
                                                                    onTap:
                                                                        () async {
                                                                      final usersUpdateData =
                                                                          {
                                                                        'intrests':
                                                                            FieldValue.arrayRemove([
                                                                          intrestslistItem
                                                                        ]),
                                                                      };
                                                                      await currentUserReference!
                                                                          .update(
                                                                              usersUpdateData);
                                                                    },
                                                                    child: Icon(
                                                                      Icons
                                                                          .cancel,
                                                                      color: Color(
                                                                          0xFFFF5757),
                                                                      size: 30,
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10,
                                                                          0,
                                                                          10,
                                                                          0),
                                                              child:
                                                                  SelectionArea(
                                                                      child:
                                                                          Text(
                                                                intrestslistItem,
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1,
                                                              )),
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
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 8, 8, 8),
                      child: Text(
                        'الإهتمامات',
                        textAlign: TextAlign.end,
                        style: FlutterFlowTheme.of(context).subtitle1.override(
                              fontFamily: 'Poppins',
                              color: Color(0xFF494646),
                            ),
                      ),
                    ),
                    Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 400,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Builder(
                            builder: (context) {
                              final categories =
                                  editInterestsCategoryRecordList.toList();
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: categories.length,
                                itemBuilder: (context, categoriesIndex) {
                                  final categoriesItem =
                                      categories[categoriesIndex];
                                  return Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Theme(
                                      data: ThemeData(
                                        unselectedWidgetColor:
                                            Color(0xFF95A1AC),
                                      ),
                                      child: CheckboxListTile(
                                        value: checkboxListTileValueMap[
                                            categoriesItem] ??= false,
                                        onChanged: (newValue) async {
                                          setState(() =>
                                              checkboxListTileValueMap[
                                                  categoriesItem] = newValue!);
                                          if (newValue!) {
                                            final usersUpdateData = {
                                              'intrests':
                                                  FieldValue.arrayUnion([
                                                checkboxListTileCheckedItems
                                                    .toString()
                                              ]),
                                            };
                                            await currentUserReference!
                                                .update(usersUpdateData);
                                          } else {
                                            final usersUpdateData = {
                                              'intrests':
                                                  FieldValue.arrayRemove([
                                                checkboxListTileCheckedItems
                                                    .toString()
                                              ]),
                                            };
                                            await currentUserReference!
                                                .update(usersUpdateData);
                                          }
                                        },
                                        title: Text(
                                          categoriesItem.name!,
                                          textAlign: TextAlign.end,
                                          style: FlutterFlowTheme.of(context)
                                              .title3
                                              .override(
                                                fontFamily: 'Poppins',
                                                color: Color(0xFF565656),
                                              ),
                                        ),
                                        tileColor: Color(0xFFF5F5F5),
                                        activeColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryColor,
                                        dense: false,
                                        controlAffinity:
                                            ListTileControlAffinity.trailing,
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
