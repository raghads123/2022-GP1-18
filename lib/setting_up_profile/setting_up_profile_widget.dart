import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingUpProfileWidget extends StatefulWidget {
  const SettingUpProfileWidget({Key? key}) : super(key: key);

  @override
  _SettingUpProfileWidgetState createState() => _SettingUpProfileWidgetState();
}

class _SettingUpProfileWidgetState extends State<SettingUpProfileWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          children: [
            Align(
              alignment: AlignmentDirectional(0, -1),
              child: Image.asset(
                'assets/images/mcatd_1.png',
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 180, 0, 0),
                      child: Container(
                        width: double.infinity,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset(
                                  'assets/images/9hsjc_2.png',
                                  width: 190,
                                  fit: BoxFit.cover,
                                ),
                                SelectionArea(
                                    child: Text(
                                  '!اهلًا ِبك',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF0184BD),
                                        fontSize: 24,
                                      ),
                                )),
                                SelectionArea(
                                    child: Text(
                                  'ساعدينا بالتعرف عليك بشكلٍ أفضل',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF0184BD),
                                        fontSize: 20,
                                      ),
                                )),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          4, 0, 4, 15),
                                      child: Container(
                                        width: 300,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFE0E0E0),
                                          borderRadius:
                                              BorderRadius.circular(25),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          4, 0, 4, 15),
                                      child: Container(
                                        width: 300,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFE0E0E0),
                                          borderRadius:
                                              BorderRadius.circular(25),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          4, 0, 4, 15),
                                      child: Container(
                                        width: 300,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFE0E0E0),
                                          borderRadius:
                                              BorderRadius.circular(25),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 20),
                                      child: FFButtonWidget(
                                        onPressed: () {
                                          print('Button pressed ...');
                                        },
                                        text: 'إنشاء حساب',
                                        options: FFButtonOptions(
                                          width: 300,
                                          height: 50,
                                          color: Color(0xFFFF5757),
                                          textStyle: GoogleFonts.getFont(
                                            'Open Sans',
                                            color: Color(0xFFFFFAF1),
                                            fontSize: 16,
                                          ),
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(25),
                                        ),
                                      ),
                                    ),
                                  ],
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
