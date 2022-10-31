import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class UserRatingsWidget extends StatefulWidget {
  const UserRatingsWidget({
    Key? key,
    this.actname,
  }) : super(key: key);

  final String? actname;

  @override
  _UserRatingsWidgetState createState() => _UserRatingsWidgetState();
}

class _UserRatingsWidgetState extends State<UserRatingsWidget> {
  double? ratingBarValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: StreamBuilder<List<ExtraActsRecord>>(
            stream: queryExtraActsRecord(
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
                      color: FlutterFlowTheme.of(context).primaryColor,
                    ),
                  ),
                );
              }
              List<ExtraActsRecord> columnExtraActsRecordList = snapshot.data!;
              // Return an empty Container when the document does not exist.
              if (snapshot.data!.isEmpty) {
                return Container();
              }
              final columnExtraActsRecord = columnExtraActsRecordList.isNotEmpty
                  ? columnExtraActsRecordList.first
                  : null;
              return Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(100, 0, 0, 0),
                        child: SelectionArea(
                            child: Text(
                          'Rate thease criterias',
                          style: FlutterFlowTheme.of(context).subtitle1,
                        )),
                      ),
                    ],
                  ),
                  Expanded(
                    child: StreamBuilder<List<ExtraActsRecord>>(
                      stream: queryExtraActsRecord(
                        queryBuilder: (extraActsRecord) => extraActsRecord
                            .where('Act_name', isEqualTo: widget.actname),
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
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                              ),
                            ),
                          );
                        }
                        List<ExtraActsRecord> listViewExtraActsRecordList =
                            snapshot.data!;
                        // Return an empty Container when the document does not exist.
                        if (snapshot.data!.isEmpty) {
                          return Container();
                        }
                        final listViewExtraActsRecord =
                            listViewExtraActsRecordList.isNotEmpty
                                ? listViewExtraActsRecordList.first
                                : null;
                        return Builder(
                          builder: (context) {
                            final ratingList =
                                listViewExtraActsRecord!.rateCr!.toList();
                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: ratingList.length,
                              itemBuilder: (context, ratingListIndex) {
                                final ratingListItem =
                                    ratingList[ratingListIndex];
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 50, 0, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      RatingBar.builder(
                                        onRatingUpdate: (newValue) => setState(
                                            () => ratingBarValue = newValue),
                                        itemBuilder: (context, index) => Icon(
                                          Icons.grade,
                                          color: Color(0x9D22CAFE),
                                        ),
                                        direction: Axis.horizontal,
                                        initialRating: ratingBarValue ??= 0,
                                        unratedColor: Color(0xFF9E9E9E),
                                        itemCount: 5,
                                        itemSize: 30,
                                        glowColor: Color(0x9D22CAFE),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20, 20, 20, 20),
                                        child: SelectionArea(
                                            child: Text(
                                          ratingListItem,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1,
                                        )),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        );
                      },
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
