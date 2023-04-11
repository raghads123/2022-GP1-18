import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'edit_notification_component_model.dart';
export 'edit_notification_component_model.dart';

class EditNotificationComponentWidget extends StatefulWidget {
  const EditNotificationComponentWidget({Key? key}) : super(key: key);

  @override
  _EditNotificationComponentWidgetState createState() =>
      _EditNotificationComponentWidgetState();
}

class _EditNotificationComponentWidgetState
    extends State<EditNotificationComponentWidget> {
  late EditNotificationComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditNotificationComponentModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Material(
      color: Colors.transparent,
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.6,
        decoration: BoxDecoration(
          color: Color(0xFFF4F3F0),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        child: SingleChildScrollView(
          primary: false,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                    child: Container(
                      width: 50.0,
                      height: 4.0,
                      decoration: BoxDecoration(
                        color: Color(0xFFE0E3E7),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 30.0, 20.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Text(
                        'يمكنك تعديل إعدادات الإشعارات أدناه',
                        style: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .override(
                              fontFamily: 'Outfit',
                              color: Color(0xFF7EAEBD),
                              fontSize: 22.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              Form(
                key: _model.formKey,
                autovalidateMode: AutovalidateMode.disabled,
                child: StreamBuilder<List<CategoryRecord>>(
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
                          child: CircularProgressIndicator(
                            color: Color(0xFF0184BD),
                          ),
                        ),
                      );
                    }
                    List<CategoryRecord> columnCategoryRecordList =
                        snapshot.data!;
                    final columnCategoryRecord =
                        columnCategoryRecordList.isNotEmpty
                            ? columnCategoryRecordList.first
                            : null;
                    return SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
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
                                    child: CircularProgressIndicator(
                                      color: Color(0xFF0184BD),
                                    ),
                                  ),
                                );
                              }
                              List<CategoryRecord> columnCategoryRecordList =
                                  snapshot.data!;
                              // Return an empty Container when the item does not exist.
                              if (snapshot.data!.isEmpty) {
                                return Container();
                              }
                              final columnCategoryRecord =
                                  columnCategoryRecordList.isNotEmpty
                                      ? columnCategoryRecordList.first
                                      : null;
                              return SingleChildScrollView(
                                primary: false,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 30.0, 20.0, 15.0),
                                      child: StreamBuilder<List<NotifyRecord>>(
                                        stream: queryNotifyRecord(
                                          queryBuilder: (notifyRecord) =>
                                              notifyRecord.where('act_ID',
                                                  isEqualTo: 'all activities'),
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
                                                switchListTileNotifyRecord!
                                                    .multiuser!
                                                    .toList()
                                                    .contains(
                                                        currentUserReference),
                                            onChanged: (newValue) async {
                                              setState(() =>
                                                  _model.switchListTileValue1 =
                                                      newValue!);
                                              if (newValue!) {
                                                final notifyUpdateData = {
                                                  'multiuser':
                                                      FieldValue.arrayUnion([
                                                    currentUserReference
                                                  ]),
                                                };
                                                await switchListTileNotifyRecord!
                                                    .reference
                                                    .update(notifyUpdateData);
                                              } else {
                                                final notifyUpdateData = {
                                                  'multiuser':
                                                      FieldValue.arrayRemove([
                                                    currentUserReference
                                                  ]),
                                                };
                                                await switchListTileNotifyRecord!
                                                    .reference
                                                    .update(notifyUpdateData);
                                              }
                                            },
                                            title: Text(
                                              'أشعرني عن جميع الأنشطة',
                                              style: GoogleFonts.getFont(
                                                'Open Sans',
                                                fontWeight: FontWeight.w600,
                                                fontSize: 18.0,
                                              ),
                                            ),
                                            subtitle: Text(
                                              'سيتم إشعارك في حال تمت إضافة أي نشاط جديد',
                                              style: GoogleFonts.getFont(
                                                'Open Sans',
                                              ),
                                            ),
                                            tileColor: Color(0xFFFFFAF1),
                                            dense: false,
                                            controlAffinity:
                                                ListTileControlAffinity
                                                    .trailing,
                                          );
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 30.0, 20.0, 15.0),
                                      child: StreamBuilder<List<NotifyRecord>>(
                                        stream: queryNotifyRecord(
                                          queryBuilder: (notifyRecord) =>
                                              notifyRecord.where('act_ID',
                                                  isEqualTo:
                                                      'all opportunities'),
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
                                                switchListTileNotifyRecord!
                                                    .multiuser!
                                                    .toList()
                                                    .contains(
                                                        currentUserReference),
                                            onChanged: (newValue) async {
                                              setState(() =>
                                                  _model.switchListTileValue2 =
                                                      newValue!);
                                              if (newValue!) {
                                                final notifyUpdateData = {
                                                  'multiuser':
                                                      FieldValue.arrayUnion([
                                                    currentUserReference
                                                  ]),
                                                };
                                                await switchListTileNotifyRecord!
                                                    .reference
                                                    .update(notifyUpdateData);
                                              } else {
                                                final notifyUpdateData = {
                                                  'multiuser':
                                                      FieldValue.arrayRemove([
                                                    currentUserReference
                                                  ]),
                                                };
                                                await switchListTileNotifyRecord!
                                                    .reference
                                                    .update(notifyUpdateData);
                                              }
                                            },
                                            title: Text(
                                              'أشعرني عن جميع الفرص',
                                              style: GoogleFonts.getFont(
                                                'Open Sans',
                                                fontWeight: FontWeight.w600,
                                                fontSize: 18.0,
                                              ),
                                            ),
                                            subtitle: Text(
                                              'سيتم إشعارك في حال تمت إضافة أي فرصة تطوعية جديدة ',
                                              style: GoogleFonts.getFont(
                                                'Open Sans',
                                              ),
                                            ),
                                            tileColor: Color(0xFFFFFAF1),
                                            dense: false,
                                            controlAffinity:
                                                ListTileControlAffinity
                                                    .trailing,
                                          );
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 15.0, 20.0, 30.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'تم تحديث إعدادات الإشعارات بنجاح',
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBtnText,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  Color(0xE15BD85B),
                                            ),
                                          );
                                          Navigator.pop(context);
                                        },
                                        text: 'تم',
                                        options: FFButtonOptions(
                                          width: 300.0,
                                          height: 50.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: Color(0xFF7EAEBD),
                                          textStyle: GoogleFonts.getFont(
                                            'Open Sans',
                                            color: Color(0xFFFFFAF1),
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18.0,
                                          ),
                                          elevation: 2.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 0.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
