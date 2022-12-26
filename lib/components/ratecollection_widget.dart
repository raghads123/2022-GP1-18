import '../flutter_flow/flutter_flow_choice_chips.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RatecollectionWidget extends StatefulWidget {
  const RatecollectionWidget({
    Key? key,
    this.name,
  }) : super(key: key);

  final String? name;

  @override
  _RatecollectionWidgetState createState() => _RatecollectionWidgetState();
}

class _RatecollectionWidgetState extends State<RatecollectionWidget> {
  String? choiceChipsValue;
  double? ratingBar1Value;
  double? ratingBar2Value;
  double? ratingBar3Value;

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Material(
      color: Colors.transparent,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.9,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).platinum,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(0),
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
              child: Text(
                'هل وافقت الفعالية توقعاتك؟',
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Poppins',
                      color: Color(0xFFFF5757),
                      fontSize: 20,
                    ),
              ),
            ),
            RatingBar.builder(
              onRatingUpdate: (newValue) =>
                  setState(() => ratingBar1Value = newValue),
              itemBuilder: (context, index) => Icon(
                Icons.star_rate_rounded,
                color: FlutterFlowTheme.of(context).secondaryColor,
              ),
              direction: Axis.horizontal,
              initialRating: ratingBar1Value ??= 0,
              unratedColor: Color(0xFF9E9E9E),
              itemCount: 5,
              itemSize: 40,
              glowColor: FlutterFlowTheme.of(context).secondaryColor,
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
              child: Text(
                'هل استفدت من الفعالية؟',
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Poppins',
                      color: Color(0xFFFF5757),
                      fontSize: 20,
                    ),
              ),
            ),
            RatingBar.builder(
              onRatingUpdate: (newValue) =>
                  setState(() => ratingBar2Value = newValue),
              itemBuilder: (context, index) => Icon(
                Icons.star_rate_rounded,
                color: FlutterFlowTheme.of(context).secondaryColor,
              ),
              direction: Axis.horizontal,
              initialRating: ratingBar2Value ??= 0,
              unratedColor: Color(0xFF9E9E9E),
              itemCount: 5,
              itemSize: 40,
              glowColor: FlutterFlowTheme.of(context).secondaryColor,
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
              child: Text(
                'كيف كان التنظيم؟',
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Poppins',
                      color: Color(0xFFFF5757),
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
              ),
            ),
            RatingBar.builder(
              onRatingUpdate: (newValue) =>
                  setState(() => ratingBar3Value = newValue),
              itemBuilder: (context, index) => Icon(
                Icons.star_rate_rounded,
                color: FlutterFlowTheme.of(context).secondaryColor,
              ),
              direction: Axis.horizontal,
              initialRating: ratingBar3Value ??= 0,
              unratedColor: Color(0xFF9E9E9E),
              itemCount: 5,
              itemSize: 40,
              glowColor: FlutterFlowTheme.of(context).secondaryColor,
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
              child: Text(
                'هل تقترح هذا النشاط لأشخاص اخرين؟',
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Poppins',
                      color: Color(0xFFFF5757),
                      fontSize: 20,
                    ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 20),
              child: FlutterFlowChoiceChips(
                options: [ChipData('نعم'), ChipData('لا')],
                onChanged: (val) =>
                    setState(() => choiceChipsValue = val?.first),
                selectedChipStyle: ChipStyle(
                  backgroundColor: Color(0xFF323B45),
                  textStyle: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                      ),
                  iconColor: Colors.white,
                  iconSize: 18,
                  elevation: 4,
                ),
                unselectedChipStyle: ChipStyle(
                  backgroundColor: Colors.white,
                  textStyle: FlutterFlowTheme.of(context).bodyText2.override(
                        fontFamily: 'Poppins',
                        color: Color(0xFF323B45),
                      ),
                  iconColor: Color(0xFF323B45),
                  iconSize: 18,
                  elevation: 4,
                ),
                chipSpacing: 20,
                multiselect: false,
                alignment: WrapAlignment.start,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 40),
              child: FFButtonWidget(
                onPressed: () async {
                  Navigator.pop(context);
                },
                text: 'إرسال',
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
      ),
    );
  }
}
