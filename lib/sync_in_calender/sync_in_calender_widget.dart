import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_calendar.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SyncInCalenderWidget extends StatefulWidget {
  const SyncInCalenderWidget({Key? key}) : super(key: key);

  @override
  _SyncInCalenderWidgetState createState() => _SyncInCalenderWidgetState();
}

class _SyncInCalenderWidgetState extends State<SyncInCalenderWidget> {
  DateTimeRange? calendarSelectedDay;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              FlutterFlowCalendar(
                color: Color(0xFFFF5757),
                weekFormat: false,
                weekStartsMonday: false,
                onChange: (DateTimeRange? newSelectedDate) {
                  setState(() => calendarSelectedDay = newSelectedDate);
                },
                titleStyle: TextStyle(
                  color: FlutterFlowTheme.of(context).backgroundComponents,
                ),
                dayOfWeekStyle: TextStyle(),
                dateStyle: TextStyle(),
                selectedDateStyle: TextStyle(
                  color: FlutterFlowTheme.of(context).backgroundComponents,
                ),
                inactiveDateStyle: TextStyle(),
                locale: FFLocalizations.of(context).languageCode,
              ),
              StreamBuilder<List<ExtraActsRecord>>(
                stream: queryExtraActsRecord(
                  queryBuilder: (extraActsRecord) => extraActsRecord
                      .where('Sdate', isEqualTo: calendarSelectedDay?.start),
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
                  List<ExtraActsRecord> listViewExtraActsRecordList =
                      snapshot.data!;
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: listViewExtraActsRecordList.length,
                    itemBuilder: (context, listViewIndex) {
                      final listViewExtraActsRecord =
                          listViewExtraActsRecordList[listViewIndex];
                      return AuthUserStreamWidget(
                        builder: (context) => Text(
                          (currentUserDocument?.usersActs?.toList() ?? [])
                              .contains(listViewExtraActsRecord.actName)
                              .toString(),
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
