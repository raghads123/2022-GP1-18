import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'act_ratings_record.g.dart';

abstract class ActRatingsRecord
    implements Built<ActRatingsRecord, ActRatingsRecordBuilder> {
  static Serializer<ActRatingsRecord> get serializer =>
      _$actRatingsRecordSerializer;

  BuiltList<int>? get c1;

  BuiltList<int>? get c2;

  BuiltList<int>? get c3;

  @BuiltValueField(wireName: 'rate_count')
  int? get rateCount;

  @BuiltValueField(wireName: 'act_name')
  String? get actName;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ActRatingsRecordBuilder builder) => builder
    ..c1 = ListBuilder()
    ..c2 = ListBuilder()
    ..c3 = ListBuilder()
    ..rateCount = 0
    ..actName = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('act_ratings');

  static Stream<ActRatingsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ActRatingsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ActRatingsRecord._();
  factory ActRatingsRecord([void Function(ActRatingsRecordBuilder) updates]) =
      _$ActRatingsRecord;

  static ActRatingsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createActRatingsRecordData({
  int? rateCount,
  String? actName,
}) {
  final firestoreData = serializers.toFirestore(
    ActRatingsRecord.serializer,
    ActRatingsRecord(
      (a) => a
        ..c1 = null
        ..c2 = null
        ..c3 = null
        ..rateCount = rateCount
        ..actName = actName,
    ),
  );

  return firestoreData;
}
