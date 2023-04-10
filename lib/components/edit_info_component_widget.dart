import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'edit_info_component_model.dart';
export 'edit_info_component_model.dart';

class EditInfoComponentWidget extends StatefulWidget {
  const EditInfoComponentWidget({Key? key}) : super(key: key);

  @override
  _EditInfoComponentWidgetState createState() =>
      _EditInfoComponentWidgetState();
}

class _EditInfoComponentWidgetState extends State<EditInfoComponentWidget> {
  late EditInfoComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditInfoComponentModel());

    _model.nameController ??=
        TextEditingController(text: currentUserDisplayName);
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
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
                        'يمكنك تعديل معلوماتك الشخصية أدناه',
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
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if (valueOrDefault(
                                      currentUserDocument?.type, '') ==
                                  'admin')
                                AuthUserStreamWidget(
                                  builder: (context) => Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 15.0, 0.0, 0.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                          child: Image.network(
                                            valueOrDefault<String>(
                                              currentUserPhoto,
                                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRS95ie8G-8S3i_QsaD4Gjs1HQHIxBMPcoVLA&usqp=CAU',
                                            ),
                                            width: 120.0,
                                            height: 120.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 90.0, 0.0, 0.0),
                                        child: InkWell(
                                          onTap: () async {
                                            final selectedMedia =
                                                await selectMediaWithSourceBottomSheet(
                                              context: context,
                                              maxWidth: 120.00,
                                              maxHeight: 120.00,
                                              allowPhoto: true,
                                            );
                                            if (selectedMedia != null &&
                                                selectedMedia.every((m) =>
                                                    validateFileFormat(
                                                        m.storagePath,
                                                        context))) {
                                              setState(() => _model
                                                  .isDataUploading = true);
                                              var selectedUploadedFiles =
                                                  <FFUploadedFile>[];
                                              var downloadUrls = <String>[];
                                              try {
                                                selectedUploadedFiles =
                                                    selectedMedia
                                                        .map((m) =>
                                                            FFUploadedFile(
                                                              name: m
                                                                  .storagePath
                                                                  .split('/')
                                                                  .last,
                                                              bytes: m.bytes,
                                                              height: m
                                                                  .dimensions
                                                                  ?.height,
                                                              width: m
                                                                  .dimensions
                                                                  ?.width,
                                                            ))
                                                        .toList();

                                                downloadUrls =
                                                    (await Future.wait(
                                                  selectedMedia.map(
                                                    (m) async =>
                                                        await uploadData(
                                                            m.storagePath,
                                                            m.bytes),
                                                  ),
                                                ))
                                                        .where((u) => u != null)
                                                        .map((u) => u!)
                                                        .toList();
                                              } finally {
                                                _model.isDataUploading = false;
                                              }
                                              if (selectedUploadedFiles
                                                          .length ==
                                                      selectedMedia.length &&
                                                  downloadUrls.length ==
                                                      selectedMedia.length) {
                                                setState(() {
                                                  _model.uploadedLocalFile =
                                                      selectedUploadedFiles
                                                          .first;
                                                  _model.uploadedFileUrl =
                                                      downloadUrls.first;
                                                });
                                              } else {
                                                setState(() {});
                                                return;
                                              }
                                            }
                                          },
                                          child: Icon(
                                            Icons
                                                .photo_size_select_actual_outlined,
                                            color: Color(0xFF7EAEBD),
                                            size: 30.0,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 15.0, 20.0, 15.0),
                                child: AuthUserStreamWidget(
                                  builder: (context) => Container(
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
                                      ),
                                      textAlign: TextAlign.start,
                                      validator: _model.nameControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                              ),
                              if (valueOrDefault(
                                      currentUserDocument?.type, '') ==
                                  'student')
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 15.0, 20.0, 15.0),
                                  child: AuthUserStreamWidget(
                                    builder: (context) =>
                                        FlutterFlowDropDown<String>(
                                      controller: _model.collegeController ??=
                                          FormFieldController<String>(
                                        _model.collegeValue ??= valueOrDefault(
                                            currentUserDocument?.college, ''),
                                      ),
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
                                      margin: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 4.0, 12.0, 4.0),
                                      hidesUnderline: true,
                                      isSearchable: false,
                                    ),
                                  ),
                                ),
                              if (valueOrDefault(
                                      currentUserDocument?.type, '') ==
                                  'student')
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 15.0, 20.0, 15.0),
                                  child: AuthUserStreamWidget(
                                    builder: (context) =>
                                        FlutterFlowDropDown<String>(
                                      controller: _model.levelController ??=
                                          FormFieldController<String>(
                                        _model.levelValue ??= valueOrDefault(
                                            currentUserDocument?.level, ''),
                                      ),
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
                                      margin: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 4.0, 12.0, 4.0),
                                      hidesUnderline: true,
                                      isSearchable: false,
                                    ),
                                  ),
                                ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 15.0, 20.0, 30.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    final usersUpdateData =
                                        createUsersRecordData(
                                      displayName: _model.nameController.text,
                                      college: _model.collegeValue,
                                      level: _model.levelValue,
                                    );
                                    await currentUserReference!
                                        .update(usersUpdateData);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'تم تحديث معلوماتك بنجاح',
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
