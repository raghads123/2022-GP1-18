import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditActWidget extends StatefulWidget {
  const EditActWidget({
    Key? key,
    this.actname,
  }) : super(key: key);

  final String? actname;

  @override
  _EditActWidgetState createState() => _EditActWidgetState();
}

class _EditActWidgetState extends State<EditActWidget> {
  TextEditingController? textController1;
  bool? actNameValue;
  TextEditingController? textController2;
  bool? actdesValue;
  TextEditingController? textController3;
  bool? actDateValue;
  TextEditingController? textController4;
  bool? actLocValue;
  TextEditingController? textController5;
  bool? numSeatsValue;

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    textController3 = TextEditingController();
    textController4 = TextEditingController();
    textController5 = TextEditingController();
  }

  @override
  void dispose() {
    textController1?.dispose();
    textController2?.dispose();
    textController3?.dispose();
    textController4?.dispose();
    textController5?.dispose();
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
              Text(
                'ما الذي تريد ان تقدم طلب بتعديله',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).title2.override(
                      fontFamily: 'Poppins',
                      color: FlutterFlowTheme.of(context).primaryColor,
                    ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Theme(
                  data: ThemeData(
                    unselectedWidgetColor: Color(0xFF95A1AC),
                  ),
                  child: CheckboxListTile(
                    value: actNameValue ??= false,
                    onChanged: (newValue) async {
                      setState(() => actNameValue = newValue!);
                    },
                    title: Text(
                      'اسم النشاط',
                      style: FlutterFlowTheme.of(context).title3,
                    ),
                    tileColor: Color(0xFFF5F5F5),
                    activeColor: FlutterFlowTheme.of(context).primaryColor,
                    dense: false,
                    controlAffinity: ListTileControlAffinity.leading,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              if (actNameValue == true)
                Expanded(
                  child: TextFormField(
                    controller: textController1,
                    autofocus: true,
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: 'ادخل المعلومات الجديدة',
                      hintStyle: FlutterFlowTheme.of(context).bodyText2,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                      errorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                      focusedErrorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                    ),
                    style: FlutterFlowTheme.of(context).bodyText1,
                  ),
                ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                  child: Theme(
                    data: ThemeData(
                      unselectedWidgetColor: Color(0xFF95A1AC),
                    ),
                    child: CheckboxListTile(
                      value: actdesValue ??= false,
                      onChanged: (newValue) async {
                        setState(() => actdesValue = newValue!);
                      },
                      title: Text(
                        'وصف النشاط',
                        style: FlutterFlowTheme.of(context).title3,
                      ),
                      tileColor: Color(0xFFF5F5F5),
                      activeColor: FlutterFlowTheme.of(context).primaryColor,
                      dense: false,
                      controlAffinity: ListTileControlAffinity.leading,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
              ),
              if (actdesValue == true)
                Expanded(
                  child: TextFormField(
                    controller: textController2,
                    autofocus: true,
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: 'ادخل المعلومات الجديدة',
                      hintStyle: FlutterFlowTheme.of(context).bodyText2,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                      errorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                      focusedErrorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                    ),
                    style: FlutterFlowTheme.of(context).bodyText1,
                  ),
                ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                  child: Theme(
                    data: ThemeData(
                      unselectedWidgetColor: Color(0xFF95A1AC),
                    ),
                    child: CheckboxListTile(
                      value: actDateValue ??= false,
                      onChanged: (newValue) async {
                        setState(() => actDateValue = newValue!);
                      },
                      title: Text(
                        'مدة النشاط',
                        style: FlutterFlowTheme.of(context).title3,
                      ),
                      tileColor: Color(0xFFF5F5F5),
                      activeColor: FlutterFlowTheme.of(context).primaryColor,
                      dense: false,
                      controlAffinity: ListTileControlAffinity.leading,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
              ),
              if (actDateValue == true)
                Expanded(
                  child: TextFormField(
                    controller: textController3,
                    autofocus: true,
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: 'ادخل المعلومات الجديدة',
                      hintStyle: FlutterFlowTheme.of(context).bodyText2,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                      errorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                      focusedErrorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                    ),
                    style: FlutterFlowTheme.of(context).bodyText1,
                    keyboardType: TextInputType.datetime,
                  ),
                ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                  child: Theme(
                    data: ThemeData(
                      unselectedWidgetColor: Color(0xFF95A1AC),
                    ),
                    child: CheckboxListTile(
                      value: actLocValue ??= false,
                      onChanged: (newValue) async {
                        setState(() => actLocValue = newValue!);
                      },
                      title: Text(
                        'موقع النشاط',
                        style: FlutterFlowTheme.of(context).title3,
                      ),
                      tileColor: Color(0xFFF5F5F5),
                      activeColor: FlutterFlowTheme.of(context).primaryColor,
                      dense: false,
                      controlAffinity: ListTileControlAffinity.leading,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
              ),
              if (actLocValue == true)
                Expanded(
                  child: TextFormField(
                    controller: textController4,
                    autofocus: true,
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: 'ادخل المعلومات الجديدة',
                      hintStyle: FlutterFlowTheme.of(context).bodyText2,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                      errorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                      focusedErrorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                    ),
                    style: FlutterFlowTheme.of(context).bodyText1,
                  ),
                ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                  child: Theme(
                    data: ThemeData(
                      unselectedWidgetColor: Color(0xFF95A1AC),
                    ),
                    child: CheckboxListTile(
                      value: numSeatsValue ??= false,
                      onChanged: (newValue) async {
                        setState(() => numSeatsValue = newValue!);
                      },
                      title: Text(
                        'عدد المقاعد',
                        style: FlutterFlowTheme.of(context).title3,
                      ),
                      tileColor: Color(0xFFF5F5F5),
                      activeColor: FlutterFlowTheme.of(context).primaryColor,
                      dense: false,
                      controlAffinity: ListTileControlAffinity.leading,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
              ),
              if (numSeatsValue == true)
                Expanded(
                  child: TextFormField(
                    controller: textController5,
                    autofocus: true,
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: 'ادخل المعلومات الجديدة',
                      hintStyle: FlutterFlowTheme.of(context).bodyText2,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                      errorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                      focusedErrorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                    ),
                    style: FlutterFlowTheme.of(context).bodyText1,
                    keyboardType: TextInputType.number,
                  ),
                ),
            ],
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 40),
            child: FFButtonWidget(
              onPressed: () {
                print('Button pressed ...');
              },
              text: 'إرسال طلب التعديل',
              options: FFButtonOptions(
                width: 270,
                height: 50,
                color: Color(0xFF1C8EC1),
                textStyle: FlutterFlowTheme.of(context).subtitle1.override(
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
  }
}
