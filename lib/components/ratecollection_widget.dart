import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
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
                    .where('act_name', isEqualTo: widget.ratingactID),
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
                // Return an empty Container when the item does not exist.
                if (snapshot.data!.isEmpty) {
                  return Container();
                }
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
                          'هل وافقت الفعالية توقعاتك؟',
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
                          'هل استفدت من الفعالية؟',
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
                          'كيف كان التنظيم؟',
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
                          'مدى إقتراحك النشاط لأشخاص اخرين؟',
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
                            Navigator.pop(context);

                            final actRatingsUpdateData = {
                              'c1': functions.rateSave(
                                  columnActRatingsRecord!.c1!.toList(),
                                  _model.ratingBar1Value!.round()),
                              'rate_count': FieldValue.increment(1),
                              'c2': functions.rateSave(
                                  columnActRatingsRecord!.c2!.toList(),
                                  _model.ratingBar2Value!.round()),
                              'c3': functions.rateSave(
                                  columnActRatingsRecord!.c3!.toList(),
                                  _model.ratingBar3Value!.round()),
                            };
                            await columnActRatingsRecord!.reference
                                .update(actRatingsUpdateData);
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
                      Builder(
                        builder: (context) {
                          final c1 = columnActRatingsRecord!.c1!
                              .toList()
                              .take(6)
                              .toList();
                          return Row(
                            mainAxisSize: MainAxisSize.max,
                            children: List.generate(c1.length, (c1Index) {
                              final c1Item = c1[c1Index];
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    4.0, 4.0, 4.0, 4.0),
                                child: Text(
                                  c1Item.toString(),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                              );
                            }),
                          );
                        },
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                4.0, 4.0, 4.0, 4.0),
                            child: Text(
                              columnActRatingsRecord!.rateCount!.toString(),
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                          ),
                        ],
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
