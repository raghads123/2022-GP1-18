import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'workshops_record.g.dart';

abstract class WorkshopsRecord
    implements Built<WorkshopsRecord, WorkshopsRecordBuilder> {
  static Serializer<WorkshopsRecord> get serializer =>
      _$workshopsRecordSerializer;

  @BuiltValueField(wireName: 'post_photo')
  String? get postPhoto;

  @BuiltValueField(wireName: 'post_title')
  String? get postTitle;

  @BuiltValueField(wireName: 'post_description')
  String? get postDescription;

  @BuiltValueField(wireName: 'time_posted')
  DateTime? get timePosted;

  String? get collage;

  @BuiltValueField(wireName: 'no_sub')
  int? get noSub;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(WorkshopsRecordBuilder builder) => builder
    ..postPhoto = ''
    ..postTitle = ''
    ..postDescription = ''
    ..collage = ''
    ..noSub = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('workshops');

  static Stream<WorkshopsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<WorkshopsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  WorkshopsRecord._();
  factory WorkshopsRecord([void Function(WorkshopsRecordBuilder) updates]) =
      _$WorkshopsRecord;

  static WorkshopsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createWorkshopsRecordData({
  String? postPhoto,
  String? postTitle,
  String? postDescription,
  DateTime? timePosted,
  String? collage,
  int? noSub,
}) {
  final firestoreData = serializers.toFirestore(
    WorkshopsRecord.serializer,
    WorkshopsRecord(
      (w) => w
        ..postPhoto = postPhoto
        ..postTitle = postTitle
        ..postDescription = postDescription
        ..timePosted = timePosted
        ..collage = collage
        ..noSub = noSub,
    ),
  );

  return firestoreData;
}
