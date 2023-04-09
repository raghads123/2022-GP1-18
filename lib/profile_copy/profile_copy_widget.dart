import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/edit_info_component_widget.dart';
import '/components/edit_interests_component_widget.dart';
import '/components/edit_notification_component_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'profile_copy_model.dart';
export 'profile_copy_model.dart';

class ProfileCopyWidget extends StatefulWidget {
  const ProfileCopyWidget({Key? key}) : super(key: key);

  @override
  _ProfileCopyWidgetState createState() => _ProfileCopyWidgetState();
}

class _ProfileCopyWidgetState extends State<ProfileCopyWidget> {
  late ProfileCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileCopyModel());

    _model.nameController ??=
        TextEditingController(text: currentUserDisplayName);
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF4F3F0),
      appBar: AppBar(
        backgroundColor: Color(0xFFF4F3F0),
        automaticallyImplyLeading: false,
        title: Text(
          'حسابي',
          style: FlutterFlowTheme.of(context).headlineMedium.override(
                fontFamily: 'Poppins',
                color: Color(0xFF7EAEBD),
                fontSize: 22.0,
              ),
        ),
        actions: [
          FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.logout,
              color: Color(0xFFB72F31),
              size: 22.0,
            ),
            onPressed: () async {
              var confirmDialogResponse = await showDialog<bool>(
                    context: context,
                    builder: (alertDialogContext) {
                      return AlertDialog(
                        title: Text('هل تريد تسجيل الخروج'),
                        actions: [
                          TextButton(
                            onPressed: () =>
                                Navigator.pop(alertDialogContext, false),
                            child: Text('لا'),
                          ),
                          TextButton(
                            onPressed: () =>
                                Navigator.pop(alertDialogContext, true),
                            child: Text('نعم'),
                          ),
                        ],
                      );
                    },
                  ) ??
                  false;
              if (confirmDialogResponse) {
                GoRouter.of(context).prepareAuthEvent();
                await signOut();
                GoRouter.of(context).clearRedirectLocation();

                context.pushNamedAuth(
                  'FirstPage',
                  mounted,
                  extra: <String, dynamic>{
                    kTransitionInfoKey: TransitionInfo(
                      hasTransition: true,
                      transitionType: PageTransitionType.fade,
                      duration: Duration(milliseconds: 0),
                    ),
                  },
                );

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'تم تسجيل خروجك بنجاح',
                      style: TextStyle(
                        color: FlutterFlowTheme.of(context).primaryBtnText,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    duration: Duration(milliseconds: 4000),
                    backgroundColor: Color(0xE15BD85B),
                  ),
                );
              }
            },
          ),
        ],
        centerTitle: true,
        elevation: 2.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 739.0,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5.0,
                    color: Color(0x430F1113),
                    offset: Offset(0.0, 2.0),
                  )
                ],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8.0),
                  bottomRight: Radius.circular(8.0),
                  topLeft: Radius.circular(0.0),
                  topRight: Radius.circular(0.0),
                ),
              ),
              child: Align(
                alignment: AlignmentDirectional(0.0, -0.85),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                  child: SingleChildScrollView(
                    primary: false,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 30.0, 20.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SelectionArea(
                                  child: Text(
                                'مرحباً',
                                textAlign: TextAlign.end,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontSize: 24.0,
                                    ),
                              )),
                              Expanded(
                                child: AuthUserStreamWidget(
                                  builder: (context) => SelectionArea(
                                      child: Text(
                                    currentUserDisplayName,
                                    textAlign: TextAlign.end,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          fontSize: 24.0,
                                        ),
                                  )),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 15.0, 20.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SelectionArea(
                                  child: Text(
                                'يمكنك تعديل الإعدادات التالية:',
                                textAlign: TextAlign.end,
                                style: GoogleFonts.getFont(
                                  'Merriweather',
                                  color: Color(0xFF7EAEBD),
                                  fontWeight: FontWeight.w500,
                                ),
                              )),
                            ],
                          ),
                        ),
                        if (valueOrDefault(currentUserDocument?.type, '') ==
                            'student')
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 15.0, 0.0, 15.0),
                            child: AuthUserStreamWidget(
                              builder: (context) => FFButtonWidget(
                                onPressed: () async {
                                  showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Color(0x00FFFFFF),
                                    context: context,
                                    builder: (bottomSheetContext) {
                                      return Padding(
                                        padding:
                                            MediaQuery.of(bottomSheetContext)
                                                .viewInsets,
                                        child: EditInterestsComponentWidget(),
                                      );
                                    },
                                  ).then((value) => setState(() {}));
                                },
                                text: 'تعديل الإهتمامات',
                                icon: Icon(
                                  Icons.edit_outlined,
                                  size: 15.0,
                                ),
                                options: FFButtonOptions(
                                  width: 300.0,
                                  height: 50.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: Color(0xFFE1D7C6),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: Color(0xFF7EAEBD),
                                      ),
                                  elevation: 2.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                                showLoadingIndicator: false,
                              ),
                            ),
                          ),
                        if (valueOrDefault(currentUserDocument?.type, '') ==
                            'student')
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 15.0, 0.0, 15.0),
                            child: AuthUserStreamWidget(
                              builder: (context) => FFButtonWidget(
                                onPressed: () async {
                                  showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Color(0x00FFFFFF),
                                    context: context,
                                    builder: (bottomSheetContext) {
                                      return Padding(
                                        padding:
                                            MediaQuery.of(bottomSheetContext)
                                                .viewInsets,
                                        child: EditInfoComponentWidget(),
                                      );
                                    },
                                  ).then((value) => setState(() {}));
                                },
                                text: 'تعديل المعلومات الشخصية',
                                icon: Icon(
                                  Icons.person_outline_outlined,
                                  size: 15.0,
                                ),
                                options: FFButtonOptions(
                                  width: 300.0,
                                  height: 50.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: Color(0xFFE1D7C6),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: Color(0xFF7EAEBD),
                                      ),
                                  elevation: 2.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                                showLoadingIndicator: false,
                              ),
                            ),
                          ),
                        if (valueOrDefault(currentUserDocument?.type, '') ==
                            'student')
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 15.0, 0.0, 15.0),
                            child: AuthUserStreamWidget(
                              builder: (context) => FFButtonWidget(
                                onPressed: () async {
                                  showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Color(0x00FFFFFF),
                                    context: context,
                                    builder: (bottomSheetContext) {
                                      return Padding(
                                        padding:
                                            MediaQuery.of(bottomSheetContext)
                                                .viewInsets,
                                        child:
                                            EditNotificationComponentWidget(),
                                      );
                                    },
                                  ).then((value) => setState(() {}));
                                },
                                text: 'تعديل إعدادات الإشعارات',
                                icon: Icon(
                                  Icons.notifications_none,
                                  size: 15.0,
                                ),
                                options: FFButtonOptions(
                                  width: 300.0,
                                  height: 50.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: Color(0xFFE1D7C6),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: Color(0xFF7EAEBD),
                                      ),
                                  elevation: 2.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                                showLoadingIndicator: false,
                              ),
                            ),
                          ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              30.0, 0.0, 30.0, 2.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 20.0, 0.0),
                                  child: SelectionArea(
                                      child: Text(
                                    'الاسم:',
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.getFont(
                                      'Merriweather',
                                      color: Color(0xFFFF5757),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 15.0),
                          child: AuthUserStreamWidget(
                            builder: (context) => Container(
                              width: 300.0,
                              child: TextFormField(
                                controller: _model.nameController,
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintText: 'الاسم',
                                  hintStyle: GoogleFonts.getFont(
                                    'Open Sans',
                                    color: Color(0xFF565656),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                  errorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                  focusedErrorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                  filled: true,
                                  fillColor: Color(0xFFE0E0E0),
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
                        if (valueOrDefault(currentUserDocument?.type, '') ==
                            'student')
                          AuthUserStreamWidget(
                            builder: (context) => Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      30.0, 0.0, 30.0, 2.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 0.0, 20.0, 0.0),
                                          child: SelectionArea(
                                              child: Text(
                                            'الكلية:',
                                            textAlign: TextAlign.start,
                                            style: GoogleFonts.getFont(
                                              'Merriweather',
                                              color: Color(0xFFFF5757),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          )),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
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
                                  onChanged: (val) =>
                                      setState(() => _model.collegeValue = val),
                                  width: 300.0,
                                  height: 50.0,
                                  textStyle: GoogleFonts.getFont(
                                    'Open Sans',
                                    color: Color(0xFF565656),
                                  ),
                                  hintText: 'الكلية ',
                                  fillColor: Color(0xFFE0E0E0),
                                  elevation: 2.0,
                                  borderColor: Colors.transparent,
                                  borderWidth: 0.0,
                                  borderRadius: 25.0,
                                  margin: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 4.0, 12.0, 4.0),
                                  hidesUnderline: true,
                                  isSearchable: false,
                                ),
                              ],
                            ),
                          ),
                        if (valueOrDefault(currentUserDocument?.type, '') ==
                            'student')
                          AuthUserStreamWidget(
                            builder: (context) => Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      30.0, 0.0, 30.0, 2.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 15.0, 20.0, 0.0),
                                          child: SelectionArea(
                                              child: Text(
                                            'المستوى:',
                                            textAlign: TextAlign.start,
                                            style: GoogleFonts.getFont(
                                              'Merriweather',
                                              color: Color(0xFFFF5757),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          )),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 15.0),
                                  child: FlutterFlowDropDown<String>(
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
                                    onChanged: (val) =>
                                        setState(() => _model.levelValue = val),
                                    width: 300.0,
                                    height: 50.0,
                                    textStyle: GoogleFonts.getFont(
                                      'Open Sans',
                                      color: Color(0xFF565656),
                                    ),
                                    hintText: 'المستوى',
                                    fillColor: Color(0xFFE0E0E0),
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
                              ],
                            ),
                          ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 12.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              final usersUpdateData = createUsersRecordData(
                                displayName: _model.nameController.text,
                                college: _model.collegeValue,
                                level: _model.levelValue,
                              );
                              await currentUserReference!
                                  .update(usersUpdateData);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'تم حفظ التغيرات بنجاح',
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
                            },
                            text: 'حفظ التغيرات',
                            options: FFButtonOptions(
                              width: 230.0,
                              height: 50.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: Color(0xFF1C8EC1),
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    fontFamily: 'Open Sans',
                                    color: Colors.white,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                              elevation: 3.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 30.0),
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
                              // Return an empty Container when the item does not exist.
                              if (snapshot.data!.isEmpty) {
                                return Container();
                              }
                              final columnCategoryRecord =
                                  columnCategoryRecordList.isNotEmpty
                                      ? columnCategoryRecordList.first
                                      : null;
                              return Column(
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
                                                isEqualTo: '1'),
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
                                        List<NotifyRecord>
                                            switchListTileNotifyRecordList =
                                            snapshot.data!;
                                        // Return an empty Container when the item does not exist.
                                        if (snapshot.data!.isEmpty) {
                                          return Container();
                                        }
                                        final switchListTileNotifyRecord =
                                            switchListTileNotifyRecordList
                                                    .isNotEmpty
                                                ? switchListTileNotifyRecordList
                                                    .first
                                                : null;
                                        return SwitchListTile(
                                          value: _model.switchListTileValue1 ??=
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
                                                    FieldValue.arrayUnion(
                                                        [currentUserReference]),
                                              };
                                              await switchListTileNotifyRecord!
                                                  .reference
                                                  .update(notifyUpdateData);
                                            } else {
                                              final notifyUpdateData = {
                                                'multiuser':
                                                    FieldValue.arrayRemove(
                                                        [currentUserReference]),
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
                                          tileColor: Color(0xFFF5F5F5),
                                          dense: false,
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                        );
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 15.0, 20.0, 15.0),
                                    child: SwitchListTile(
                                      value: _model.switchListTileValue2 ??=
                                          false,
                                      onChanged: (newValue) async {
                                        setState(() => _model
                                            .switchListTileValue2 = newValue!);
                                      },
                                      title: Text(
                                        'أشعرني عن أنشطة تهمنتي ',
                                        style: GoogleFonts.getFont(
                                          'Open Sans',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18.0,
                                        ),
                                      ),
                                      subtitle: Text(
                                        'سيتم إشعارك في حال تمت إضافة أي نشاط يوافق إهتماماتك التي حددتها مسبقاً',
                                        style: GoogleFonts.getFont(
                                          'Open Sans',
                                        ),
                                      ),
                                      tileColor: Color(0xFFF5F5F5),
                                      dense: false,
                                      controlAffinity:
                                          ListTileControlAffinity.trailing,
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
