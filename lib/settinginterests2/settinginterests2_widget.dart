import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_checkbox_group.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
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

    return StreamBuilder<List<CategoryRecord>>(
      stream: queryCategoryRecord(),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                color: Color(0xFF0184BD),
              ),
            ),
          );
        }
        List<CategoryRecord> settinginterests2CategoryRecordList =
            snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
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
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 180, 0, 0),
                          child: Container(
                            width: double.infinity,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Color(0xFFF4F3F0),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: SingleChildScrollView(
                              primary: false,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
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
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 2),
                                    child: SelectionArea(
                                        child: Text(
                                      'حدد إهتماماتك',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: Color(0xFF0184BD),
                                            fontSize: 20,
                                          ),
                                    )),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20, 0, 20, 0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 254.3,
                                      decoration: BoxDecoration(
                                        color: Color(0x6CE1D7C6),
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      child:
                                          StreamBuilder<List<CategoryRecord>>(
                                        stream: queryCategoryRecord(
                                          singleRecord: true,
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50,
                                                height: 50,
                                                child:
                                                    CircularProgressIndicator(
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
                                              columnCategoryRecordList
                                                      .isNotEmpty
                                                  ? columnCategoryRecordList
                                                      .first
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
                                                      .fromSTEB(20, 20, 55, 0),
                                                  child:
                                                      FlutterFlowCheckboxGroup(
                                                    options:
                                                        columnCategoryRecord!
                                                            .name!
                                                            .toList(),
                                                    onChanged: (val) =>
                                                        setState(() => _model
                                                                .checkboxGroupValues =
                                                            val),
                                                    activeColor:
                                                        Color(0x00000000),
                                                    checkColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .alternate,
                                                    checkboxBorderColor:
                                                        Color(0xFF95A1AC),
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .title3
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color:
                                                              Color(0xFF565656),
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                    itemPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                10, 0, 30, 18),
                                                    initialized: _model
                                                            .checkboxGroupValues !=
                                                        null,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 20, 0, 20),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        final usersUpdateData = {
                                          'intrests':
                                              _model.checkboxGroupValues,
                                        };
                                        await currentUserReference!
                                            .update(usersUpdateData);

                                        context.goNamed(
                                          'HomePage',
                                          extra: <String, dynamic>{
                                            kTransitionInfoKey: TransitionInfo(
                                              hasTransition: true,
                                              transitionType:
                                                  PageTransitionType.fade,
                                            ),
                                          },
                                        );
                                      },
                                      text: 'إنهاء',
                                      options: FFButtonOptions(
                                        width: 300,
                                        height: 50,
                                        color: Color(0xFF579BB1),
                                        textStyle: GoogleFonts.getFont(
                                          'Open Sans',
                                          color: Color(0xFFFFFAF1),
                                          fontSize: 16,
                                        ),
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 0,
                                        ),
                                        borderRadius: BorderRadius.circular(25),
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
      },
    );
  }
}
