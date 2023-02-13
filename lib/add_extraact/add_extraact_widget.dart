import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../components/category_widget.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import '../flutter_flow/random_data_util.dart' as random_data;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'add_extraact_model.dart';
export 'add_extraact_model.dart';

class AddExtraactWidget extends StatefulWidget {
  const AddExtraactWidget({Key? key}) : super(key: key);

  @override
  _AddExtraactWidgetState createState() => _AddExtraactWidgetState();
}

class _AddExtraactWidgetState extends State<AddExtraactWidget> {
  late AddExtraactModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddExtraactModel());

    _model.actNameController = TextEditingController();
    _model.actLocController = TextEditingController();
    _model.actBioController = TextEditingController();
    _model.textController4 = TextEditingController();
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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          leading: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
            child: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30,
              borderWidth: 1,
              buttonSize: 60,
              icon: Icon(
                Icons.chevron_left,
                color: Color(0xFF777373),
                size: 30,
              ),
              onPressed: () async {
                if (Navigator.of(context).canPop()) {
                  context.pop();
                }
                context.pushNamed('HomePage');
              },
            ),
          ),
          title: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
            child: Text(
              'طلب إضافة نشاط جديد',
              style: FlutterFlowTheme.of(context).title2.override(
                    fontFamily: 'Poppins',
                    color: Color(0xFF777373),
                    fontSize: 22,
                  ),
            ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2,
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
        child: Container(
          width: double.infinity,
          child: Form(
            key: _model.formKey,
            autovalidateMode: AutovalidateMode.disabled,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryBtnText,
                borderRadius: BorderRadius.circular(9),
              ),
              child: SingleChildScrollView(
                primary: false,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 15, 20, 15),
                      child: Container(
                        width: 400,
                        child: TextFormField(
                          controller: _model.actNameController,
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
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
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
                          textAlign: TextAlign.start,
                          validator: _model.actNameControllerValidator
                              .asValidator(context),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 15),
                      child: Container(
                        width: double.infinity,
                        child: TextFormField(
                          controller: _model.actLocController,
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
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
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
                          textAlign: TextAlign.start,
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                          validator: _model.actLocControllerValidator
                              .asValidator(context),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 15),
                      child: Container(
                        width: 400,
                        child: TextFormField(
                          controller: _model.actBioController,
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
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
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
                          textAlign: TextAlign.start,
                          maxLines: 2,
                          keyboardType: TextInputType.multiline,
                          validator: _model.actBioControllerValidator
                              .asValidator(context),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 15),
                      child: FlutterFlowDropDown<String>(
                        options: ['دورة تدريبية', 'ورشة عمل', 'فعالية'],
                        onChanged: (val) =>
                            setState(() => _model.actTypeValue = val),
                        width: 400,
                        height: 50,
                        textStyle: GoogleFonts.getFont(
                          'Open Sans',
                          color: Color(0xFF0283BC),
                          fontWeight: FontWeight.normal,
                        ),
                        hintText: 'نوع النشاط',
                        icon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: Color(0xFF57636C),
                          size: 15,
                        ),
                        fillColor: Color(0xFFF0F0F0),
                        elevation: 2,
                        borderColor: Color(0xFF0283BC),
                        borderWidth: 2,
                        borderRadius: 25,
                        margin: EdgeInsetsDirectional.fromSTEB(24, 4, 12, 4),
                        hidesUnderline: true,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 15),
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
                                selectedMedia.every((m) => validateFileFormat(
                                    m.storagePath, context))) {
                              setState(() => _model.isMediaUploading = true);
                              var selectedUploadedFiles = <FFUploadedFile>[];
                              var downloadUrls = <String>[];
                              try {
                                selectedUploadedFiles = selectedMedia
                                    .map((m) => FFUploadedFile(
                                          name: m.storagePath.split('/').last,
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
                                _model.isMediaUploading = false;
                              }
                              if (selectedUploadedFiles.length ==
                                      selectedMedia.length &&
                                  downloadUrls.length == selectedMedia.length) {
                                setState(() {
                                  _model.uploadedLocalFile =
                                      selectedUploadedFiles.first;
                                  _model.uploadedFileUrl = downloadUrls.first;
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
                                size: 24,
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
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
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 15),
                      child: InkWell(
                        onTap: () async {
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            enableDrag: false,
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding: MediaQuery.of(context).viewInsets,
                                child: CategoryWidget(),
                              );
                            },
                          ).then((value) => setState(() {}));
                        },
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
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                                child: Text(
                                  ' تصنيف النشاط',
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
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 15),
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
                            child: InkWell(
                              onTap: () async {
                                final _datePicked1Date = await showDatePicker(
                                  context: context,
                                  initialDate: getCurrentTimestamp,
                                  firstDate: getCurrentTimestamp,
                                  lastDate: DateTime(2050),
                                );

                                TimeOfDay? _datePicked1Time;
                                if (_datePicked1Date != null) {
                                  _datePicked1Time = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.fromDateTime(
                                        getCurrentTimestamp),
                                  );
                                }

                                if (_datePicked1Date != null &&
                                    _datePicked1Time != null) {
                                  setState(() {
                                    _model.datePicked1 = DateTime(
                                      _datePicked1Date.year,
                                      _datePicked1Date.month,
                                      _datePicked1Date.day,
                                      _datePicked1Time!.hour,
                                      _datePicked1Time.minute,
                                    );
                                  });
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
                                      'بداية النشاط',
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
                                final _datePicked2Date = await showDatePicker(
                                  context: context,
                                  initialDate: getCurrentTimestamp,
                                  firstDate: getCurrentTimestamp,
                                  lastDate: DateTime(2050),
                                );

                                TimeOfDay? _datePicked2Time;
                                if (_datePicked2Date != null) {
                                  _datePicked2Time = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.fromDateTime(
                                        getCurrentTimestamp),
                                  );
                                }

                                if (_datePicked2Date != null &&
                                    _datePicked2Time != null) {
                                  setState(() {
                                    _model.datePicked2 = DateTime(
                                      _datePicked2Date.year,
                                      _datePicked2Date.month,
                                      _datePicked2Date.day,
                                      _datePicked2Time!.hour,
                                      _datePicked2Time.minute,
                                    );
                                  });
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
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 15),
                      child: Container(
                        width: 400,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: Theme(
                            data: ThemeData(
                              checkboxTheme: CheckboxThemeData(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              unselectedWidgetColor: Color(0xFF95A1AC),
                            ),
                            child: CheckboxListTile(
                              value: _model.checkboxListTileValue ??= false,
                              onChanged: (newValue) async {
                                setState(() =>
                                    _model.checkboxListTileValue = newValue!);
                              },
                              title: Text(
                                'المقاعد محددة',
                                textAlign: TextAlign.start,
                                style: GoogleFonts.getFont(
                                  'Open Sans',
                                  color: Color(0xFF0283BC),
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              tileColor: Color(0xFFF0F0F0),
                              activeColor: Color(0xFF0283BC),
                              dense: false,
                              controlAffinity: ListTileControlAffinity.leading,
                            ),
                          ),
                        ),
                      ),
                    ),
                    if (_model.checkboxListTileValue == true)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 15),
                        child: Container(
                          decoration: BoxDecoration(),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              if (_model.checkboxListTileValue == true)
                                Expanded(
                                  child: Container(
                                    width: 400,
                                    child: TextFormField(
                                      controller: _model.textController4,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'عدد المقاعد',
                                        labelStyle: GoogleFonts.getFont(
                                          'Open Sans',
                                          color: Color(0xFF0283BC),
                                          fontWeight: FontWeight.normal,
                                        ),
                                        hintStyle: FlutterFlowTheme.of(context)
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
                                        focusedErrorBorder: OutlineInputBorder(
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
                                      validator: _model.textController4Validator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                      child: StreamBuilder<List<UsersRecord>>(
                        stream: queryUsersRecord(
                          queryBuilder: (usersRecord) => usersRecord
                              .where('email', isEqualTo: currentUserEmail),
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
                          List<UsersRecord> buttonUsersRecordList =
                              snapshot.data!;
                          // Return an empty Container when the item does not exist.
                          if (snapshot.data!.isEmpty) {
                            return Container();
                          }
                          final buttonUsersRecord =
                              buttonUsersRecordList.isNotEmpty
                                  ? buttonUsersRecordList.first
                                  : null;
                          return FFButtonWidget(
                            onPressed: () async {
                              if (_model.formKey.currentState == null ||
                                  !_model.formKey.currentState!.validate()) {
                                return;
                              }
                              if (_model.actTypeValue == null) {
                                return;
                              }
                              if (_model.datePicked1 == null) {
                                return;
                              }
                              if (_model.datePicked2 == null) {
                                return;
                              }

                              final extraActsCreateData = {
                                ...createExtraActsRecordData(
                                  actType: _model.actTypeValue,
                                  actName: _model.actNameController.text,
                                  actDec: _model.actBioController.text,
                                  actPic: _model.uploadedFileUrl,
                                  status: 'معلق',
                                  sdate: _model.datePicked2,
                                  edate: _model.datePicked1,
                                  actLoc: _model.actLocController.text,
                                  seats: _model.checkboxListTileValue,
                                  numSeats:
                                      int.tryParse(_model.textController4.text),
                                  actProvider: currentUserDisplayName,
                                  actID: random_data.randomString(
                                    20,
                                    20,
                                    true,
                                    true,
                                    true,
                                  ),
                                  actProviderEmail: currentUserEmail,
                                ),
                                'Act_category': FFAppState().ActCategory,
                              };
                              await ExtraActsRecord.collection
                                  .doc()
                                  .set(extraActsCreateData);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'تم ارسال الطلب بنجاح',
                                    style: TextStyle(
                                      color: Color(0xE1FFFFFF),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor: Color(0xE15BD85B),
                                ),
                              );
                            },
                            text: 'إرسال طلب الإضافة',
                            options: FFButtonOptions(
                              width: 270,
                              height: 50,
                              color: Color(0xFF1C8EC1),
                              textStyle: FlutterFlowTheme.of(context)
                                  .subtitle1
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                              elevation: 2,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
