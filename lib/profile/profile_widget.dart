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
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
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
                      title: Text('هل تريدين تسجيل الخروج'),
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

              context.goNamedAuth(
                'LogIn',
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
        title: Text(
          'حسابي',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: Color(0xFF57636C),
                fontSize: 22,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 2,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 700,
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
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Expanded(
                                child: AuthUserStreamWidget(
                                  child: SelectionArea(
                                      child: Text(
                                    currentUserDisplayName,
                                    textAlign: TextAlign.end,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Poppins',
                                          fontSize: 24,
                                        ),
                                  )),
                                ),
                              ),
                              SelectionArea(
                                  child: Text(
                                '  مرحباً',
                                textAlign: TextAlign.end,
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontSize: 24,
                                    ),
                              )),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(30, 0, 30, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                                child: SelectionArea(
                                    child: Text(
                                  'يمكنك تعديل معلوماتك الشخصية التالية:',
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
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(30, 0, 30, 2),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 15, 20, 0),
                                  child: SelectionArea(
                                      child: Text(
                                    'الاسم:',
                                    textAlign: TextAlign.end,
                                    style: GoogleFonts.getFont(
                                      'Merriweather',
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(4, 1, 4, 15),
                          child: Container(
                            width: 300,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Color(0xFFE0E0E0),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                              child: AuthUserStreamWidget(
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
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    errorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    focusedErrorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                  ),
                                  style: GoogleFonts.getFont(
                                    'Open Sans',
                                    color: Color(0xFF565656),
                                  ),
                                  textAlign: TextAlign.end,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(30, 0, 30, 2),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 13, 20, 0),
                                  child: SelectionArea(
                                      child: Text(
                                    'الكلية:',
                                    textAlign: TextAlign.end,
                                    style: GoogleFonts.getFont(
                                      'Merriweather',
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(4, 0, 4, 15),
                          child: Container(
                            width: 300,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Color(0xFFE0E0E0),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: AuthUserStreamWidget(
                              child: FlutterFlowDropDown(
                                initialOption: collegeValue ??= valueOrDefault(
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
                                hintText:
                                    'الكلية ـــــــــــــــــــــــــــــــــــــــــــــ',
                                fillColor: Color(0xFFE0E0E0),
                                elevation: 2,
                                borderColor: Colors.transparent,
                                borderWidth: 0,
                                borderRadius: 0,
                                margin: EdgeInsetsDirectional.fromSTEB(
                                    12, 4, 12, 4),
                                hidesUnderline: true,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(30, 0, 30, 2),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 15, 20, 0),
                                  child: SelectionArea(
                                      child: Text(
                                    'المستوى:',
                                    textAlign: TextAlign.end,
                                    style: GoogleFonts.getFont(
                                      'Merriweather',
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(4, 0, 4, 15),
                          child: Container(
                            width: 300,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Color(0xFFE0E0E0),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: AuthUserStreamWidget(
                              child: FlutterFlowDropDown(
                                initialOption: levelValue ??= valueOrDefault(
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
                                hintText:
                                    'المستوى ــــــــــــــــــــــــــــــــــــــــ',
                                fillColor: Color(0xFFE0E0E0),
                                elevation: 2,
                                borderColor: Colors.transparent,
                                borderWidth: 0,
                                borderRadius: 0,
                                margin: EdgeInsetsDirectional.fromSTEB(
                                    12, 4, 12, 4),
                                hidesUnderline: true,
                              ),
                            ),
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            context.pushNamed('EditInterests');
                          },
                          text: 'تعديل الإهتمامات',
                          options: FFButtonOptions(
                            width: 130,
                            height: 40,
                            color: Color(0xFFFF5757),
                            textStyle:
                                FlutterFlowTheme.of(context).bodyText2.override(
                                      fontFamily: 'Lexend Deca',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBtnText,
                                    ),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
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
                              color: Color(0xFFFF5757),
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyText2
                                  .override(
                                    fontFamily: 'Lexend Deca',
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
