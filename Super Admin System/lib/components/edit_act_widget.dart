import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'edit_act_model.dart';
export 'edit_act_model.dart';

class EditActWidget extends StatefulWidget {
  const EditActWidget({
    Key? key,
    this.actID,
  }) : super(key: key);

  final String? actID;

  @override
  _EditActWidgetState createState() => _EditActWidgetState();
}

class _EditActWidgetState extends State<EditActWidget> {
  late EditActModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditActModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: 590.0,
      decoration: BoxDecoration(
        color: Color(0xFFF4F3F0),
        boxShadow: [
          BoxShadow(
            blurRadius: 4.0,
            color: Color(0x33000000),
            offset: Offset(0.0, 2.0),
          )
        ],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(50.0),
          topRight: Radius.circular(50.0),
        ),
        shape: BoxShape.rectangle,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 30.0, 20.0, 15.0),
                    child: Text(
                      'يمكنك تقديم طلب لتعديل المعلومات أدناه',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).displaySmall.override(
                            fontFamily: 'Poppins',
                            color: Color(0xFF7EAEBD),
                          ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              height: 590.0,
              decoration: BoxDecoration(
                color: Color(0xFFF4F3F0),
                borderRadius: BorderRadius.circular(9.0),
              ),
              child: StreamBuilder<List<ExtraActsRecord>>(
                stream: queryExtraActsRecord(
                  queryBuilder: (extraActsRecord) =>
                      extraActsRecord.where('Act_ID', isEqualTo: widget.actID),
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
                  List<ExtraActsRecord> formExtraActsRecordList =
                      snapshot.data!;
                  // Return an empty Container when the item does not exist.
                  if (snapshot.data!.isEmpty) {
                    return Container();
                  }
                  final formExtraActsRecord = formExtraActsRecordList.isNotEmpty
                      ? formExtraActsRecordList.first
                      : null;
                  return SingleChildScrollView(
                    primary: false,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 15.0),
                          child: Container(
                            width: double.infinity,
                            child: TextFormField(
                              controller: _model.actLocController ??=
                                  TextEditingController(
                                text: formExtraActsRecord!.actLoc,
                              ),
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'موقع النشاط',
                                labelStyle: GoogleFonts.getFont(
                                  'Open Sans',
                                  color: Color(0xFF565656),
                                  fontWeight: FontWeight.normal,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                                filled: true,
                                fillColor: Color(0xFFE1D7C6),
                              ),
                              style: GoogleFonts.getFont(
                                'Open Sans',
                                color: Color(0xFF565656),
                                fontWeight: FontWeight.normal,
                              ),
                              textAlign: TextAlign.start,
                              maxLines: null,
                              keyboardType: TextInputType.multiline,
                              validator: _model.actLocControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 15.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.44,
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFE1D7C6),
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 4.0,
                                        color: Color(0x33000000),
                                        offset: Offset(0.0, 2.0),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                  child: InkWell(
                                    onTap: () async {
                                      final _datePicked1Date =
                                          await showDatePicker(
                                        context: context,
                                        initialDate:
                                            formExtraActsRecord!.sdate!,
                                        firstDate: formExtraActsRecord!.sdate!,
                                        lastDate: DateTime(2050),
                                      );

                                      if (_datePicked1Date != null) {
                                        setState(() {
                                          _model.datePicked1 = DateTime(
                                            _datePicked1Date.year,
                                            _datePicked1Date.month,
                                            _datePicked1Date.day,
                                          );
                                        });
                                      }
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.date_range_outlined,
                                          color: Color(0xFF57636C),
                                          size: 24.0,
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            'بداية النشاط',
                                            style: GoogleFonts.getFont(
                                              'Open Sans',
                                              color: Color(0xFF565656),
                                              fontWeight: FontWeight.normal,
                                              fontSize: 16.0,
                                            ),
                                          ),
                                        ),
                                        if (_model.datePicked1 != null)
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              dateTimeFormat(
                                                'M/d h:mm a',
                                                _model.datePicked1,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              ),
                                              style: GoogleFonts.getFont(
                                                'Open Sans',
                                                color: Color(0xFF7EAEBD),
                                                fontWeight: FontWeight.normal,
                                                fontSize: 16.0,
                                              ),
                                            ),
                                          ),
                                        if (_model.datePicked1 == null)
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              dateTimeFormat(
                                                'M/d h:mm a',
                                                formExtraActsRecord!.sdate!,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              ),
                                              style: GoogleFonts.getFont(
                                                'Open Sans',
                                                color: Color(0xFF7EAEBD),
                                                fontWeight: FontWeight.normal,
                                                fontSize: 16.0,
                                              ),
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
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 15.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.44,
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFE1D7C6),
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 4.0,
                                        color: Color(0x33000000),
                                        offset: Offset(0.0, 2.0),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                  child: InkWell(
                                    onTap: () async {
                                      final _datePicked2Date =
                                          await showDatePicker(
                                        context: context,
                                        initialDate:
                                            formExtraActsRecord!.edate!,
                                        firstDate: formExtraActsRecord!.edate!,
                                        lastDate: DateTime(2050),
                                      );

                                      if (_datePicked2Date != null) {
                                        setState(() {
                                          _model.datePicked2 = DateTime(
                                            _datePicked2Date.year,
                                            _datePicked2Date.month,
                                            _datePicked2Date.day,
                                          );
                                        });
                                      }
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.date_range_outlined,
                                          color: Color(0xFF57636C),
                                          size: 24.0,
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            'نهاية النشاط',
                                            style: GoogleFonts.getFont(
                                              'Open Sans',
                                              color: Color(0xFF565656),
                                              fontWeight: FontWeight.normal,
                                              fontSize: 16.0,
                                            ),
                                          ),
                                        ),
                                        if (_model.datePicked2 != null)
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              dateTimeFormat(
                                                'M/d h:mm a',
                                                _model.datePicked2,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              ),
                                              style: GoogleFonts.getFont(
                                                'Open Sans',
                                                color: Color(0xFF7EAEBD),
                                                fontWeight: FontWeight.normal,
                                                fontSize: 16.0,
                                              ),
                                            ),
                                          ),
                                        if (_model.datePicked2 == null)
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              dateTimeFormat(
                                                'M/d h:mm a',
                                                formExtraActsRecord!.edate!,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              ),
                                              style: GoogleFonts.getFont(
                                                'Open Sans',
                                                color: Color(0xFF7EAEBD),
                                                fontWeight: FontWeight.normal,
                                                fontSize: 16.0,
                                              ),
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
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 15.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.44,
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFE1D7C6),
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 4.0,
                                        color: Color(0x33000000),
                                        offset: Offset(0.0, 2.0),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(25.0),
                                    border: Border.all(
                                      color: Color(0xFFE1D7C6),
                                    ),
                                  ),
                                  child: InkWell(
                                    onTap: () async {
                                      final _datePicked3Date =
                                          await showDatePicker(
                                        context: context,
                                        initialDate: getCurrentTimestamp,
                                        firstDate: getCurrentTimestamp,
                                        lastDate: DateTime(2050),
                                      );

                                      TimeOfDay? _datePicked3Time;
                                      if (_datePicked3Date != null) {
                                        _datePicked3Time = await showTimePicker(
                                          context: context,
                                          initialTime: TimeOfDay.fromDateTime(
                                              getCurrentTimestamp),
                                        );
                                      }

                                      if (_datePicked3Date != null &&
                                          _datePicked3Time != null) {
                                        setState(() {
                                          _model.datePicked3 = DateTime(
                                            _datePicked3Date.year,
                                            _datePicked3Date.month,
                                            _datePicked3Date.day,
                                            _datePicked3Time!.hour,
                                            _datePicked3Time.minute,
                                          );
                                        });
                                      }
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.date_range_outlined,
                                          color: Color(0xFF57636C),
                                          size: 24.0,
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            'أخر فرصة للإلتحاق',
                                            style: GoogleFonts.getFont(
                                              'Open Sans',
                                              color: Color(0xFF565656),
                                              fontWeight: FontWeight.normal,
                                              fontSize: 16.0,
                                            ),
                                          ),
                                        ),
                                        if (_model.datePicked3 != null)
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              dateTimeFormat(
                                                'M/d h:mm a',
                                                _model.datePicked3,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              ),
                                              style: GoogleFonts.getFont(
                                                'Open Sans',
                                                color: Color(0xFF7EAEBD),
                                                fontWeight: FontWeight.normal,
                                                fontSize: 16.0,
                                              ),
                                            ),
                                          ),
                                        if (_model.datePicked3 == null)
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              dateTimeFormat(
                                                'M/d h:mm a',
                                                formExtraActsRecord!
                                                    .lastD2enroll!,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              ),
                                              style: GoogleFonts.getFont(
                                                'Open Sans',
                                                color: Color(0xFF7EAEBD),
                                                fontWeight: FontWeight.normal,
                                                fontSize: 16.0,
                                              ),
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
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 15.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.44,
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFE1D7C6),
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 4.0,
                                        color: Color(0x33000000),
                                        offset: Offset(0.0, 2.0),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(25.0),
                                    border: Border.all(
                                      color: Color(0xFFE1D7C6),
                                    ),
                                  ),
                                  child: InkWell(
                                    onTap: () async {
                                      final _datePicked4Date =
                                          await showDatePicker(
                                        context: context,
                                        initialDate: getCurrentTimestamp,
                                        firstDate: getCurrentTimestamp,
                                        lastDate: DateTime(2050),
                                      );

                                      TimeOfDay? _datePicked4Time;
                                      if (_datePicked4Date != null) {
                                        _datePicked4Time = await showTimePicker(
                                          context: context,
                                          initialTime: TimeOfDay.fromDateTime(
                                              getCurrentTimestamp),
                                        );
                                      }

                                      if (_datePicked4Date != null &&
                                          _datePicked4Time != null) {
                                        setState(() {
                                          _model.datePicked4 = DateTime(
                                            _datePicked4Date.year,
                                            _datePicked4Date.month,
                                            _datePicked4Date.day,
                                            _datePicked4Time!.hour,
                                            _datePicked4Time.minute,
                                          );
                                        });
                                      }
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.date_range_outlined,
                                          color: Color(0xFF57636C),
                                          size: 24.0,
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            'آخر فرصة لإلغاء الإلتحاق',
                                            style: GoogleFonts.getFont(
                                              'Open Sans',
                                              color: Color(0xFF565656),
                                              fontWeight: FontWeight.normal,
                                              fontSize: 16.0,
                                            ),
                                          ),
                                        ),
                                        if (_model.datePicked4 != null)
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              dateTimeFormat(
                                                'M/d h:mm a',
                                                _model.datePicked4,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              ),
                                              style: GoogleFonts.getFont(
                                                'Open Sans',
                                                color: Color(0xFF7EAEBD),
                                                fontWeight: FontWeight.normal,
                                                fontSize: 16.0,
                                              ),
                                            ),
                                          ),
                                        if (_model.datePicked4 == null)
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              dateTimeFormat(
                                                'M/d h:mm a',
                                                formExtraActsRecord!
                                                    .lastD2disenroll!,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              ),
                                              style: GoogleFonts.getFont(
                                                'Open Sans',
                                                color: Color(0xFF7EAEBD),
                                                fontWeight: FontWeight.normal,
                                                fontSize: 16.0,
                                              ),
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
                        if (formExtraActsRecord!.seats == true)
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 20.0, 15.0),
                            child: Container(
                              decoration: BoxDecoration(),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  if (formExtraActsRecord!.seats ?? true)
                                    Expanded(
                                      child: Container(
                                        width: double.infinity,
                                        child: TextFormField(
                                          controller: _model.textController2 ??=
                                              TextEditingController(
                                            text: formExtraActsRecord!.numSeats
                                                ?.toString(),
                                          ),
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText: 'عدد المقاعد',
                                            labelStyle: GoogleFonts.getFont(
                                              'Open Sans',
                                              color: Color(0xFF565656),
                                              fontWeight: FontWeight.normal,
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(25.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(25.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(25.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(25.0),
                                            ),
                                            filled: true,
                                            fillColor: Color(0xFFE1D7C6),
                                            prefixIcon: Icon(
                                              Icons.event_seat_rounded,
                                            ),
                                          ),
                                          style: GoogleFonts.getFont(
                                            'Open Sans',
                                            color: Color(0xFF565656),
                                            fontWeight: FontWeight.normal,
                                          ),
                                          textAlign: TextAlign.start,
                                          keyboardType: TextInputType.number,
                                          validator: _model
                                              .textController2Validator
                                              .asValidator(context),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 30.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              if (_model.actLocController.text != null &&
                                  _model.actLocController.text != '') {
                                final extraActsUpdateData1 =
                                    createExtraActsRecordData(
                                  actLoc: _model.actLocController.text,
                                );
                                await formExtraActsRecord!.reference
                                    .update(extraActsUpdateData1);
                              }
                              if (_model.datePicked1 != null) {
                                final extraActsUpdateData2 =
                                    createExtraActsRecordData(
                                  sdate: _model.datePicked1,
                                );
                                await formExtraActsRecord!.reference
                                    .update(extraActsUpdateData2);
                              }
                              if (_model.datePicked2 != null) {
                                final extraActsUpdateData3 =
                                    createExtraActsRecordData(
                                  edate: _model.datePicked2,
                                );
                                await formExtraActsRecord!.reference
                                    .update(extraActsUpdateData3);
                              }
                              if (_model.datePicked3 != null) {
                                final extraActsUpdateData4 =
                                    createExtraActsRecordData(
                                  lastD2enroll: _model.datePicked3,
                                );
                                await formExtraActsRecord!.reference
                                    .update(extraActsUpdateData4);
                              }
                              if (_model.datePicked4 != null) {
                                final extraActsUpdateData5 =
                                    createExtraActsRecordData(
                                  lastD2disenroll: _model.datePicked4,
                                );
                                await formExtraActsRecord!.reference
                                    .update(extraActsUpdateData5);
                              }
                              if (formExtraActsRecord!.seats!) {
                                if (_model.textController2.text != null &&
                                    _model.textController2.text != '') {
                                  final extraActsUpdateData6 =
                                      createExtraActsRecordData(
                                    numSeats: int.tryParse(
                                        _model.textController2.text),
                                  );
                                  await formExtraActsRecord!.reference
                                      .update(extraActsUpdateData6);
                                }
                              }
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'لقد تم التعديل بنجاح',
                                    style: TextStyle(
                                      color: Color(0xE1FFFFFF),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor: Color(0xE15BD85B),
                                ),
                              );
                              Navigator.pop(context);
                            },
                            text: 'تعديل',
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
          ],
        ),
      ),
    );
  }
}
