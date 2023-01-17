import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'user_history_record.g.dart';

abstract class UserHistoryRecord
    implements Built<UserHistoryRecord, UserHistoryRecordBuilder> {
  static Serializer<UserHistoryRecord> get serializer =>
      _$userHistoryRecordSerializer;

  @BuiltValueField(wireName: 'user_email')
  String? get userEmail;

  @BuiltValueField(wireName: 'extra_activityID')
  String? get extraActivityID;

  @BuiltValueField(wireName: 'ACT_type')
  String? get aCTType;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(UserHistoryRecordBuilder builder) => builder
    ..userEmail = ''
    ..extraActivityID = ''
    ..aCTType = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('user_history');

  static Stream<UserHistoryRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<UserHistoryRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  UserHistoryRecord._();
  factory UserHistoryRecord([void Function(UserHistoryRecordBuilder) updates]) =
      _$UserHistoryRecord;

  static UserHistoryRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createUserHistoryRecordData({
  String? userEmail,
  String? extraActivityID,
  String? aCTType,
}) {
  final firestoreData = serializers.toFirestore(
    UserHistoryRecord.serializer,
    UserHistoryRecord(
      (u) => u
        ..userEmail = userEmail
        ..extraActivityID = extraActivityID
        ..aCTType = aCTType,
    ),
  );

  return firestoreData;
}
