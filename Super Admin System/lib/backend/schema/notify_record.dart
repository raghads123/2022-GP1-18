import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'notify_record.g.dart';

abstract class NotifyRecord
    implements Built<NotifyRecord, NotifyRecordBuilder> {
  static Serializer<NotifyRecord> get serializer => _$notifyRecordSerializer;

  @BuiltValueField(wireName: 'act_ID')
  String? get actID;

  BuiltList<DocumentReference>? get multiuser;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(NotifyRecordBuilder builder) => builder
    ..actID = ''
    ..multiuser = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Notify');

  static Stream<NotifyRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<NotifyRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  NotifyRecord._();
  factory NotifyRecord([void Function(NotifyRecordBuilder) updates]) =
      _$NotifyRecord;

  static NotifyRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createNotifyRecordData({
  String? actID,
}) {
  final firestoreData = serializers.toFirestore(
    NotifyRecord.serializer,
    NotifyRecord(
      (n) => n
        ..actID = actID
        ..multiuser = null,
    ),
  );

  return firestoreData;
}
