import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'events_record.g.dart';

abstract class EventsRecord
    implements Built<EventsRecord, EventsRecordBuilder> {
  static Serializer<EventsRecord> get serializer => _$eventsRecordSerializer;

  @BuiltValueField(wireName: 'event_name')
  String? get eventName;

  @BuiltValueField(wireName: 'event_des')
  String? get eventDes;

  @BuiltValueField(wireName: 'events_photo')
  String? get eventsPhoto;

  @BuiltValueField(wireName: 'clube_created')
  String? get clubeCreated;

  @BuiltValueField(wireName: 'start_date')
  DateTime? get startDate;

  @BuiltValueField(wireName: 'end_date')
  DateTime? get endDate;

  String? get place;

  bool? get available;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(EventsRecordBuilder builder) => builder
    ..eventName = ''
    ..eventDes = ''
    ..eventsPhoto = ''
    ..clubeCreated = ''
    ..place = ''
    ..available = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('events');

  static Stream<EventsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<EventsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  EventsRecord._();
  factory EventsRecord([void Function(EventsRecordBuilder) updates]) =
      _$EventsRecord;

  static EventsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createEventsRecordData({
  String? eventName,
  String? eventDes,
  String? eventsPhoto,
  String? clubeCreated,
  DateTime? startDate,
  DateTime? endDate,
  String? place,
  bool? available,
}) {
  final firestoreData = serializers.toFirestore(
    EventsRecord.serializer,
    EventsRecord(
      (e) => e
        ..eventName = eventName
        ..eventDes = eventDes
        ..eventsPhoto = eventsPhoto
        ..clubeCreated = clubeCreated
        ..startDate = startDate
        ..endDate = endDate
        ..place = place
        ..available = available,
    ),
  );

  return firestoreData;
}
