import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'my_opp_details_model.dart';
export 'my_opp_details_model.dart';

class MyOppDetailsWidget extends StatefulWidget {
  const MyOppDetailsWidget({
    Key? key,
    this.opportunityID,
  }) : super(key: key);

  final String? opportunityID;

  @override
  _MyOppDetailsWidgetState createState() => _MyOppDetailsWidgetState();
}

class _MyOppDetailsWidgetState extends State<MyOppDetailsWidget> {
  late MyOppDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyOppDetailsModel());
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
        backgroundColor: Color(0xFFF4F3F0),
        appBar: AppBar(
          backgroundColor: Color(0xFFF4F3F0),
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 52.0,
            icon: Icon(
              Icons.chevron_left_rounded,
              color: Color(0xFF7EAEBD),
              size: 30.0,
            ),
            onPressed: () async {
              context.goNamed('myActivities');
            },
          ),
          title: Text(
            'تفاصيل الفرصة',
            style: FlutterFlowTheme.of(context).displaySmall.override(
                  fontFamily: 'Poppins',
                  color: Color(0xFF7EAEBD),
                  fontSize: 22.0,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: StreamBuilder<List<OpportunitiesRecord>>(
                    stream: queryOpportunitiesRecord(
                      queryBuilder: (opportunitiesRecord) => opportunitiesRecord
                          .where('OpID', isEqualTo: widget.opportunityID),
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
                      List<OpportunitiesRecord>
                          containerOpportunitiesRecordList = snapshot.data!;
                      // Return an empty Container when the item does not exist.
                      if (snapshot.data!.isEmpty) {
                        return Container();
                      }
                      final containerOpportunitiesRecord =
                          containerOpportunitiesRecordList.isNotEmpty
                              ? containerOpportunitiesRecordList.first
                              : null;
                      return Container(
                        width: double.infinity,
                        height: 100.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBtnText,
                        ),
                        child: SingleChildScrollView(
                          primary: false,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 30.0, 0.0, 0.0),
                                child: StreamBuilder<List<UsersRecord>>(
                                  stream: queryUsersRecord(
                                    queryBuilder: (usersRecord) =>
                                        usersRecord.where('email',
                                            isEqualTo: currentUserEmail),
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
                                    List<UsersRecord> columnUsersRecordList =
                                        snapshot.data!;
                                    // Return an empty Container when the item does not exist.
                                    if (snapshot.data!.isEmpty) {
                                      return Container();
                                    }
                                    final columnUsersRecord =
                                        columnUsersRecordList.isNotEmpty
                                            ? columnUsersRecordList.first
                                            : null;
                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 40.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(25.0),
                                            child: Image.network(
                                              valueOrDefault<String>(
                                                containerOpportunitiesRecord!
                                                    .opProviderLogo,
                                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRS95ie8G-8S3i_QsaD4Gjs1HQHIxBMPcoVLA&usqp=CAU',
                                              ),
                                              width: 130.0,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: double.infinity,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              1.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFF4F3F0),
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 4.0,
                                                color: Color(0x33000000),
                                              )
                                            ],
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(0.0),
                                              bottomRight: Radius.circular(0.0),
                                              topLeft: Radius.circular(50.0),
                                              topRight: Radius.circular(50.0),
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 30.0, 20.0, 30.0),
                                            child: SingleChildScrollView(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      15.0),
                                                          child: SelectionArea(
                                                              child: Text(
                                                            containerOpportunitiesRecord!
                                                                .oppName!,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .displaySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: Color(
                                                                      0xFF57636C),
                                                                ),
                                                          )),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    5.0),
                                                        child: SelectionArea(
                                                            child: Text(
                                                          'تفاصيل الفرصة:',
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodySmall,
                                                        )),
                                                      ),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 15.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      4.0),
                                                          child: Icon(
                                                            Icons.schedule,
                                                            color: Color(
                                                                0xFF0184BD),
                                                            size: 20.0,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      4.0,
                                                                      0.0),
                                                          child: Text(
                                                            dateTimeFormat(
                                                              'M/d h:mm a',
                                                              containerOpportunitiesRecord!
                                                                  .sdate!,
                                                              locale: FFLocalizations
                                                                      .of(context)
                                                                  .languageCode,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: Color(
                                                                      0xFF0184BD),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      4.0),
                                                          child: Icon(
                                                            Icons.schedule,
                                                            color: Color(
                                                                0xFF0184BD),
                                                            size: 20.0,
                                                          ),
                                                        ),
                                                        Text(
                                                          dateTimeFormat(
                                                            'M/d h:mm a',
                                                            containerOpportunitiesRecord!
                                                                .edate!,
                                                            locale: FFLocalizations
                                                                    .of(context)
                                                                .languageCode,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: Color(
                                                                    0xFF0184BD),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    5.0),
                                                        child: SelectionArea(
                                                            child: Text(
                                                          'وصف الفرصة:',
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodySmall,
                                                        )),
                                                      ),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 5.0,
                                                                0.0, 15.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                            containerOpportunitiesRecord!
                                                                .opDesc!,
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Open Sans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .black600,
                                                                  fontSize:
                                                                      16.0,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      SelectionArea(
                                                          child: Text(
                                                        'طلبات المتقدمين:',
                                                        textAlign:
                                                            TextAlign.start,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodySmall
                                                            .override(
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontSize: 14.0,
                                                            ),
                                                      )),
                                                    ],
                                                  ),
                                                  StreamBuilder<
                                                      List<
                                                          OppApplicationsRecord>>(
                                                    stream:
                                                        queryOppApplicationsRecord(
                                                      queryBuilder: (oppApplicationsRecord) =>
                                                          oppApplicationsRecord
                                                              .where('oppIDDD',
                                                                  isEqualTo: widget
                                                                      .opportunityID)
                                                              .where('status',
                                                                  isNotEqualTo:
                                                                      'معلق')
                                                              .orderBy(
                                                                  'status'),
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 50.0,
                                                            height: 50.0,
                                                            child:
                                                                CircularProgressIndicator(
                                                              color: Color(
                                                                  0xFF0184BD),
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<OppApplicationsRecord>
                                                          listViewOppApplicationsRecordList =
                                                          snapshot.data!;
                                                      return ListView.builder(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        primary: false,
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            listViewOppApplicationsRecordList
                                                                .length,
                                                        itemBuilder: (context,
                                                            listViewIndex) {
                                                          final listViewOppApplicationsRecord =
                                                              listViewOppApplicationsRecordList[
                                                                  listViewIndex];
                                                          return Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        15.0,
                                                                        15.0,
                                                                        15.0,
                                                                        15.0),
                                                                child:
                                                                    Container(
                                                                  width: double
                                                                      .infinity,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Colors
                                                                        .white,
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        blurRadius:
                                                                            4.0,
                                                                        color: Color(
                                                                            0x33000000),
                                                                        offset: Offset(
                                                                            0.0,
                                                                            2.0),
                                                                      )
                                                                    ],
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            25.0),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            15.0,
                                                                            15.0,
                                                                            15.0,
                                                                            15.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                  child: Text(
                                                                                    listViewOppApplicationsRecord.appEmail!,
                                                                                    textAlign: TextAlign.justify,
                                                                                    style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                          fontFamily: 'Outfit',
                                                                                          color: Color(0xFF1C8EC1),
                                                                                          fontSize: 20.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                  child: Text(
                                                                                    listViewOppApplicationsRecord.appSkills!,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Poppins',
                                                                                          color: Color(0xFF57636C),
                                                                                          fontWeight: FontWeight.normal,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                                Text(
                                                                                  listViewOppApplicationsRecord.appBio!,
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Poppins',
                                                                                        fontWeight: FontWeight.normal,
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        if (listViewOppApplicationsRecord.status ==
                                                                            'معلق')
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                15.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                                                                                  child: FFButtonWidget(
                                                                                    onPressed: () async {
                                                                                      var confirmDialogResponse = await showDialog<bool>(
                                                                                            context: context,
                                                                                            builder: (alertDialogContext) {
                                                                                              return AlertDialog(
                                                                                                title: Text('هل تريد قبول هذا الطلب؟'),
                                                                                                content: Text('في حال قبول الطلب لا يمكن التراجع عن العملية'),
                                                                                                actions: [
                                                                                                  TextButton(
                                                                                                    onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                                    child: Text('لا'),
                                                                                                  ),
                                                                                                  TextButton(
                                                                                                    onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                                    child: Text('نعم'),
                                                                                                  ),
                                                                                                ],
                                                                                              );
                                                                                            },
                                                                                          ) ??
                                                                                          false;
                                                                                      if (confirmDialogResponse) {
                                                                                        final oppApplicationsUpdateData = createOppApplicationsRecordData(
                                                                                          status: 'تمت الموافقة على الطلب',
                                                                                        );
                                                                                        await listViewOppApplicationsRecord.reference.update(oppApplicationsUpdateData);
                                                                                      }
                                                                                    },
                                                                                    text: 'موافقة',
                                                                                    options: FFButtonOptions(
                                                                                      width: double.infinity,
                                                                                      height: 30.0,
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                      iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                      color: FlutterFlowTheme.of(context).success,
                                                                                      textStyle: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                            fontFamily: 'Poppins',
                                                                                            color: Colors.white,
                                                                                          ),
                                                                                      elevation: 2.0,
                                                                                      borderSide: BorderSide(
                                                                                        color: Colors.transparent,
                                                                                      ),
                                                                                      borderRadius: BorderRadius.circular(25.0),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                FFButtonWidget(
                                                                                  onPressed: () async {
                                                                                    var confirmDialogResponse = await showDialog<bool>(
                                                                                          context: context,
                                                                                          builder: (alertDialogContext) {
                                                                                            return AlertDialog(
                                                                                              title: Text('هل تريد رفض هذا الطلب؟'),
                                                                                              content: Text('في حال رفض الطلب لا يمكن التراجع عن العملية'),
                                                                                              actions: [
                                                                                                TextButton(
                                                                                                  onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                                  child: Text('لا'),
                                                                                                ),
                                                                                                TextButton(
                                                                                                  onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                                  child: Text('نعم'),
                                                                                                ),
                                                                                              ],
                                                                                            );
                                                                                          },
                                                                                        ) ??
                                                                                        false;
                                                                                    if (confirmDialogResponse) {
                                                                                      final oppApplicationsUpdateData = createOppApplicationsRecordData(
                                                                                        status: 'تم رفض الطلب',
                                                                                      );
                                                                                      await listViewOppApplicationsRecord.reference.update(oppApplicationsUpdateData);
                                                                                    }
                                                                                  },
                                                                                  text: 'رفض',
                                                                                  options: FFButtonOptions(
                                                                                    width: double.infinity,
                                                                                    height: 30.0,
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                    iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                    color: Color(0xFFB72F31),
                                                                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                          fontFamily: 'Poppins',
                                                                                          color: Colors.white,
                                                                                        ),
                                                                                    elevation: 2.0,
                                                                                    borderSide: BorderSide(
                                                                                      color: Colors.transparent,
                                                                                    ),
                                                                                    borderRadius: BorderRadius.circular(25.0),
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
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      SelectionArea(
                                                          child: Text(
                                                        'طلبات سابقة:',
                                                        textAlign:
                                                            TextAlign.start,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodySmall
                                                            .override(
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontSize: 14.0,
                                                            ),
                                                      )),
                                                    ],
                                                  ),
                                                  StreamBuilder<
                                                      List<
                                                          OppApplicationsRecord>>(
                                                    stream:
                                                        queryOppApplicationsRecord(
                                                      queryBuilder: (oppApplicationsRecord) =>
                                                          oppApplicationsRecord
                                                              .where('oppIDDD',
                                                                  isEqualTo: widget
                                                                      .opportunityID)
                                                              .where('status',
                                                                  isNotEqualTo:
                                                                      'معلق')
                                                              .orderBy(
                                                                  'status'),
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 50.0,
                                                            height: 50.0,
                                                            child:
                                                                CircularProgressIndicator(
                                                              color: Color(
                                                                  0xFF0184BD),
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<OppApplicationsRecord>
                                                          listViewOppApplicationsRecordList =
                                                          snapshot.data!;
                                                      return ListView.builder(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        primary: false,
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            listViewOppApplicationsRecordList
                                                                .length,
                                                        itemBuilder: (context,
                                                            listViewIndex) {
                                                          final listViewOppApplicationsRecord =
                                                              listViewOppApplicationsRecordList[
                                                                  listViewIndex];
                                                          return Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        15.0,
                                                                        15.0,
                                                                        15.0,
                                                                        15.0),
                                                                child:
                                                                    Container(
                                                                  width: double
                                                                      .infinity,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Colors
                                                                        .white,
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        blurRadius:
                                                                            4.0,
                                                                        color: Color(
                                                                            0x33000000),
                                                                        offset: Offset(
                                                                            0.0,
                                                                            2.0),
                                                                      )
                                                                    ],
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            25.0),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            15.0,
                                                                            15.0,
                                                                            15.0,
                                                                            15.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                  child: Text(
                                                                                    listViewOppApplicationsRecord.appEmail!,
                                                                                    textAlign: TextAlign.justify,
                                                                                    style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                          fontFamily: 'Outfit',
                                                                                          color: Color(0xFF1C8EC1),
                                                                                          fontSize: 20.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                  child: Text(
                                                                                    listViewOppApplicationsRecord.appSkills!,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Poppins',
                                                                                          color: Color(0xFF57636C),
                                                                                          fontWeight: FontWeight.normal,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                                Text(
                                                                                  listViewOppApplicationsRecord.appBio!,
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Poppins',
                                                                                        fontWeight: FontWeight.normal,
                                                                                      ),
                                                                                ),
                                                                                Text(
                                                                                  listViewOppApplicationsRecord.status!,
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Poppins',
                                                                                        fontWeight: FontWeight.normal,
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
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
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
