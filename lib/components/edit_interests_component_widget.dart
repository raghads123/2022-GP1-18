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
import 'edit_interests_component_model.dart';
export 'edit_interests_component_model.dart';

class EditInterestsComponentWidget extends StatefulWidget {
  const EditInterestsComponentWidget({Key? key}) : super(key: key);

  @override
  _EditInterestsComponentWidgetState createState() =>
      _EditInterestsComponentWidgetState();
}

class _EditInterestsComponentWidgetState
    extends State<EditInterestsComponentWidget> {
  late EditInterestsComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditInterestsComponentModel());
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
                    Text(
                      'يمكنك تعديل إهتماماتك أدناه',
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
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
                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 30.0, 55.0, 15.0),
                          child: AuthUserStreamWidget(
                            builder: (context) => FlutterFlowCheckboxGroup(
                              options: columnCategoryRecord!.name!.toList(),
                              onChanged: (val) async {
                                setState(
                                    () => _model.checkboxGroupValues = val);
                                final usersUpdateData = {
                                  'intrests': _model.checkboxGroupValues,
                                };
                                await currentUserReference!
                                    .update(usersUpdateData);
                              },
                              controller: _model.checkboxGroupController ??=
                                  FormFieldController<List<String>>(
                                (currentUserDocument?.intrests?.toList() ?? []),
                              ),
                              activeColor: Color(0x0095A1AC),
                              checkColor: Color(0xFF7EAEBD),
                              checkboxBorderColor: Color(0xFF95A1AC),
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Open Sans',
                                    color: Color(0xFF565656),
                                    fontSize: 20.0,
                                  ),
                              labelPadding: EdgeInsetsDirectional.fromSTEB(
                                  5.0, 0.0, 0.0, 0.0),
                              itemPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 15.0),
                              checkboxBorderRadius: BorderRadius.circular(5.0),
                              initialized: _model.checkboxGroupValues != null,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 15.0, 20.0, 30.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'تم تحديث إهتماماتك بنجاح',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBtnText,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor: Color(0xE15BD85B),
                                ),
                              );
                              Navigator.pop(context);
                            },
                            text: 'تم',
                            options: FFButtonOptions(
                              width: 300.0,
                              height: 50.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
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
  }
}
