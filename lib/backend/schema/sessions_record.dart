import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'sessions_record.g.dart';

abstract class SessionsRecord
    implements Built<SessionsRecord, SessionsRecordBuilder> {
  static Serializer<SessionsRecord> get serializer =>
      _$sessionsRecordSerializer;

  String? get name;

  String? get description;

  @BuiltValueField(wireName: 'created_at')
  DateTime? get createdAt;

  @BuiltValueField(wireName: 'modified_at')
  DateTime? get modifiedAt;

  bool? get finished;

  int? get chairs;

  String? get collage;

  bool? get open;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(SessionsRecordBuilder builder) => builder
    ..name = ''
    ..description = ''
    ..finished = false
    ..chairs = 0
    ..collage = ''
    ..open = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('sessions');

  static Stream<SessionsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<SessionsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  SessionsRecord._();
  factory SessionsRecord([void Function(SessionsRecordBuilder) updates]) =
      _$SessionsRecord;

  static SessionsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createSessionsRecordData({
  String? name,
  String? description,
  DateTime? createdAt,
  DateTime? modifiedAt,
  bool? finished,
  int? chairs,
  String? collage,
  bool? open,
}) {
  final firestoreData = serializers.toFirestore(
    SessionsRecord.serializer,
    SessionsRecord(
      (s) => s
        ..name = name
        ..description = description
        ..createdAt = createdAt
        ..modifiedAt = modifiedAt
        ..finished = finished
        ..chairs = chairs
        ..collage = collage
        ..open = open,
    ),
  );

  return firestoreData;
}
