import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../index.dart';
import '../../main.dart';

final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    if (mounted) {
      setState(() => _loading = true);
    }
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          params: parameterData.params,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: Colors.transparent,
          child: Image.asset(
            'assets/images/2logo.JPG',
            fit: BoxFit.contain,
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get params => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'LogIn': ParameterData.none(),
  'HomePage': ParameterData.none(),
  'courses': ParameterData.none(),
  'course_info': (data) async => ParameterData(
        allParams: {
          'courseid': getParameter<String>(data, 'courseid'),
        },
      ),
  'workshops': ParameterData.none(),
  'workshope_info': (data) async => ParameterData(
        allParams: {
          'workshopID': getParameter<String>(data, 'workshopID'),
        },
      ),
  'events': ParameterData.none(),
  'event_info': (data) async => ParameterData(
        allParams: {
          'eventID': getParameter<String>(data, 'eventID'),
        },
      ),
  'Opportunities': ParameterData.none(),
  'Opportunity_apply_form': (data) async => ParameterData(
        allParams: {
          'opportunityID': getParameter<String>(data, 'opportunityID'),
        },
      ),
  'addActivity': ParameterData.none(),
  'addopp': ParameterData.none(),
  'ManageRequests': ParameterData.none(),
  'ManageRequestDetails': (data) async => ParameterData(
        allParams: {
          'actsdetails': getParameter<String>(data, 'actsdetails'),
        },
      ),
  'unauthpage': ParameterData.none(),
  'MyActivites': ParameterData.none(),
  'MyActDetails': (data) async => ParameterData(
        allParams: {
          'actsdetails': getParameter<String>(data, 'actsdetails'),
        },
      ),
  'MyOppDetails': (data) async => ParameterData(
        allParams: {
          'opportunityID': getParameter<String>(data, 'opportunityID'),
        },
      ),
  'profile': ParameterData.none(),
  'ManageRequestDetailsCopy': (data) async => ParameterData(
        allParams: {
          'actsdetails': getParameter<String>(data, 'actsdetails'),
        },
      ),
  'profile': ParameterData.none(),
  'ManageRequestDetailsCopy': (data) async => ParameterData(
        allParams: {
          'actsdetails': getParameter<String>(data, 'actsdetails'),
        },
      ),
  'passwordreset': ParameterData.none(),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
