import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
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

    _model.textController2 ??= TextEditingController();
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
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 30.0, 20.0, 0.0),
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
          Expanded(
            child: Container(
              width: double.infinity,
              height: double.infinity,
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
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                  color: Color(0xFF0283BC),
                                  fontWeight: FontWeight.normal,
                                ),
                                hintStyle: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      fontFamily: 'Outfit',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFF0283BC),
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                                filled: true,
                                fillColor: Color(0xFFF0F0F0),
                              ),
                              style: GoogleFonts.getFont(
                                'Open Sans',
                                color: Color(0xFF1C8EC1),
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
                          child: Container(
                            width: double.infinity,
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: Color(0xFFF0F0F0),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 4.0,
                                  color: Color(0x33000000),
                                  offset: Offset(0.0, 2.0),
                                )
                              ],
                              borderRadius: BorderRadius.circular(25.0),
                              shape: BoxShape.rectangle,
                              border: Border.all(
                                color: Color(0xFF0283BC),
                                width: 2.0,
                              ),
                            ),
                            child: InkWell(
                              onTap: () async {
                                final selectedMedia =
                                    await selectMediaWithSourceBottomSheet(
                                  context: context,
                                  allowPhoto: true,
                                );
                                if (selectedMedia != null &&
                                    selectedMedia.every((m) =>
                                        validateFileFormat(
                                            m.storagePath, context))) {
                                  setState(() => _model.isDataUploading = true);
                                  var selectedUploadedFiles =
                                      <FFUploadedFile>[];
                                  var downloadUrls = <String>[];
                                  try {
                                    selectedUploadedFiles = selectedMedia
                                        .map((m) => FFUploadedFile(
                                              name:
                                                  m.storagePath.split('/').last,
                                              bytes: m.bytes,
                                              height: m.dimensions?.height,
                                              width: m.dimensions?.width,
                                            ))
                                        .toList();

                                    downloadUrls = (await Future.wait(
                                      selectedMedia.map(
                                        (m) async => await uploadData(
                                            m.storagePath, m.bytes),
                                      ),
                                    ))
                                        .where((u) => u != null)
                                        .map((u) => u!)
                                        .toList();
                                  } finally {
                                    _model.isDataUploading = false;
                                  }
                                  if (selectedUploadedFiles.length ==
                                          selectedMedia.length &&
                                      downloadUrls.length ==
                                          selectedMedia.length) {
                                    setState(() {
                                      _model.uploadedLocalFile =
                                          selectedUploadedFiles.first;
                                      _model.uploadedFileUrl =
                                          downloadUrls.first;
                                    });
                                  } else {
                                    setState(() {});
                                    return;
                                  }
                                }
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.image_outlined,
                                    color: Color(0xFF57636C),
                                    size: 24.0,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'شعار النشاط',
                                      textAlign: TextAlign.end,
                                      style: GoogleFonts.getFont(
                                        'Open Sans',
                                        color: Color(0xFF0283BC),
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
                                    color: Color(0xFFF0F0F0),
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 4.0,
                                        color: Color(0x33000000),
                                        offset: Offset(0.0, 2.0),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(25.0),
                                    border: Border.all(
                                      color: Color(0xFF0283BC),
                                      width: 2.0,
                                    ),
                                  ),
                                  child: InkWell(
                                    onTap: () async {
                                      final _datePickedDate =
                                          await showDatePicker(
                                        context: context,
                                        initialDate:
                                            formExtraActsRecord!.edate!,
                                        firstDate: formExtraActsRecord!.edate!,
                                        lastDate: DateTime(2050),
                                      );

                                      if (_datePickedDate != null) {
                                        setState(() {
                                          _model.datePicked = DateTime(
                                            _datePickedDate.year,
                                            _datePickedDate.month,
                                            _datePickedDate.day,
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
                                              color: Color(0xFF0283BC),
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
                                          controller: _model.textController2,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText: 'عدد المقاعد',
                                            labelStyle: GoogleFonts.getFont(
                                              'Open Sans',
                                              color: Color(0xFF0283BC),
                                              fontWeight: FontWeight.normal,
                                            ),
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmall,
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0xFF0283BC),
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
                                            fillColor: Color(0xFFF0F0F0),
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
                              if (_model.isDataUploading) {
                                final extraActsUpdateData2 =
                                    createExtraActsRecordData(
                                  actPic: _model.uploadedFileUrl,
                                );
                                await formExtraActsRecord!.reference
                                    .update(extraActsUpdateData2);
                              }
                              if (_model.datePicked != null) {
                                final extraActsUpdateData3 =
                                    createExtraActsRecordData(
                                  edate: _model.datePicked,
                                );
                                await formExtraActsRecord!.reference
                                    .update(extraActsUpdateData3);
                              }
                              if (_model.textController2.text != null &&
                                  _model.textController2.text != '') {
                                final extraActsUpdateData4 =
                                    createExtraActsRecordData(
                                  numSeats:
                                      int.tryParse(_model.textController2.text),
                                );
                                await formExtraActsRecord!.reference
                                    .update(extraActsUpdateData4);
                              }

                              final extraActsUpdateData5 =
                                  createExtraActsRecordData(
                                status: 'معلق',
                              );
                              await formExtraActsRecord!.reference
                                  .update(extraActsUpdateData5);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'لقد تم تقديم طلب تعديلك بنجاح',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor: Color(0x00000000),
                                ),
                              );
                              Navigator.pop(context);
                            },
                            text: 'إرسال طلب التعديل',
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
          ),
        ],
      ),
    );
  }
}
