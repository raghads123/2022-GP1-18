import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'rating_record.g.dart';

abstract class RatingRecord
    implements Built<RatingRecord, RatingRecordBuilder> {
  static Serializer<RatingRecord> get serializer => _$ratingRecordSerializer;

  @BuiltValueField(wireName: 'Act_ID')
  String? get actID;

  @BuiltValueField(wireName: 'Act_type')
  String? get actType;

  int? get rating;

  String? get useremail;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(RatingRecordBuilder builder) => builder
    ..actID = ''
    ..actType = ''
    ..rating = 0
    ..useremail = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('rating');

  static Stream<RatingRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<RatingRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  RatingRecord._();
  factory RatingRecord([void Function(RatingRecordBuilder) updates]) =
      _$RatingRecord;

  static RatingRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createRatingRecordData({
  String? actID,
  String? actType,
  int? rating,
  String? useremail,
}) {
  final firestoreData = serializers.toFirestore(
    RatingRecord.serializer,
    RatingRecord(
      (r) => r
        ..actID = actID
        ..actType = actType
        ..rating = rating
        ..useremail = useremail,
    ),
  );

  return firestoreData;
}
