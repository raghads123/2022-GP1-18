import '../backend/backend.dart';
import '../components/edit_act_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'my_act_details_model.dart';
export 'my_act_details_model.dart';

class MyActDetailsWidget extends StatefulWidget {
  const MyActDetailsWidget({
    Key? key,
    this.actsdetails,
  }) : super(key: key);

  final String? actsdetails;

  @override
  _MyActDetailsWidgetState createState() => _MyActDetailsWidgetState();
}

class _MyActDetailsWidgetState extends State<MyActDetailsWidget> {
  late MyActDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyActDetailsModel());
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

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF4F3F0),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: StreamBuilder<List<ExtraActsRecord>>(
            stream: queryExtraActsRecord(
              queryBuilder: (extraActsRecord) => extraActsRecord.where('Act_ID',
                  isEqualTo: widget.actsdetails),
              singleRecord: true,
            ),
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
              List<ExtraActsRecord> scrollingContainerExtraActsRecordList =
                  snapshot.data!;
              // Return an empty Container when the item does not exist.
              if (snapshot.data!.isEmpty) {
                return Container();
              }
              final scrollingContainerExtraActsRecord =
                  scrollingContainerExtraActsRecordList.isNotEmpty
                      ? scrollingContainerExtraActsRecordList.first
                      : null;
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Stack(
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 50),
                                  child: Image.network(
                                    valueOrDefault<String>(
                                      scrollingContainerExtraActsRecord!.actPic,
                                      'https://identity.ksu.edu.sa/themes/custom/gavias_enzio/logo.png',
                                    ),
                                    width: double.infinity,
                                    height: 300,
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0, -0.99),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 90,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Color(0xB3090F13),
                                          Color(0x00090F13)
                                        ],
                                        stops: [0, 1],
                                        begin: AlignmentDirectional(0, -1),
                                        end: AlignmentDirectional(0, 1),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 40, 16, 16),
                                    child: InkWell(
                                      onTap: () async {
                                        if (Navigator.of(context).canPop()) {
                                          context.pop();
                                        }
                                        context.pushNamed('myActivities');
                                      },
                                      child: Card(
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        elevation: 3,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  4, 4, 4, 4),
                                          child: Icon(
                                            Icons.arrow_back_rounded,
                                            color: Color(0xFFFF5757),
                                            size: 24,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      290, 40, 0, 0),
                                  child: FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 10,
                                    borderWidth: 1,
                                    buttonSize: 40,
                                    icon: Icon(
                                      Icons.edit_outlined,
                                      color: Color(0xFFFF5757),
                                      size: 25,
                                    ),
                                    onPressed: () async {
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        enableDrag: false,
                                        context: context,
                                        builder: (context) {
                                          return Padding(
                                            padding: MediaQuery.of(context)
                                                .viewInsets,
                                            child: EditActWidget(
                                              actID:
                                                  scrollingContainerExtraActsRecord!
                                                      .actID,
                                            ),
                                          );
                                        },
                                      ).then((value) => setState(() {}));
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      330, 40, 0, 0),
                                  child: FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 10,
                                    borderWidth: 1,
                                    buttonSize: 40,
                                    icon: Icon(
                                      Icons.delete_forever_rounded,
                                      color: Color(0xFFFF5757),
                                      size: 25,
                                    ),
                                    onPressed: () async {
                                      var confirmDialogResponse =
                                          await showDialog<bool>(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    title: Text(
                                                        'هل تريد حذف هذا النشاط؟'),
                                                    content: Text(
                                                        'لا يمكنك التراجع عن هذه العملية.'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext,
                                                                false),
                                                        child: Text('لا'),
                                                      ),
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext,
                                                                true),
                                                        child: Text('نعم'),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              ) ??
                                              false;
                                      if (confirmDialogResponse) {
                                        if (Navigator.of(context).canPop()) {
                                          context.pop();
                                        }
                                        context.pushNamed('myActivities');

                                        await scrollingContainerExtraActsRecord!
                                            .reference
                                            .delete();
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'تم حذف النشاط بنجاح',
                                              style: GoogleFonts.getFont(
                                                'Open Sans',
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 4000),
                                            backgroundColor: Color(0xFF22C11C),
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(12, 0, 12, 4),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 6, 0),
                                      child: Text(
                                        scrollingContainerExtraActsRecord!
                                            .actName!,
                                        textAlign: TextAlign.start,
                                        style:
                                            FlutterFlowTheme.of(context).title2,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(12, 4, 12, 8),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 4),
                                    child: Icon(
                                      Icons.schedule,
                                      color: Color(0xFF0184BD),
                                      size: 20,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 4, 0),
                                    child: Text(
                                      dateTimeFormat(
                                        'M/d h:mm a',
                                        scrollingContainerExtraActsRecord!
                                            .sdate!,
                                        locale: FFLocalizations.of(context)
                                            .languageCode,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: Color(0xFF0184BD),
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 4),
                                    child: Icon(
                                      Icons.schedule,
                                      color: Color(0xFF0184BD),
                                      size: 20,
                                    ),
                                  ),
                                  Text(
                                    dateTimeFormat(
                                      'M/d h:mm a',
                                      scrollingContainerExtraActsRecord!.edate!,
                                      locale: FFLocalizations.of(context)
                                          .languageCode,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: Color(0xFF0184BD),
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(12, 4, 12, 8),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 4),
                                    child: Icon(
                                      Icons.location_on_sharp,
                                      color: Color(0xFF0184BD),
                                      size: 20,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      scrollingContainerExtraActsRecord!
                                          .actLoc!,
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: Color(0xFF0184BD),
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(12, 4, 12, 8),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  if (scrollingContainerExtraActsRecord!
                                          .seats ??
                                      true)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 4),
                                      child: Icon(
                                        Icons.event_seat_rounded,
                                        color: Color(0xFF0184BD),
                                        size: 20,
                                      ),
                                    ),
                                  if (scrollingContainerExtraActsRecord!
                                          .seats ??
                                      true)
                                    Text(
                                      scrollingContainerExtraActsRecord!
                                          .numSeats!
                                          .toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: Color(0xFF0184BD),
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(12, 4, 12, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 4, 0, 4),
                                    child: Text(
                                      'تفاصيل الدورة',
                                      textAlign: TextAlign.end,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText2
                                          .override(
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(12, 0, 12, 4),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 4, 0, 4),
                                      child: Text(
                                        scrollingContainerExtraActsRecord!
                                            .actDec!,
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
