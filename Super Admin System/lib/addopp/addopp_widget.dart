import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'addopp_model.dart';
export 'addopp_model.dart';

class AddoppWidget extends StatefulWidget {
  const AddoppWidget({Key? key}) : super(key: key);

  @override
  _AddoppWidgetState createState() => _AddoppWidgetState();
}

class _AddoppWidgetState extends State<AddoppWidget> {
  late AddoppModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddoppModel());

    _model.oppNameController ??= TextEditingController();
    _model.oppskill1Controller ??= TextEditingController();
    _model.oppskill2Controller ??= TextEditingController();
    _model.oppskill3Controller ??= TextEditingController();
    _model.oppskill4Controller ??= TextEditingController();
    _model.oppskill5Controller ??= TextEditingController();
    _model.oppdesController ??= TextEditingController();
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

    return StreamBuilder<List<NotifyRecord>>(
      stream: queryNotifyRecord(
        queryBuilder: (notifyRecord) =>
            notifyRecord.where('act_ID', isEqualTo: 'all opportunities'),
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
        List<NotifyRecord> addoppNotifyRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final addoppNotifyRecord = addoppNotifyRecordList.isNotEmpty
            ? addoppNotifyRecordList.first
            : null;
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Scaffold(
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
                  Icons.chevron_left_rounded,
                  color: Color(0xFF7EAEBD),
                  size: 30.0,
                ),
                onPressed: () async {
                  context.goNamed('HomePage');
                },
              ),
              title: Text(
                ' إضافة فرصة جديدة',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Poppins',
                      color: Color(0xFF7EAEBD),
                      fontSize: 22.0,
                    ),
              ),
              actions: [],
              centerTitle: true,
              elevation: 2.0,
            ),
            body: Container(
              width: double.infinity,
              child: Form(
                key: _model.formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBtnText,
                    borderRadius: BorderRadius.circular(9.0),
                  ),
                  child: SingleChildScrollView(
                    primary: false,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 30.0, 20.0, 15.0),
                          child: Container(
                            width: double.infinity,
                            child: TextFormField(
                              controller: _model.oppNameController,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'اسم الفرصة',
                                labelStyle: GoogleFonts.getFont(
                                  'Open Sans',
                                  color: Color(0xFF565656),
                                  fontWeight: FontWeight.normal,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFE1D7C6),
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFB72F31),
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFB72F31),
                                    width: 2.0,
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
                              textAlign: TextAlign.start,
                              validator: _model.oppNameControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 5.0),
                          child: Container(
                            width: double.infinity,
                            child: TextFormField(
                              controller: _model.oppskill1Controller,
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.oppskill1Controller',
                                Duration(milliseconds: 2000),
                                () => setState(() {}),
                              ),
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'الوظيفة المطلوبة',
                                labelStyle: GoogleFonts.getFont(
                                  'Open Sans',
                                  color: Color(0xFF565656),
                                  fontWeight: FontWeight.normal,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFE1D7C6),
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFB72F31),
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFB72F31),
                                    width: 2.0,
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
                              textAlign: TextAlign.start,
                              maxLines: null,
                              keyboardType: TextInputType.multiline,
                              validator: _model.oppskill1ControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                        if (FFAppState().numskills.contains('1'))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 20.0, 5.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Container(
                                    width: double.infinity,
                                    child: TextFormField(
                                      controller: _model.oppskill2Controller,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.oppskill2Controller',
                                        Duration(milliseconds: 2000),
                                        () => setState(() {}),
                                      ),
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'الوظيفة المطلوبة',
                                        labelStyle: GoogleFonts.getFont(
                                          'Open Sans',
                                          color: Color(0xFF565656),
                                          fontWeight: FontWeight.normal,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFFE1D7C6),
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                        ),
                                        filled: true,
                                        fillColor: Color(0xFFE1D7C6),
                                      ),
                                      style: GoogleFonts.getFont(
                                        'Open Sans',
                                        color: Color(0xFF565656),
                                        fontWeight: FontWeight.normal,
                                      ),
                                      textAlign: TextAlign.start,
                                      maxLines: null,
                                      keyboardType: TextInputType.multiline,
                                      validator: _model
                                          .oppskill2ControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5.0, 0.0, 0.0, 0.0),
                                  child: InkWell(
                                    onTap: () async {
                                      setState(() {
                                        FFAppState().removeFromNumskills('1');
                                      });
                                      setState(() {
                                        _model.oppskill2Controller?.clear();
                                      });
                                    },
                                    child: Icon(
                                      Icons.clear_rounded,
                                      color: Color(0xFF57636C),
                                      size: 20.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        if (FFAppState().numskills.contains('2'))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 20.0, 5.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    controller: _model.oppskill3Controller,
                                    onChanged: (_) => EasyDebounce.debounce(
                                      '_model.oppskill3Controller',
                                      Duration(milliseconds: 2000),
                                      () => setState(() {}),
                                    ),
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'الوظيفة المطلوبة',
                                      labelStyle: GoogleFonts.getFont(
                                        'Open Sans',
                                        color: Color(0xFF565656),
                                        fontWeight: FontWeight.normal,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFE1D7C6),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                      ),
                                      filled: true,
                                      fillColor: Color(0xFFE1D7C6),
                                    ),
                                    style: GoogleFonts.getFont(
                                      'Open Sans',
                                      color: Color(0xFF565656),
                                      fontWeight: FontWeight.normal,
                                    ),
                                    textAlign: TextAlign.start,
                                    maxLines: null,
                                    keyboardType: TextInputType.multiline,
                                    validator: _model
                                        .oppskill3ControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5.0, 0.0, 0.0, 0.0),
                                  child: InkWell(
                                    onTap: () async {
                                      setState(() {
                                        FFAppState().removeFromNumskills('2');
                                      });
                                      setState(() {
                                        _model.oppskill3Controller?.clear();
                                      });
                                    },
                                    child: Icon(
                                      Icons.clear_rounded,
                                      color: Color(0xFF57636C),
                                      size: 20.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        if (FFAppState().numskills.contains('3'))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 20.0, 5.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Container(
                                    width: double.infinity,
                                    child: TextFormField(
                                      controller: _model.oppskill4Controller,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.oppskill4Controller',
                                        Duration(milliseconds: 2000),
                                        () => setState(() {}),
                                      ),
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'الوظيفة المطلوبة',
                                        labelStyle: GoogleFonts.getFont(
                                          'Open Sans',
                                          color: Color(0xFF565656),
                                          fontWeight: FontWeight.normal,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFFE1D7C6),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                        ),
                                        filled: true,
                                        fillColor: Color(0xFFE1D7C6),
                                      ),
                                      style: GoogleFonts.getFont(
                                        'Open Sans',
                                        color: Color(0xFF565656),
                                        fontWeight: FontWeight.normal,
                                      ),
                                      textAlign: TextAlign.start,
                                      maxLines: null,
                                      keyboardType: TextInputType.multiline,
                                      validator: _model
                                          .oppskill4ControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5.0, 0.0, 0.0, 0.0),
                                  child: InkWell(
                                    onTap: () async {
                                      setState(() {
                                        FFAppState().removeFromNumskills('3');
                                      });
                                      setState(() {
                                        _model.oppskill4Controller?.clear();
                                      });
                                    },
                                    child: Icon(
                                      Icons.clear_rounded,
                                      color: Color(0xFF57636C),
                                      size: 20.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        if (FFAppState().numskills.contains('4'))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 20.0, 5.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    controller: _model.oppskill5Controller,
                                    onChanged: (_) => EasyDebounce.debounce(
                                      '_model.oppskill5Controller',
                                      Duration(milliseconds: 2000),
                                      () => setState(() {}),
                                    ),
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'الوظيفة المطلوبة',
                                      labelStyle: GoogleFonts.getFont(
                                        'Open Sans',
                                        color: Color(0xFF565656),
                                        fontWeight: FontWeight.normal,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFE1D7C6),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                      ),
                                      filled: true,
                                      fillColor: Color(0xFFE1D7C6),
                                    ),
                                    style: GoogleFonts.getFont(
                                      'Open Sans',
                                      color: Color(0xFF565656),
                                      fontWeight: FontWeight.normal,
                                    ),
                                    textAlign: TextAlign.start,
                                    maxLines: null,
                                    keyboardType: TextInputType.multiline,
                                    validator: _model
                                        .oppskill5ControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5.0, 0.0, 0.0, 0.0),
                                  child: InkWell(
                                    onTap: () async {
                                      setState(() {
                                        FFAppState().removeFromNumskills('4');
                                      });
                                      setState(() {
                                        _model.oppskill5Controller?.clear();
                                      });
                                    },
                                    child: Icon(
                                      Icons.clear_rounded,
                                      color: Color(0xFF57636C),
                                      size: 20.0,
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
                              FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 25.0,
                                borderWidth: 0.0,
                                buttonSize: 35.0,
                                disabledIconColor: Color(0xFF57636C),
                                icon: Icon(
                                  Icons.add_circle_outline_rounded,
                                  color: Color(0xFF7EAEBD),
                                  size: 20.0,
                                ),
                                onPressed: FFAppState().numskills.length == 4
                                    ? null
                                    : () async {
                                        if (FFAppState()
                                            .numskills
                                            .contains('1')) {
                                          if (FFAppState()
                                              .numskills
                                              .contains('2')) {
                                            if (FFAppState()
                                                .numskills
                                                .contains('3')) {
                                              if (FFAppState()
                                                  .numskills
                                                  .contains('4')) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'لا يمكنك طلب أكثر من ٥ وظائف',
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xE1FFFFFF),
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    duration: Duration(
                                                        milliseconds: 4000),
                                                    backgroundColor:
                                                        Color(0xE1FF2323),
                                                  ),
                                                );
                                              } else {
                                                setState(() {
                                                  FFAppState()
                                                      .addToNumskills('4');
                                                });
                                              }
                                            } else {
                                              setState(() {
                                                FFAppState()
                                                    .addToNumskills('3');
                                              });
                                            }
                                          } else {
                                            setState(() {
                                              FFAppState().addToNumskills('2');
                                            });
                                          }
                                        } else {
                                          setState(() {
                                            FFAppState().addToNumskills('1');
                                          });
                                        }
                                      },
                              ),
                              Text(
                                'إضافة حقل',
                                style: GoogleFonts.getFont(
                                  'Open Sans',
                                  color: Color(0xFF7EAEBD),
                                  fontSize: 16.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 15.0),
                          child: Container(
                            width: double.infinity,
                            child: TextFormField(
                              controller: _model.oppdesController,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'وصف الفرصة',
                                labelStyle: GoogleFonts.getFont(
                                  'Open Sans',
                                  color: Color(0xFF565656),
                                  fontWeight: FontWeight.normal,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFE1D7C6),
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFB72F31),
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFB72F31),
                                    width: 2.0,
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
                              textAlign: TextAlign.start,
                              maxLines: 4,
                              keyboardType: TextInputType.multiline,
                              validator: _model.oppdesControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 15.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.44,
                                  height: 51.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFE1D7C6),
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 4.0,
                                        color: Color(0x33000000),
                                        offset: Offset(0.0, 2.0),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(25.0),
                                    border: Border.all(
                                      color: Color(0xFFE1D7C6),
                                      width: 2.0,
                                    ),
                                  ),
                                  child: InkWell(
                                    onTap: () async {
                                      final _datePicked1Date =
                                          await showDatePicker(
                                        context: context,
                                        initialDate: getCurrentTimestamp,
                                        firstDate: getCurrentTimestamp,
                                        lastDate: DateTime(2050),
                                      );

                                      TimeOfDay? _datePicked1Time;
                                      if (_datePicked1Date != null) {
                                        _datePicked1Time = await showTimePicker(
                                          context: context,
                                          initialTime: TimeOfDay.fromDateTime(
                                              getCurrentTimestamp),
                                        );
                                      }

                                      if (_datePicked1Date != null &&
                                          _datePicked1Time != null) {
                                        setState(() {
                                          _model.datePicked1 = DateTime(
                                            _datePicked1Date.year,
                                            _datePicked1Date.month,
                                            _datePicked1Date.day,
                                            _datePicked1Time!.hour,
                                            _datePicked1Time.minute,
                                          );
                                        });
                                      }
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.date_range_outlined,
                                          color: Color(0xFF57636C),
                                          size: 24.0,
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            'بداية الفرصة',
                                            style: GoogleFonts.getFont(
                                              'Open Sans',
                                              color: Color(0xFF565656),
                                              fontWeight: FontWeight.normal,
                                              fontSize: 16.0,
                                            ),
                                          ),
                                        ),
                                        if (_model.datePicked1 != null)
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              dateTimeFormat(
                                                'M/d h:mm a',
                                                _model.datePicked1,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              ),
                                              style: GoogleFonts.getFont(
                                                'Open Sans',
                                                color: Color(0xFF7EAEBD),
                                                fontWeight: FontWeight.normal,
                                                fontSize: 16.0,
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.44,
                                  height: 51.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFE1D7C6),
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 4.0,
                                        color: Color(0x33000000),
                                        offset: Offset(0.0, 2.0),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(25.0),
                                    border: Border.all(
                                      color: Color(0xFFE1D7C6),
                                      width: 2.0,
                                    ),
                                  ),
                                  child: InkWell(
                                    onTap: () async {
                                      final _datePicked2Date =
                                          await showDatePicker(
                                        context: context,
                                        initialDate: getCurrentTimestamp,
                                        firstDate: getCurrentTimestamp,
                                        lastDate: DateTime(2050),
                                      );

                                      TimeOfDay? _datePicked2Time;
                                      if (_datePicked2Date != null) {
                                        _datePicked2Time = await showTimePicker(
                                          context: context,
                                          initialTime: TimeOfDay.fromDateTime(
                                              getCurrentTimestamp),
                                        );
                                      }

                                      if (_datePicked2Date != null &&
                                          _datePicked2Time != null) {
                                        setState(() {
                                          _model.datePicked2 = DateTime(
                                            _datePicked2Date.year,
                                            _datePicked2Date.month,
                                            _datePicked2Date.day,
                                            _datePicked2Time!.hour,
                                            _datePicked2Time.minute,
                                          );
                                        });
                                      }
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.date_range_outlined,
                                          color: Color(0xFF57636C),
                                          size: 24.0,
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            'نهاية الفرصة',
                                            style: GoogleFonts.getFont(
                                              'Open Sans',
                                              color: Color(0xFF565656),
                                              fontWeight: FontWeight.normal,
                                              fontSize: 16.0,
                                            ),
                                          ),
                                        ),
                                        if (_model.datePicked2 != null)
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              dateTimeFormat(
                                                'M/d h:mm a',
                                                _model.datePicked2,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              ),
                                              style: GoogleFonts.getFont(
                                                'Open Sans',
                                                color: Color(0xFF7EAEBD),
                                                fontWeight: FontWeight.normal,
                                                fontSize: 16.0,
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.44,
                                  height: 51.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFE1D7C6),
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 4.0,
                                        color: Color(0x33000000),
                                        offset: Offset(0.0, 2.0),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(25.0),
                                    border: Border.all(
                                      color: Color(0xFFE1D7C6),
                                      width: 2.0,
                                    ),
                                  ),
                                  child: InkWell(
                                    onTap: () async {
                                      final _datePicked3Date =
                                          await showDatePicker(
                                        context: context,
                                        initialDate: getCurrentTimestamp,
                                        firstDate: getCurrentTimestamp,
                                        lastDate: DateTime(2050),
                                      );

                                      TimeOfDay? _datePicked3Time;
                                      if (_datePicked3Date != null) {
                                        _datePicked3Time = await showTimePicker(
                                          context: context,
                                          initialTime: TimeOfDay.fromDateTime(
                                              getCurrentTimestamp),
                                        );
                                      }

                                      if (_datePicked3Date != null &&
                                          _datePicked3Time != null) {
                                        setState(() {
                                          _model.datePicked3 = DateTime(
                                            _datePicked3Date.year,
                                            _datePicked3Date.month,
                                            _datePicked3Date.day,
                                            _datePicked3Time!.hour,
                                            _datePicked3Time.minute,
                                          );
                                        });
                                      }
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.date_range_outlined,
                                          color: Color(0xFF57636C),
                                          size: 24.0,
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            'نهاية فترة التقديم',
                                            style: GoogleFonts.getFont(
                                              'Open Sans',
                                              color: Color(0xFF565656),
                                              fontWeight: FontWeight.normal,
                                              fontSize: 16.0,
                                            ),
                                          ),
                                        ),
                                        if (_model.datePicked3 != null)
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              dateTimeFormat(
                                                'M/d h:mm a',
                                                _model.datePicked3,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              ),
                                              style: GoogleFonts.getFont(
                                                'Open Sans',
                                                color: Color(0xFF7EAEBD),
                                                fontWeight: FontWeight.normal,
                                                fontSize: 16.0,
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 30.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              setState(() {
                                FFAppState().addToSkilllist(
                                    _model.oppskill1Controller.text);
                              });
                              if (_model.oppskill2Controller.text != null &&
                                  _model.oppskill2Controller.text != '') {
                                setState(() {
                                  FFAppState().addToSkilllist(
                                      _model.oppskill2Controller.text);
                                });
                              }
                              if (_model.oppskill3Controller.text != null &&
                                  _model.oppskill3Controller.text != '') {
                                setState(() {
                                  FFAppState().addToSkilllist(
                                      _model.oppskill3Controller.text);
                                });
                              }
                              if (_model.oppskill4Controller.text != null &&
                                  _model.oppskill4Controller.text != '') {
                                setState(() {
                                  FFAppState().addToSkilllist(
                                      _model.oppskill4Controller.text);
                                });
                              }
                              if (_model.oppskill5Controller.text != null &&
                                  _model.oppskill5Controller.text != '') {
                                setState(() {
                                  FFAppState().addToSkilllist(
                                      _model.oppskill5Controller.text);
                                });
                              }
                              if (_model.formKey.currentState == null ||
                                  !_model.formKey.currentState!.validate()) {
                                return;
                              }
                              if (_model.datePicked1 == null) {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title:
                                          Text('يجب تحديد تاريخ بداية الفرصة'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
                                          child: Text('تم'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                                return;
                              }
                              if (_model.datePicked2 == null) {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title:
                                          Text('يجب تحديد تاريخ نهاية الفرصة'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
                                          child: Text('تم'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                                return;
                              }
                              if (_model.datePicked3 == null) {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text(
                                          'يجب تحديد تاريخ نهاية فترة التقديم'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
                                          child: Text('تم'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                                return;
                              }

                              final opportunitiesCreateData = {
                                ...createOpportunitiesRecordData(
                                  opDesc: _model.oppdesController.text,
                                  sdate: _model.datePicked1,
                                  edate: _model.datePicked2,
                                  opProvider: currentUserDisplayName,
                                  opProviderLogo: currentUserPhoto,
                                  oppName: _model.oppNameController.text,
                                  status: 'موافق عليها',
                                  opID: random_data.randomString(
                                    20,
                                    20,
                                    true,
                                    true,
                                    true,
                                  ),
                                  opProviderEmail: currentUserEmail,
                                  lastD2apply: _model.datePicked3,
                                ),
                                'OpSkills': FFAppState().skilllist,
                              };
                              await OpportunitiesRecord.collection
                                  .doc()
                                  .set(opportunitiesCreateData);
                              FFAppState().numskills = [];
                              FFAppState().skilllist = [];
                              triggerPushNotification(
                                notificationTitle: 'تمت إضافة فرصة ',
                                notificationText:
                                    'بعنوان ${_model.oppNameController.text}',
                                notificationSound: 'default',
                                userRefs:
                                    addoppNotifyRecord!.multiuser!.toList(),
                                initialPageName: 'HomePage',
                                parameterData: {},
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'تم إضافة الفرصة بنجاح',
                                    style: TextStyle(
                                      color: Color(0xE1FFFFFF),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor: Color(0xE15BD85B),
                                ),
                              );

                              context.goNamed(
                                'HomePage',
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: TransitionInfo(
                                    hasTransition: true,
                                    transitionType:
                                        PageTransitionType.rightToLeft,
                                  ),
                                },
                              );
                            },
                            text: 'الإضافة',
                            options: FFButtonOptions(
                              width: double.infinity,
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
                                    fontSize: 18.0,
                                  ),
                              elevation: 2.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
