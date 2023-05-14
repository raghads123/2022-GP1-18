import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());
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

    return FutureBuilder<int>(
      future: queryOpportunitiesRecordCount(
        queryBuilder: (opportunitiesRecord) =>
            opportunitiesRecord.where('status', isEqualTo: 'معلق'),
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
        int homePageCount = snapshot.data!;
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Color(0xFFF4F3F0),
            body: SafeArea(
              child: FutureBuilder<int>(
                future: queryExtraActsRecordCount(
                  queryBuilder: (extraActsRecord) =>
                      extraActsRecord.where('status', isEqualTo: 'معلق'),
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
                  int stackCount = snapshot.data!;
                  return Stack(
                    children: [
                      Image.asset(
                        'assets/images/Untitled_design_(3).png',
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      SingleChildScrollView(
                        primary: false,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 250.0, 0.0, 0.0),
                                child: Container(
                                  width: 350.0,
                                  decoration: BoxDecoration(
                                    color: Color(0x91E1D7C6),
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  30.0, 30.0, 20.0, 15.0),
                                          child: Text(
                                            'الأنشطة والفرص',
                                            textAlign: TextAlign.start,
                                            style: GoogleFonts.getFont(
                                              'Open Sans',
                                              color: Color(0xFF777373),
                                              fontWeight: FontWeight.w600,
                                              fontSize: 20.0,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 15.0, 20.0, 15.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              InkWell(
                                                onTap: () async {
                                                  context.goNamed('courses');
                                                },
                                                child: Container(
                                                  width: 150.0,
                                                  height: 100.0,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFE1D7C6),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 30.0,
                                                                5.0, 30.0),
                                                    child: Text(
                                                      'الدورات',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:
                                                          GoogleFonts.getFont(
                                                        'Open Sans',
                                                        color:
                                                            Color(0xFF777373),
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 20.0,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () async {
                                                  context.goNamed('workshops');
                                                },
                                                child: Container(
                                                  width: 150.0,
                                                  height: 100.0,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xDFE1D7C6),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 30.0,
                                                                5.0, 30.0),
                                                    child: Text(
                                                      'ورش العمل',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:
                                                          GoogleFonts.getFont(
                                                        'Open Sans',
                                                        color:
                                                            Color(0xFF777373),
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 20.0,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 15.0, 20.0, 30.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              InkWell(
                                                onTap: () async {
                                                  context.goNamed('events');
                                                },
                                                child: Container(
                                                  width: 150.0,
                                                  height: 100.0,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xDFE1D7C6),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 30.0,
                                                                5.0, 30.0),
                                                    child: Text(
                                                      'الفعاليات',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:
                                                          GoogleFonts.getFont(
                                                        'Open Sans',
                                                        color:
                                                            Color(0xFF777373),
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 20.0,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () async {
                                                  context
                                                      .goNamed('Opportunities');
                                                },
                                                child: Container(
                                                  width: 150.0,
                                                  height: 100.0,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xDFE1D7C6),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 30.0,
                                                                5.0, 30.0),
                                                    child: Text(
                                                      'فرص',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:
                                                          GoogleFonts.getFont(
                                                        'Open Sans',
                                                        color:
                                                            Color(0xFF777373),
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 20.0,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 0.0, 20.0, 15.0),
                                          child: Container(
                                            width: double.infinity,
                                            height: 50.0,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFFFFAF1),
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 4.0,
                                                  color: Color(0x33000000),
                                                  offset: Offset(0.0, 2.0),
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                            ),
                                            child: InkWell(
                                              onTap: () async {
                                                context.goNamed('addopp');
                                              },
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.add_rounded,
                                                    color: Color(0xFF777373),
                                                    size: 20.0,
                                                  ),
                                                  Text(
                                                    'إضافة فرصة',
                                                    textAlign: TextAlign.center,
                                                    style: GoogleFonts.getFont(
                                                      'Open Sans',
                                                      color: Color(0xFF777373),
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 20.0,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 15.0, 20.0, 30.0),
                                          child: Container(
                                            width: double.infinity,
                                            height: 50.0,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFFFFAF1),
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 4.0,
                                                  color: Color(0x33000000),
                                                  offset: Offset(0.0, 2.0),
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                            ),
                                            child: InkWell(
                                              onTap: () async {
                                                context.goNamed('addActivity');
                                              },
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.add_rounded,
                                                    color: Color(0xFF777373),
                                                    size: 20.0,
                                                  ),
                                                  Text(
                                                    'إضافة نشاط',
                                                    textAlign: TextAlign.center,
                                                    style: GoogleFonts.getFont(
                                                      'Open Sans',
                                                      color: Color(0xFF777373),
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 20.0,
                                                    ),
                                                  ),
                                                ],
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
                      Align(
                        alignment: AlignmentDirectional(0.0, -1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 30.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 5.0, 0.0, 0.0),
                                child: Image.asset(
                                  'assets/images/2logo.JPG',
                                  width: 160.0,
                                  height: 160.0,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 5.0),
                                child: Text(
                                  'مكانك لكل ماهو جديد ',
                                  style: GoogleFonts.getFont(
                                    'Open Sans',
                                    color: Color(0xFF0184BD),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.0,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (functions
                              .allpending(stackCount, homePageCount)
                              .toString() !=
                          '0')
                        Align(
                          alignment: AlignmentDirectional(-0.8, -0.9),
                          child: FutureBuilder<int>(
                            future: queryExtraActsRecordCount(
                              queryBuilder: (extraActsRecord) => extraActsRecord
                                  .where('status', isEqualTo: 'معلق'),
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
                              int badgeCount = snapshot.data!;
                              return badges.Badge(
                                badgeContent: Text(
                                  valueOrDefault<String>(
                                    functions
                                        .allpending(badgeCount, homePageCount)
                                        .toString(),
                                    '0',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
                                        fontSize: 10.0,
                                      ),
                                ),
                                showBadge: true,
                                shape: badges.BadgeShape.circle,
                                badgeColor: Color(0xFFB24545),
                                elevation: 4.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 8.0, 8.0, 8.0),
                                position: badges.BadgePosition.topEnd(),
                                animationType: badges.BadgeAnimationType.scale,
                                toAnimate: true,
                                child: InkWell(
                                  onTap: () async {
                                    context.goNamed('ManageRequests');
                                  },
                                  child: Icon(
                                    Icons.notifications,
                                    color: Color(0xFF777373),
                                    size: 30.0,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                    ],
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
