import 'package:add_2_calendar/add_2_calendar.dart';

mixin Utility {
  void addToCalendar({
    required DateTime sdate,
    DateTime? edate,
    String? type,
    String? title,
    String? location,
  }) {
    final Event event = Event(
      title: type ?? '',
      description: title ?? '',
      startDate: sdate,
      endDate: edate ?? sdate,
      location: location,
    );
    Add2Calendar.addEvent2Cal(event);
  }
}
