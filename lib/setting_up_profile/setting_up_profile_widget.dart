import '/auth/auth_util.dart';
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
import 'setting_up_profile_model.dart';
export 'setting_up_profile_model.dart';

class SettingUpProfileWidget extends StatefulWidget {
  const SettingUpProfileWidget({Key? key}) : super(key: key);

  @override
  _SettingUpProfileWidgetState createState() => _SettingUpProfileWidgetState();
}

class _SettingUpProfileWidgetState extends State<SettingUpProfileWidget> {
  late SettingUpProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SettingUpProfileModel());

    _model.nameController ??= TextEditingController();
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
        backgroundColor: Colors.white,
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
                    flex: 3,
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
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 25.0, 0.0, 0.0),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset(
                                  'assets/images/2logo.JPG',
                                  width: 190.0,
                                  fit: BoxFit.cover,
                                ),
                                SelectionArea(
                                    child: Text(
                                  '!اهلًا ِبك',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF0184BD),
                                        fontSize: 24.0,
                                      ),
                                )),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 10.0),
                                  child: SelectionArea(
                                      child: Text(
                                    'ساعدنا بالتعرف عليك بشكلٍ أفضل',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: Color(0xFF0184BD),
                                          fontSize: 20.0,
                                        ),
                                  )),
                                ),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.41,
                                  decoration: BoxDecoration(
                                    color: Color(0x6CE1D7C6),
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 30.0, 20.0, 15.0),
                                        child: Container(
                                          width: 300.0,
                                          child: TextFormField(
                                            controller: _model.nameController,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              hintText: 'الأسم',
                                              hintStyle: GoogleFonts.getFont(
                                                'Open Sans',
                                                color: Color(0xFF565656),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
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
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
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
                                              color: Color(0xFF7EAEBD),
                                            ),
                                            textAlign: TextAlign.start,
                                            validator: _model
                                                .nameControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 15.0, 20.0, 15.0),
                                        child: FlutterFlowDropDown<String>(
                                          controller: _model
                                                  .collegeController ??=
                                              FormFieldController<String>(null),
                                          options: [
                                            'كلية الآداب',
                                            'كلية التربية',
                                            'كلية اللغات والترجمة',
                                            'كلية الهندسة',
                                            'كلية العلوم',
                                            'كلية علوم الحاسب والمعلومات',
                                            'كلية العمارة والتخطيط',
                                            'كلية إدارة الأعمال',
                                            'كلية الطب',
                                            'كلية طب الأسنان',
                                            'كلية الصيدلة',
                                            'كلية العلوم الطبية التطبيقية',
                                            'كلية التمريض'
                                          ],
                                          onChanged: (val) => setState(
                                              () => _model.collegeValue = val),
                                          width: 300.0,
                                          height: 50.0,
                                          textStyle: GoogleFonts.getFont(
                                            'Open Sans',
                                            color: Color(0xFF565656),
                                          ),
                                          hintText: 'الكلية ',
                                          fillColor: Color(0xFFE1D7C6),
                                          elevation: 2.0,
                                          borderColor: Colors.transparent,
                                          borderWidth: 0.0,
                                          borderRadius: 25.0,
                                          margin:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 4.0, 12.0, 4.0),
                                          hidesUnderline: true,
                                          isSearchable: false,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 15.0, 20.0, 15.0),
                                        child: FlutterFlowDropDown<String>(
                                          controller: _model.levelController ??=
                                              FormFieldController<String>(null),
                                          options: [
                                            'المستوى الأول',
                                            'المستوى الثاني',
                                            'المستوى الثالث',
                                            'المستوى الرابع',
                                            'المستوى الخامس',
                                            'المستوى السادس',
                                            'المستوى السابع',
                                            'المستوى الثامن',
                                            'المستوى التاسع',
                                            'المستوى العاشر',
                                            'المستوى الحادي عشر',
                                            'المستوى الثاني عشر'
                                          ],
                                          onChanged: (val) => setState(
                                              () => _model.levelValue = val),
                                          width: 300.0,
                                          height: 50.0,
                                          textStyle: GoogleFonts.getFont(
                                            'Open Sans',
                                            color: Color(0xFF565656),
                                          ),
                                          hintText: 'المستوى ',
                                          fillColor: Color(0xFFE1D7C6),
                                          elevation: 2.0,
                                          borderColor: Colors.transparent,
                                          borderWidth: 0.0,
                                          borderRadius: 25.0,
                                          margin:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 4.0, 12.0, 4.0),
                                          hidesUnderline: true,
                                          isSearchable: false,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 15.0, 20.0, 30.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            final usersUpdateData =
                                                createUsersRecordData(
                                              displayName:
                                                  _model.nameController.text,
                                              college: _model.collegeValue,
                                              level: _model.levelValue,
                                              type: 'student',
                                            );
                                            await currentUserReference!
                                                .update(usersUpdateData);

                                            context.goNamed(
                                              'Settinginterests2',
                                              extra: <String, dynamic>{
                                                kTransitionInfoKey:
                                                    TransitionInfo(
                                                  hasTransition: true,
                                                  transitionType:
                                                      PageTransitionType.fade,
                                                ),
                                              },
                                            );
                                          },
                                          text: 'التالي',
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
                                ),
                              ],
                            ),
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
