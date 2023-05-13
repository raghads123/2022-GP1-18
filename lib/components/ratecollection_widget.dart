import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'ratecollection_model.dart';
export 'ratecollection_model.dart';

class RatecollectionWidget extends StatefulWidget {
  const RatecollectionWidget({
    Key? key,
    this.ratingtype,
    this.ratingactID,
  }) : super(key: key);

  final String? ratingtype;
  final String? ratingactID;

  @override
  _RatecollectionWidgetState createState() => _RatecollectionWidgetState();
}

class _RatecollectionWidgetState extends State<RatecollectionWidget> {
  late RatecollectionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RatecollectionModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<ExtraActsRecord>>(
      stream: queryExtraActsRecord(
        queryBuilder: (extraActsRecord) =>
            extraActsRecord.where('Act_ID', isEqualTo: widget.ratingactID),
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
        List<ExtraActsRecord> containerExtraActsRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final containerExtraActsRecord = containerExtraActsRecordList.isNotEmpty
            ? containerExtraActsRecordList.first
            : null;
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
            height: 590.0,
            decoration: BoxDecoration(
              color: Color(0xFFF4F3F0),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0.0),
                bottomRight: Radius.circular(0.0),
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
            ),
            child: StreamBuilder<List<ActRatingsRecord>>(
              stream: queryActRatingsRecord(
                queryBuilder: (actRatingsRecord) => actRatingsRecord
                    .where('act_id', isEqualTo: widget.ratingactID),
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
                List<ActRatingsRecord> columnActRatingsRecordList =
                    snapshot.data!;
                final columnActRatingsRecord =
                    columnActRatingsRecordList.isNotEmpty
                        ? columnActRatingsRecordList.first
                        : null;
                return SingleChildScrollView(
                  primary: false,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 0.0, 0.0),
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
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 30.0, 20.0, 15.0),
                        child: Text(
                          'مدى موافقة النشاط لتوقعاتك؟',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF7EAEBD),
                                    fontSize: 20.0,
                                  ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 15.0),
                        child: RatingBar.builder(
                          onRatingUpdate: (newValue) =>
                              setState(() => _model.ratingBar1Value = newValue),
                          itemBuilder: (context, index) => Icon(
                            Icons.star_rate_rounded,
                            color: Color(0xFFFFC40C),
                          ),
                          direction: Axis.horizontal,
                          initialRating: _model.ratingBar1Value ??= 0.0,
                          unratedColor: Color(0xFF9E9E9E),
                          itemCount: 5,
                          itemSize: 40.0,
                          glowColor: Color(0xFFFFC40C),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 15.0),
                        child: Text(
                          'مدى استفادتك من النشاط؟',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF7EAEBD),
                                    fontSize: 20.0,
                                  ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 15.0),
                        child: RatingBar.builder(
                          onRatingUpdate: (newValue) =>
                              setState(() => _model.ratingBar2Value = newValue),
                          itemBuilder: (context, index) => Icon(
                            Icons.star_rate_rounded,
                            color: Color(0xFFFFC40C),
                          ),
                          direction: Axis.horizontal,
                          initialRating: _model.ratingBar2Value ??= 0.0,
                          unratedColor: Color(0xFF9E9E9E),
                          itemCount: 5,
                          itemSize: 40.0,
                          glowColor: Color(0xFFFFC40C),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 15.0),
                        child: Text(
                          'مدى رضاك عن التنظيم؟',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF7EAEBD),
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 15.0),
                        child: RatingBar.builder(
                          onRatingUpdate: (newValue) =>
                              setState(() => _model.ratingBar3Value = newValue),
                          itemBuilder: (context, index) => Icon(
                            Icons.star_rate_rounded,
                            color: Color(0xFFFFC40C),
                          ),
                          direction: Axis.horizontal,
                          initialRating: _model.ratingBar3Value ??= 0.0,
                          unratedColor: Color(0xFF9E9E9E),
                          itemCount: 5,
                          itemSize: 40.0,
                          glowColor: Color(0xFFFFC40C),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 15.0),
                        child: Text(
                          'مدى إقتراحك النشاط للآخرين؟',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF7EAEBD),
                                    fontSize: 20.0,
                                  ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                        child: RatingBar.builder(
                          onRatingUpdate: (newValue) =>
                              setState(() => _model.ratingBar4Value = newValue),
                          itemBuilder: (context, index) => Icon(
                            Icons.star_rate_rounded,
                            color: Color(0xFFFFC40C),
                          ),
                          direction: Axis.horizontal,
                          initialRating: _model.ratingBar4Value ??= 0.0,
                          unratedColor: Color(0xFF9E9E9E),
                          itemCount: 5,
                          itemSize: 40.0,
                          glowColor: Color(0xFFFFC40C),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 30.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            if ((_model.ratingBar1Value! >= 1.0) &&
                                (_model.ratingBar2Value! >= 1.0) &&
                                (_model.ratingBar3Value! >= 1.0) &&
                                (_model.ratingBar4Value! >= 1.0)) {
                              final actRatingsUpdateData1 = {
                                'count': FieldValue.increment(1),
                                'raters':
                                    FieldValue.arrayUnion([currentUserUid]),
                              };
                              await columnActRatingsRecord!.reference
                                  .update(actRatingsUpdateData1);
                              Navigator.pop(context);
                            } else {
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    content:
                                        Text('يجب عليك ان تملأ التقييم كاملًا'),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(alertDialogContext),
                                        child: Text('حسنًا'),
                                      ),
                                    ],
                                  );
                                },
                              );
                              return;
                            }

                            if ((_model.ratingBar1Value != null) &&
                                (_model.ratingBar1Value == 1.0)) {
                              final actRatingsUpdateData2 = {
                                'num1': FieldValue.increment(1),
                              };
                              await columnActRatingsRecord!.reference
                                  .update(actRatingsUpdateData2);
                            } else {
                              if ((_model.ratingBar1Value != null) &&
                                  (_model.ratingBar1Value == 2.0)) {
                                final actRatingsUpdateData3 = {
                                  'num2': FieldValue.increment(1),
                                };
                                await columnActRatingsRecord!.reference
                                    .update(actRatingsUpdateData3);
                              } else {
                                if ((_model.ratingBar1Value != null) &&
                                    (_model.ratingBar1Value == 3.0)) {
                                  final actRatingsUpdateData4 = {
                                    'num3': FieldValue.increment(1),
                                  };
                                  await columnActRatingsRecord!.reference
                                      .update(actRatingsUpdateData4);
                                } else {
                                  if ((_model.ratingBar1Value != null) &&
                                      (_model.ratingBar1Value == 4.0)) {
                                    final actRatingsUpdateData5 = {
                                      'num4': FieldValue.increment(1),
                                    };
                                    await columnActRatingsRecord!.reference
                                        .update(actRatingsUpdateData5);
                                  } else {
                                    if ((_model.ratingBar1Value != null) &&
                                        (_model.ratingBar1Value == 5.0)) {
                                      final actRatingsUpdateData6 = {
                                        'num5': FieldValue.increment(1),
                                      };
                                      await columnActRatingsRecord!.reference
                                          .update(actRatingsUpdateData6);
                                    }
                                  }
                                }
                              }
                            }

                            if ((_model.ratingBar2Value != null) &&
                                (_model.ratingBar2Value == 1.0)) {
                              final actRatingsUpdateData7 = {
                                'num2_1': FieldValue.increment(1),
                              };
                              await columnActRatingsRecord!.reference
                                  .update(actRatingsUpdateData7);
                            } else {
                              if ((_model.ratingBar2Value != null) &&
                                  (_model.ratingBar2Value == 2.0)) {
                                final actRatingsUpdateData8 = {
                                  'num2_2': FieldValue.increment(1),
                                };
                                await columnActRatingsRecord!.reference
                                    .update(actRatingsUpdateData8);
                              } else {
                                if ((_model.ratingBar2Value != null) &&
                                    (_model.ratingBar2Value == 3.0)) {
                                  final actRatingsUpdateData9 = {
                                    'num2_3': FieldValue.increment(1),
                                  };
                                  await columnActRatingsRecord!.reference
                                      .update(actRatingsUpdateData9);
                                } else {
                                  if ((_model.ratingBar2Value != null) &&
                                      (_model.ratingBar2Value == 4.0)) {
                                    final actRatingsUpdateData10 = {
                                      'num2_4': FieldValue.increment(1),
                                    };
                                    await columnActRatingsRecord!.reference
                                        .update(actRatingsUpdateData10);
                                  } else {
                                    if ((_model.ratingBar2Value != null) &&
                                        (_model.ratingBar2Value == 5.0)) {
                                      final actRatingsUpdateData11 = {
                                        'num2_5': FieldValue.increment(1),
                                      };
                                      await columnActRatingsRecord!.reference
                                          .update(actRatingsUpdateData11);
                                    }
                                  }
                                }
                              }
                            }

                            if ((_model.ratingBar3Value != null) &&
                                (_model.ratingBar3Value == 1.0)) {
                              final actRatingsUpdateData12 = {
                                'num3_1': FieldValue.increment(1),
                              };
                              await columnActRatingsRecord!.reference
                                  .update(actRatingsUpdateData12);
                            } else {
                              if ((_model.ratingBar3Value != null) &&
                                  (_model.ratingBar3Value == 2.0)) {
                                final actRatingsUpdateData13 = {
                                  'num3_2': FieldValue.increment(1),
                                };
                                await columnActRatingsRecord!.reference
                                    .update(actRatingsUpdateData13);
                              } else {
                                if ((_model.ratingBar3Value != null) &&
                                    (_model.ratingBar3Value == 3.0)) {
                                  final actRatingsUpdateData14 = {
                                    'num3_3': FieldValue.increment(1),
                                  };
                                  await columnActRatingsRecord!.reference
                                      .update(actRatingsUpdateData14);
                                } else {
                                  if ((_model.ratingBar3Value != null) &&
                                      (_model.ratingBar3Value == 4.0)) {
                                    final actRatingsUpdateData15 = {
                                      'num3_4': FieldValue.increment(1),
                                    };
                                    await columnActRatingsRecord!.reference
                                        .update(actRatingsUpdateData15);
                                  } else {
                                    if ((_model.ratingBar3Value != null) &&
                                        (_model.ratingBar3Value == 5.0)) {
                                      final actRatingsUpdateData16 = {
                                        'num3_5': FieldValue.increment(1),
                                      };
                                      await columnActRatingsRecord!.reference
                                          .update(actRatingsUpdateData16);
                                    }
                                  }
                                }
                              }
                            }
                          },
                          text: 'إرسال',
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 50.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: Color(0xFF7EAEBD),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                ),
                            elevation: 2.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
