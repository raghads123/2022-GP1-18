import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'oppapplicationform_model.dart';
export 'oppapplicationform_model.dart';
import 'dart:ui' as ui;

class OppapplicationformWidget extends StatefulWidget {
  const OppapplicationformWidget({
    Key? key,
    this.oppappform,
    this.oppappemail,
  }) : super(key: key);

  final String? oppappform;
  final String? oppappemail;

  @override
  _OppapplicationformWidgetState createState() =>
      _OppapplicationformWidgetState();
}

class _OppapplicationformWidgetState extends State<OppapplicationformWidget> {
  late OppapplicationformModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OppapplicationformModel());

    _model.userEmailController ??=
        TextEditingController(text: currentUserEmail);
    _model.shortbioController ??= TextEditingController();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<OpportunitiesRecord>>(
      stream: queryOpportunitiesRecord(
        queryBuilder: (opportunitiesRecord) =>
            opportunitiesRecord.where('OpID', isEqualTo: widget.oppappform),
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
        List<OpportunitiesRecord> containerOpportunitiesRecordList =
            snapshot.data!;
        final containerOpportunitiesRecord =
            containerOpportunitiesRecordList.isNotEmpty
                ? containerOpportunitiesRecordList.first
                : null;
        return Material(
          color: Colors.transparent,
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0.0),
              bottomRight: Radius.circular(0.0),
              topLeft: Radius.circular(50.0),
              topRight: Radius.circular(50.0),
            ),
          ),
          child: Container(
            width: double.infinity,
            height: 590.0,
            decoration: BoxDecoration(
              color: Color(0xFFF4F3F0),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0.0),
                bottomRight: Radius.circular(0.0),
                topLeft: Radius.circular(50.0),
                topRight: Radius.circular(50.0),
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
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 15.0, 20.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'الرجاء تعبئة نموذج التقديم أدناه',
                          style: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .override(
                                fontFamily: 'Outfit',
                                color: Color(0xFF7EAEBD),
                                fontSize: 22.0,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                      ],
                    ),
                  ),
                  Form(
                    key: _model.formKey,
                    autovalidateMode: AutovalidateMode.disabled,
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
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 15.0, 20.0, 15.0),
                              child: Container(
                                width: 300.0,
                                child: TextFormField(
                                  controller: _model.userEmailController,
                                  readOnly: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'بريدك الإلكتروني',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: Color(0xFF565656),
                                          fontWeight: FontWeight.normal,
                                        ),
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: Color(0xFF565656),
                                          fontWeight: FontWeight.normal,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(25.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(25.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(25.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(25.0),
                                    ),
                                    filled: true,
                                    fillColor: Color(0xFFE1D7C6),
                                  ),
                                  style: GoogleFonts.getFont(
                                    'Open Sans',
                                    color: Color(0xFF565656),
                                    fontWeight: FontWeight.normal,
                                  ),
                                  textDirection: ui.TextDirection.ltr,
                                  textAlign: TextAlign.start,
                                  validator: _model.userEmailControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 15.0, 20.0, 15.0),
                                child: FlutterFlowDropDown<String>(
                                  controller: _model.skillValueController ??=
                                      FormFieldController<String>(null),
                                  options: containerOpportunitiesRecord!
                                      .opSkills!
                                      .toList()
                                      .toList(),
                                  onChanged: (val) =>
                                      setState(() => _model.skillValue = val),
                                  width: 300.0,
                                  height: 50.0,
                                  textStyle: GoogleFonts.getFont(
                                    'Open Sans',
                                    color: Color(0xFF565656),
                                  ),
                                  hintText: 'حدد الوظيفة للتقديم عليها',
                                  fillColor: Color(0xFFE1D7C6),
                                  elevation: 2.0,
                                  borderColor: Colors.transparent,
                                  borderWidth: 0.0,
                                  borderRadius: 25.0,
                                  margin: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 4.0, 12.0, 4.0),
                                  hidesUnderline: true,
                                  isSearchable: false,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 15.0, 20.0, 15.0),
                              child: Container(
                                width: 300.0,
                                child: TextFormField(
                                  controller: _model.shortbioController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: ' نبذة عنك',
                                    labelStyle:
                                        FlutterFlowTheme.of(context).bodySmall,
                                    hintText:
                                        'نبذة بسيطة عنك (٢٧٠ حرف) تمنحك الافضلية من بين المتقدمين',
                                    hintStyle:
                                        FlutterFlowTheme.of(context).bodySmall,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(25.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(25.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFFB72F31),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(25.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFFB72F31),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(25.0),
                                    ),
                                    filled: true,
                                    fillColor: Color(0xFFE1D7C6),
                                  ),
                                  style: GoogleFonts.getFont(
                                    'Open Sans',
                                    color: Color(0xFF565656),
                                    fontWeight: FontWeight.normal,
                                    fontSize: 16.0,
                                  ),
                                  textAlign: TextAlign.start,
                                  maxLines: 10,
                                  validator: _model.shortbioControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 15.0, 20.0, 30.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  if (_model.formKey.currentState == null ||
                                      !_model.formKey.currentState!
                                          .validate()) {
                                    return;
                                  }
                                  if (_model.skillValue == null) {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title:
                                              Text('يجب تحديد وظيفة للتقديم'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: Text('تم'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                    return;
                                  }

                                  final oppApplicationsCreateData =
                                      createOppApplicationsRecordData(
                                    appEmail: _model.userEmailController.text,
                                    appSkills: _model.skillValue,
                                    appBio: _model.shortbioController.text,
                                    oppName:
                                        containerOpportunitiesRecord!.oppName,
                                    status: 'معلق',
                                    oppproviderEmail: widget.oppappemail,
                                    oppIDDD: widget.oppappform,
                                  );
                                  await OppApplicationsRecord.collection
                                      .doc()
                                      .set(oppApplicationsCreateData);

                                  final usersUpdateData = {
                                    'users_opp': FieldValue.arrayUnion(
                                        [containerOpportunitiesRecord!.opID]),
                                  };
                                  await columnUsersRecord!.reference
                                      .update(usersUpdateData);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'لقد تم تقديمك على هذه الفرصة بنجاح!',
                                        style: TextStyle(
                                          color: Color(0xE1FFFFFF),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor: Color(0xE15BD85B),
                                    ),
                                  );
                                  Navigator.pop(context);
                                },
                                text: 'إرسال',
                                options: FFButtonOptions(
                                  width: 300.0,
                                  height: 50.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: Color(0xFF7EAEBD),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFFF4F3F0),
                                      ),
                                  elevation: 2.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                  ),
                                  borderRadius: BorderRadius.circular(25.0),
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
            ),
          ),
        );
      },
    );
  }
}
