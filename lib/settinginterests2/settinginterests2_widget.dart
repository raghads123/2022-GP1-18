import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'settinginterests2_model.dart';
export 'settinginterests2_model.dart';

class Settinginterests2Widget extends StatefulWidget {
  const Settinginterests2Widget({Key? key}) : super(key: key);

  @override
  _Settinginterests2WidgetState createState() =>
      _Settinginterests2WidgetState();
}

class _Settinginterests2WidgetState extends State<Settinginterests2Widget> {
  late Settinginterests2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Settinginterests2Model());
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
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 180.0, 0.0, 0.0),
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
                                    0.0, 0.0, 0.0, 10.0),
                                child: SelectionArea(
                                    child: Text(
                                  'حدد إهتماماتك',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Open Sans',
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
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
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
                                      List<CategoryRecord>
                                          columnCategoryRecordList =
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 30.0, 55.0, 15.0),
                                              child: FlutterFlowCheckboxGroup(
                                                options: columnCategoryRecord!
                                                    .name!
                                                    .toList(),
                                                onChanged: (val) => setState(() =>
                                                    _model.checkboxGroupValues =
                                                        val),
                                                controller: _model
                                                        .checkboxGroupController ??=
                                                    FormFieldController<
                                                        List<String>>(
                                                  [],
                                                ),
                                                activeColor: Color(0x0095A1AC),
                                                checkColor: Color(0xFF7EAEBD),
                                                checkboxBorderColor:
                                                    Color(0xFF95A1AC),
                                                textStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Open Sans',
                                                      color: Color(0xFF565656),
                                                      fontSize: 20.0,
                                                    ),
                                                labelPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            5.0, 0.0, 0.0, 0.0),
                                                itemPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(0.0, 0.0, 0.0,
                                                            15.0),
                                                checkboxBorderRadius:
                                                    BorderRadius.circular(4.0),
                                                initialized: _model
                                                        .checkboxGroupValues !=
                                                    null,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 15.0, 20.0, 30.0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  final usersUpdateData = {
                                                    'intrests': _model
                                                        .checkboxGroupValues,
                                                  };
                                                  await currentUserReference!
                                                      .update(usersUpdateData);

                                                  context.goNamed(
                                                      'notificationSettings');
                                                },
                                                text: 'التالي',
                                                options: FFButtonOptions(
                                                  width: 300.0,
                                                  height: 50.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: Color(0xFF7EAEBD),
                                                  textStyle:
                                                      GoogleFonts.getFont(
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
  }
}
