import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'act_ratings_record.g.dart';

abstract class ActRatingsRecord
    implements Built<ActRatingsRecord, ActRatingsRecordBuilder> {
  static Serializer<ActRatingsRecord> get serializer =>
      _$actRatingsRecordSerializer;

  int? get num1;

  int? get num2;

  int? get num3;

  int? get num4;

  int? get num5;

  @BuiltValueField(wireName: 'act_id')
  String? get actId;

  int? get count;

  @BuiltValueField(wireName: 'num2_1')
  int? get num21;

  @BuiltValueField(wireName: 'num2_2')
  int? get num22;

  @BuiltValueField(wireName: 'num2_3')
  int? get num23;

  @BuiltValueField(wireName: 'num2_4')
  int? get num24;

  @BuiltValueField(wireName: 'num2_5')
  int? get num25;

  @BuiltValueField(wireName: 'num3_1')
  int? get num31;

  @BuiltValueField(wireName: 'num3_2')
  int? get num32;

  @BuiltValueField(wireName: 'num3_3')
  int? get num33;

  @BuiltValueField(wireName: 'num3_4')
  int? get num34;

  @BuiltValueField(wireName: 'num3_5')
  int? get num35;

  BuiltList<String>? get raters;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ActRatingsRecordBuilder builder) => builder
    ..num1 = 0
    ..num2 = 0
    ..num3 = 0
    ..num4 = 0
    ..num5 = 0
    ..actId = ''
    ..count = 0
    ..num21 = 0
    ..num22 = 0
    ..num23 = 0
    ..num24 = 0
    ..num25 = 0
    ..num31 = 0
    ..num32 = 0
    ..num33 = 0
    ..num34 = 0
    ..num35 = 0
    ..raters = ListBuilder();

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
  int? num1,
  int? num2,
  int? num3,
  int? num4,
  int? num5,
  String? actId,
  int? count,
  int? num21,
  int? num22,
  int? num23,
  int? num24,
  int? num25,
  int? num31,
  int? num32,
  int? num33,
  int? num34,
  int? num35,
}) {
  final firestoreData = serializers.toFirestore(
    ActRatingsRecord.serializer,
    ActRatingsRecord(
      (a) => a
        ..num1 = num1
        ..num2 = num2
        ..num3 = num3
        ..num4 = num4
        ..num5 = num5
        ..actId = actId
        ..count = count
        ..num21 = num21
        ..num22 = num22
        ..num23 = num23
        ..num24 = num24
        ..num25 = num25
        ..num31 = num31
        ..num32 = num32
        ..num33 = num33
        ..num34 = num34
        ..num35 = num35
        ..raters = null,
    ),
  );

  return firestoreData;
}
