import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_choice_chips.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 5.5,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(0),
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: SingleChildScrollView(
          primary: false,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                    child: Container(
                      width: 50,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Color(0xFFE0E3E7),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                child: Text(
                  '???? ?????????? ???????????????? ????????????????',
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
                  color: Color(0xFFFFC40C),
                ),
                direction: Axis.horizontal,
                initialRating: ratingBar1Value ??= 0,
                unratedColor: Color(0xFF9E9E9E),
                itemCount: 5,
                itemSize: 40,
                glowColor: Color(0xFFFFC40C),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                child: Text(
                  '???? ???????????? ???? ??????????????????',
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
                  color: Color(0xFFFFC40C),
                ),
                direction: Axis.horizontal,
                initialRating: ratingBar2Value ??= 0,
                unratedColor: Color(0xFF9E9E9E),
                itemCount: 5,
                itemSize: 40,
                glowColor: Color(0xFFFFC40C),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                child: Text(
                  '?????? ?????? ????????????????',
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
                  color: Color(0xFFFFC40C),
                ),
                direction: Axis.horizontal,
                initialRating: ratingBar3Value ??= 0,
                unratedColor: Color(0xFF9E9E9E),
                itemCount: 5,
                itemSize: 40,
                glowColor: Color(0xFFFFC40C),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                child: Text(
                  '???? ?????????? ?????? ???????????? ???????????? ????????????',
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
                  options: [ChipData('??????'), ChipData('????')],
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

                    final ratingCreateData = createRatingRecordData(
                      actID: widget.ratingactID,
                      rating: ratingBar1Value?.round(),
                      useremail: currentUserEmail,
                      actType: widget.ratingtype,
                    );
                    await RatingRecord.collection.doc().set(ratingCreateData);
                  },
                  text: '??????????',
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
      ),
    );
  }
}
