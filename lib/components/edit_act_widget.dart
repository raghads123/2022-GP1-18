import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
  bool isMediaUploading = false;
  String uploadedFileUrl = '';

  TextEditingController? actBioController;
  TextEditingController? actLocController;
  TextEditingController? actNameController;
  DateTime? datePicked;
  TextEditingController? textController4;

  @override
  void initState() {
    super.initState();
    textController4 = TextEditingController();
  }

  @override
  void dispose() {
    actBioController?.dispose();
    actLocController?.dispose();
    actNameController?.dispose();
    textController4?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        shape: BoxShape.rectangle,
        border: Border.all(
          color: FlutterFlowTheme.of(context).backgroundComponents,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                child: Text(
                  'ما الذي تريد ان تقدم طلب بتعديله',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).title1,
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryBtnText,
                borderRadius: BorderRadius.circular(9),
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
                        width: 50,
                        height: 50,
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
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 15, 20, 15),
                          child: Container(
                            width: 400,
                            child: TextFormField(
                              controller: actNameController ??=
                                  TextEditingController(
                                text: formExtraActsRecord!.actName,
                              ),
                              autofocus: true,
                              readOnly: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'اسم نشاط',
                                labelStyle: GoogleFonts.getFont(
                                  'Open Sans',
                                  color: Color(0xFF0283BC),
                                  fontWeight: FontWeight.normal,
                                ),
                                hintStyle: FlutterFlowTheme.of(context)
                                    .bodyText2
                                    .override(
                                      fontFamily: 'Outfit',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.normal,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFF0283BC),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFF0283BC),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                filled: true,
                                fillColor: Color(0xFFF0F0F0),
                              ),
                              style: GoogleFonts.getFont(
                                'Open Sans',
                                color: Color(0xFF565656),
                                fontWeight: FontWeight.normal,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 0, 20, 15),
                          child: Container(
                            width: double.infinity,
                            child: TextFormField(
                              controller: actLocController ??=
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
                                    .bodyText2
                                    .override(
                                      fontFamily: 'Outfit',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.normal,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFF0283BC),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFF0283BC),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(25),
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
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 0, 20, 15),
                          child: Container(
                            width: 400,
                            child: TextFormField(
                              controller: actBioController ??=
                                  TextEditingController(
                                text: formExtraActsRecord!.actDec,
                              ),
                              readOnly: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'وصف النشاط',
                                labelStyle: GoogleFonts.getFont(
                                  'Open Sans',
                                  color: Color(0xFF0283BC),
                                  fontWeight: FontWeight.normal,
                                ),
                                hintStyle: FlutterFlowTheme.of(context)
                                    .bodyText2
                                    .override(
                                      fontFamily: 'Outfit',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.normal,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFF0283BC),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFF0283BC),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                filled: true,
                                fillColor: Color(0xFFF0F0F0),
                              ),
                              style: GoogleFonts.getFont(
                                'Open Sans',
                                color: Color(0xFF565656),
                                fontWeight: FontWeight.normal,
                              ),
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              keyboardType: TextInputType.multiline,
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 0, 20, 15),
                          child: Container(
                            width: 400,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Color(0xFFF0F0F0),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 4,
                                  color: Color(0x33000000),
                                  offset: Offset(0, 2),
                                )
                              ],
                              borderRadius: BorderRadius.circular(25),
                              shape: BoxShape.rectangle,
                              border: Border.all(
                                color: Color(0xFF0283BC),
                                width: 2,
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
                                  setState(() => isMediaUploading = true);
                                  var downloadUrls = <String>[];
                                  try {
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
                                    isMediaUploading = false;
                                  }
                                  if (downloadUrls.length ==
                                      selectedMedia.length) {
                                    setState(() =>
                                        uploadedFileUrl = downloadUrls.first);
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
                                    size: 24,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5, 0, 0, 0),
                                    child: Text(
                                      'شعار النشاط',
                                      textAlign: TextAlign.end,
                                      style: GoogleFonts.getFont(
                                        'Open Sans',
                                        color: Color(0xFF0283BC),
                                        fontWeight: FontWeight.normal,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 0, 20, 15),
                          child: Container(
                            width: 400,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Color(0xFFF0F0F0),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 4,
                                  color: Color(0x33000000),
                                  offset: Offset(0, 2),
                                )
                              ],
                              borderRadius: BorderRadius.circular(25),
                              shape: BoxShape.rectangle,
                              border: Border.all(
                                color: Color(0xFF575F6C),
                                width: 2,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.category_outlined,
                                  color: Color(0xFF57636C),
                                  size: 24,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5, 0, 0, 0),
                                  child: Text(
                                    ' تصنيف النشاط',
                                    textAlign: TextAlign.end,
                                    style: GoogleFonts.getFont(
                                      'Open Sans',
                                      color: Color(0xFF565656),
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 0, 20, 15),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.44,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Color(0xFFF0F0F0),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4,
                                      color: Color(0x33000000),
                                      offset: Offset(0, 2),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(25),
                                  border: Border.all(
                                    color: Color(0xFF0283BC),
                                    width: 2,
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.date_range_outlined,
                                      color: Color(0xFF57636C),
                                      size: 24,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5, 0, 0, 0),
                                      child: Text(
                                        'بداية النشاط',
                                        style: GoogleFonts.getFont(
                                          'Open Sans',
                                          color: Color(0xFF565656),
                                          fontWeight: FontWeight.normal,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.44,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Color(0xFFF0F0F0),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4,
                                      color: Color(0x33000000),
                                      offset: Offset(0, 2),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(25),
                                  border: Border.all(
                                    color: Color(0xFF0283BC),
                                    width: 2,
                                  ),
                                ),
                                child: InkWell(
                                  onTap: () async {
                                    final _datePickedDate =
                                        await showDatePicker(
                                      context: context,
                                      initialDate: formExtraActsRecord!.edate!,
                                      firstDate: formExtraActsRecord!.edate!,
                                      lastDate: DateTime(2050),
                                    );

                                    if (_datePickedDate != null) {
                                      setState(
                                        () => datePicked = DateTime(
                                          _datePickedDate.year,
                                          _datePickedDate.month,
                                          _datePickedDate.day,
                                        ),
                                      );
                                    }
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.date_range_outlined,
                                        color: Color(0xFF57636C),
                                        size: 24,
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5, 0, 0, 0),
                                        child: Text(
                                          'نهاية النشاط',
                                          style: GoogleFonts.getFont(
                                            'Open Sans',
                                            color: Color(0xFF0283BC),
                                            fontWeight: FontWeight.normal,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 0, 20, 15),
                          child: Container(
                            width: 400,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                        ),
                        if (formExtraActsRecord!.seats == true)
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 0, 20, 15),
                            child: Container(
                              decoration: BoxDecoration(),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Container(
                                      width: 400,
                                      child: TextFormField(
                                        controller: textController4,
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
                                                  .bodyText2,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFF0283BC),
                                              width: 2,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(25),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFF0283BC),
                                              width: 2,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(25),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 2,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(25),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 2,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(25),
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
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 40),
                          child: FFButtonWidget(
                            onPressed: () async {
                              if ((actLocController?.text ?? '') != null &&
                                  (actLocController?.text ?? '') != '') {
                                final extraActsUpdateData =
                                    createExtraActsRecordData(
                                  actLoc: actLocController?.text ?? '',
                                );
                                await formExtraActsRecord!.reference
                                    .update(extraActsUpdateData);
                              }
                              if (isMediaUploading) {
                                final extraActsUpdateData =
                                    createExtraActsRecordData(
                                  actPic: uploadedFileUrl,
                                );
                                await formExtraActsRecord!.reference
                                    .update(extraActsUpdateData);
                              }
                              if (datePicked != null) {
                                final extraActsUpdateData =
                                    createExtraActsRecordData(
                                  edate: datePicked,
                                );
                                await formExtraActsRecord!.reference
                                    .update(extraActsUpdateData);
                              }
                              if (textController4!.text != null &&
                                  textController4!.text != '') {
                                final extraActsUpdateData =
                                    createExtraActsRecordData(
                                  numSeats: int.tryParse(textController4!.text),
                                );
                                await formExtraActsRecord!.reference
                                    .update(extraActsUpdateData);
                              }

                              final extraActsUpdateData =
                                  createExtraActsRecordData(
                                status: 'معلق',
                              );
                              await formExtraActsRecord!.reference
                                  .update(extraActsUpdateData);
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
                              width: 270,
                              height: 50,
                              color: Color(0xFF1C8EC1),
                              textStyle: FlutterFlowTheme.of(context)
                                  .subtitle1
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                  ),
                              elevation: 2,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
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
