import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SelectionArea(
                          child: Text(
                        'نسعد بتقييمك لنا',
                        textAlign: TextAlign.end,
                        style: FlutterFlowTheme.of(context).subtitle1,
                      )),
                    ],
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
