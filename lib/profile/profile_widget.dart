import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({Key? key}) : super(key: key);

  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  String? collegeValue;
  TextEditingController? nameController;
  String? levelValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: currentUserDisplayName);
  }

  @override
  void dispose() {
    nameController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          'حسابي',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: Color(0xFF57636C),
                fontSize: 22,
              ),
        ),
        actions: [
          FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30,
            borderWidth: 1,
            buttonSize: 60,
            icon: Icon(
              Icons.logout,
              color: Color(0xFFFF5757),
              size: 22,
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
        elevation: 2,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 739,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5,
                    color: Color(0x430F1113),
                    offset: Offset(0, 2),
                  )
                ],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(0),
                ),
              ),
              child: Align(
                alignment: AlignmentDirectional(0, -0.85),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 90),
                  child: SingleChildScrollView(
                    primary: false,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SelectionArea(
                                  child: Text(
                                '  مرحباً',
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontSize: 24,
                                    ),
                              )),
                              Expanded(
                                child: AuthUserStreamWidget(
                                  builder: (context) => SelectionArea(
                                      child: Text(
                                    currentUserDisplayName,
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Poppins',
                                          fontSize: 24,
                                        ),
                                  )),
                                ),
                              ),
                              InkWell(
                                onTap: () async {
                                  context.pushNamed('SyncInCalender');
                                },
                                child: Icon(
                                  Icons.calendar_today,
                                  color: Color(0xFFFF5757),
                                  size: 24,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(30, 0, 30, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0, 15, 0, 15),
                                child: SelectionArea(
                                    child: Text(
                                  'يمكنك تعديل المعلومات التالية:',
                                  textAlign: TextAlign.end,
                                  style: GoogleFonts.getFont(
                                    'Merriweather',
                                    color: Color(0xFF0184BD),
                                    fontWeight: FontWeight.w500,
                                  ),
                                )),
                              ),
                            ],
                          ),
                        ),
                        if (valueOrDefault(currentUserDocument?.type, '') ==
                            'student')
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 15, 0, 15),
                            child: AuthUserStreamWidget(
                              builder: (context) => FFButtonWidget(
                                onPressed: () async {
                                  context.pushNamed('EditInterests');
                                },
                                text: 'تعديل الإهتمامات',
                                icon: Icon(
                                  Icons.edit_outlined,
                                  size: 15,
                                ),
                                options: FFButtonOptions(
                                  width: 300,
                                  height: 50,
                                  color: Color(0xFFE0E0E0),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyText2
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: Color(0xFFFF5757),
                                      ),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                showLoadingIndicator: false,
                              ),
                            ),
                          ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(30, 0, 30, 2),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20, 0, 20, 0),
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
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 0, 20, 15),
                          child: AuthUserStreamWidget(
                            builder: (context) => Container(
                              width: 300,
                              child: TextFormField(
                                controller: nameController,
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
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  errorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  focusedErrorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  filled: true,
                                  fillColor: Color(0xFFE0E0E0),
                                ),
                                style: GoogleFonts.getFont(
                                  'Open Sans',
                                  color: Color(0xFF565656),
                                ),
                                textAlign: TextAlign.start,
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
                                      30, 0, 30, 2),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20, 0, 20, 0),
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
                                  initialOption: collegeValue ??=
                                      valueOrDefault(
                                          currentUserDocument?.college, ''),
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
                                      setState(() => collegeValue = val),
                                  width: 300,
                                  height: 50,
                                  textStyle: GoogleFonts.getFont(
                                    'Open Sans',
                                    color: Color(0xFF565656),
                                  ),
                                  hintText: 'الكلية ',
                                  fillColor: Color(0xFFE0E0E0),
                                  elevation: 2,
                                  borderColor: Colors.transparent,
                                  borderWidth: 0,
                                  borderRadius: 25,
                                  margin: EdgeInsetsDirectional.fromSTEB(
                                      12, 4, 12, 4),
                                  hidesUnderline: true,
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
                                      30, 0, 30, 2),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20, 15, 20, 0),
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
                                      0, 0, 0, 15),
                                  child: FlutterFlowDropDown<String>(
                                    initialOption: levelValue ??=
                                        valueOrDefault(
                                            currentUserDocument?.level, ''),
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
                                        setState(() => levelValue = val),
                                    width: 300,
                                    height: 50,
                                    textStyle: GoogleFonts.getFont(
                                      'Open Sans',
                                      color: Color(0xFF565656),
                                    ),
                                    hintText: 'المستوى',
                                    fillColor: Color(0xFFE0E0E0),
                                    elevation: 2,
                                    borderColor: Colors.transparent,
                                    borderWidth: 0,
                                    borderRadius: 25,
                                    margin: EdgeInsetsDirectional.fromSTEB(
                                        12, 4, 12, 4),
                                    hidesUnderline: true,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 12),
                          child: FFButtonWidget(
                            onPressed: () async {
                              final usersUpdateData = createUsersRecordData(
                                displayName: nameController!.text,
                                college: collegeValue,
                                level: levelValue,
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
                              width: 230,
                              height: 50,
                              color: Color(0xFF1C8EC1),
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyText2
                                  .override(
                                    fontFamily: 'Open Sans',
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                              elevation: 3,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
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
    );
  }
}
