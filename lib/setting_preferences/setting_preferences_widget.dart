import '../flutter_flow/flutter_flow_swipeable_stack.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swipeable_card_stack/swipeable_card_stack.dart';

class SettingPreferencesWidget extends StatefulWidget {
  const SettingPreferencesWidget({Key? key}) : super(key: key);

  @override
  _SettingPreferencesWidgetState createState() =>
      _SettingPreferencesWidgetState();
}

class _SettingPreferencesWidgetState extends State<SettingPreferencesWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late SwipeableCardSectionController swipeableStackController;

  @override
  void initState() {
    super.initState();
    swipeableStackController = SwipeableCardSectionController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: Color(0xFFFF5757),
        automaticallyImplyLeading: false,
        title: Text(
          'what are your preferences?',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 22,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: FlutterFlowSwipeableStack(
                  topCardHeightFraction: 0.72,
                  middleCardHeightFraction: 0.68,
                  botttomCardHeightFraction: 0.75,
                  topCardWidthFraction: 0.9,
                  middleCardWidthFraction: 0.85,
                  botttomCardWidthFraction: 0.8,
                  onSwipeFn: (index) async {
                    swipeableStackController.triggerSwipeRight();
                  },
                  onLeftSwipe: (index) {},
                  onRightSwipe: (index) {},
                  onUpSwipe: (index) {},
                  onDownSwipe: (index) {},
                  itemBuilder: (context, index) {
                    return [][index]();
                  },
                  itemCount: 0,
                  controller: swipeableStackController,
                  enableSwipeUp: false,
                  enableSwipeDown: false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
