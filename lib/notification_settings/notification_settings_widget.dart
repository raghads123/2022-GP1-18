import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'notification_settings_model.dart';
export 'notification_settings_model.dart';

class NotificationSettingsWidget extends StatefulWidget {
  const NotificationSettingsWidget({Key? key}) : super(key: key);

  @override
  _NotificationSettingsWidgetState createState() =>
      _NotificationSettingsWidgetState();
}

class _NotificationSettingsWidgetState
    extends State<NotificationSettingsWidget> {
  late NotificationSettingsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationSettingsModel());
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<CategoryRecord>>(
      stream: queryCategoryRecord(),
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
        List<CategoryRecord> notificationSettingsCategoryRecordList =
            snapshot.data!;
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, -1.0),
                  child: Image.asset(
                    'assets/images/40vyp_1.JPG',
                    width: double.infinity,
                    height: 250.0,
                    fit: BoxFit.cover,
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 180.0, 0.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: Color(0xFFF4F3F0),
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: SingleChildScrollView(
                              primary: false,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/images/2logo.JPG',
                                    width: 190.0,
                                    fit: BoxFit.cover,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 15.0),
                                    child: SelectionArea(
                                        child: Text(
                                      'حدد الإشعارات التي تريد تلقيها',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: Color(0xFF0184BD),
                                            fontSize: 20.0,
                                          ),
                                    )),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 0.0, 20.0, 0.0),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Color(0x6CE1D7C6),
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                      ),
                                      child:
                                          StreamBuilder<List<CategoryRecord>>(
                                        stream: queryCategoryRecord(
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
                                          List<CategoryRecord>
                                              columnCategoryRecordList =
                                              snapshot.data!;
                                          // Return an empty Container when the item does not exist.
                                          if (snapshot.data!.isEmpty) {
                                            return Container();
                                          }
                                          final columnCategoryRecord =
                                              columnCategoryRecordList
                                                      .isNotEmpty
                                                  ? columnCategoryRecordList
                                                      .first
                                                  : null;
                                          return SingleChildScrollView(
                                            primary: false,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(20.0, 30.0,
                                                          20.0, 15.0),
                                                  child: StreamBuilder<
                                                      List<NotifyRecord>>(
                                                    stream: queryNotifyRecord(
                                                      queryBuilder: (notifyRecord) =>
                                                          notifyRecord.where(
                                                              'act_ID',
                                                              isEqualTo:
                                                                  'all activities'),
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
                                                                .switchListTileValue1 ??=
                                                            false,
                                                        onChanged:
                                                            (newValue) async {
                                                          setState(() => _model
                                                                  .switchListTileValue1 =
                                                              newValue!);
                                                          if (newValue!) {
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
                                                            final notifyUpdateData =
                                                                {
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
                                                          'أشعرني عن جميع الأنشطة',
                                                          style: GoogleFonts
                                                              .getFont(
                                                            'Open Sans',
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 18.0,
                                                          ),
                                                        ),
                                                        subtitle: Text(
                                                          'سيتم إشعارك في حال تمت إضافة أي نشاط جديد',
                                                          style: GoogleFonts
                                                              .getFont(
                                                            'Open Sans',
                                                          ),
                                                        ),
                                                        tileColor:
                                                            Color(0xFFFFFAF1),
                                                        dense: false,
                                                        controlAffinity:
                                                            ListTileControlAffinity
                                                                .trailing,
                                                      );
                                                    },
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(20.0, 30.0,
                                                          20.0, 15.0),
                                                  child: StreamBuilder<
                                                      List<NotifyRecord>>(
                                                    stream: queryNotifyRecord(
                                                      queryBuilder: (notifyRecord) =>
                                                          notifyRecord.where(
                                                              'act_ID',
                                                              isEqualTo:
                                                                  'all opportunities'),
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
                                                                .switchListTileValue2 ??=
                                                            false,
                                                        onChanged:
                                                            (newValue) async {
                                                          setState(() => _model
                                                                  .switchListTileValue2 =
                                                              newValue!);
                                                          if (newValue!) {
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
                                                            final notifyUpdateData =
                                                                {
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
                                                          'أشعرني عن جميع الفرص',
                                                          style: GoogleFonts
                                                              .getFont(
                                                            'Open Sans',
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 18.0,
                                                          ),
                                                        ),
                                                        subtitle: Text(
                                                          'سيتم إشعارك في حال تمت إضافة أي فرصة تطوعية جديدة ',
                                                          style: GoogleFonts
                                                              .getFont(
                                                            'Open Sans',
                                                          ),
                                                        ),
                                                        tileColor:
                                                            Color(0xFFFFFAF1),
                                                        dense: false,
                                                        controlAffinity:
                                                            ListTileControlAffinity
                                                                .trailing,
                                                      );
                                                    },
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(20.0, 15.0,
                                                          20.0, 30.0),
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      context.goNamed(
                                                        'HomePage',
                                                        extra: <String,
                                                            dynamic>{
                                                          kTransitionInfoKey:
                                                              TransitionInfo(
                                                            hasTransition: true,
                                                            transitionType:
                                                                PageTransitionType
                                                                    .fade,
                                                          ),
                                                        },
                                                      );
                                                    },
                                                    text: 'إنهاء',
                                                    options: FFButtonOptions(
                                                      width: 300.0,
                                                      height: 50.0,
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color: Color(0xFF7EAEBD),
                                                      textStyle:
                                                          GoogleFonts.getFont(
                                                        'Open Sans',
                                                        color:
                                                            Color(0xFFFFFAF1),
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 18.0,
                                                      ),
                                                      elevation: 2.0,
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 0.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25.0),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
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
  }
}
