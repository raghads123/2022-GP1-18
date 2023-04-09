import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'first_page_model.dart';
export 'first_page_model.dart';

class FirstPageWidget extends StatefulWidget {
  const FirstPageWidget({Key? key}) : super(key: key);

  @override
  _FirstPageWidgetState createState() => _FirstPageWidgetState();
}

class _FirstPageWidgetState extends State<FirstPageWidget> {
  late FirstPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FirstPageModel());
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
        body: SafeArea(
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, -1.0),
                child: Image.asset(
                  'assets/images/WhatsApp_Image_2023-03-13_at_11.53.36_PM.jpeg',
                  width: MediaQuery.of(context).size.width * 1.0,
                  height: MediaQuery.of(context).size.height * 1.0,
                  fit: BoxFit.cover,
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Container(
                  height: 550.0,
                  decoration: BoxDecoration(
                    color: Color(0xACE1D7C6),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/2logo.JPG',
                        width: 190.0,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 15.0, 0.0, 15.0),
                        child: SelectionArea(
                            child: Text(
                          'لإثراء التجربة الجامعية ',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF0184BD),
                                    fontSize: 24.0,
                                  ),
                        )),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          // button to navigate to student log in
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 15.0, 20.0, 15.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                // the navigation action

                                context.goNamed('studentlogin');
                              },
                              text: 'طالب/ة',
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
                                  fontSize: 20.0,
                                ),
                                elevation: 2.0,
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                            ),
                          ),

                          // Button to navigate to admin log in
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 15.0, 20.0, 30.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                // Navigation action

                                context.goNamed('ActivityAdminLogin');
                              },
                              text: 'رائد/ة  نشاط',
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
                                  fontSize: 20.0,
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
