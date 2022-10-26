import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'extra_act_record.g.dart';

abstract class ExtraActRecord
    implements Built<ExtraActRecord, ExtraActRecordBuilder> {
  static Serializer<ExtraActRecord> get serializer =>
      _$extraActRecordSerializer;

  @BuiltValueField(wireName: 'Act_id')
  int? get actId;

  @BuiltValueField(wireName: 'Act_type')
  String? get actType;

  @BuiltValueField(wireName: 'Act_name')
  String? get actName;

  @BuiltValueField(wireName: 'Act_pic')
  String? get actPic;

  @BuiltValueField(wireName: 'Act_dec')
  String? get actDec;

  @BuiltValueField(wireName: 'Act_loc')
  String? get actLoc;

  @BuiltValueField(wireName: 'Sdate')
  DateTime? get sdate;

  @BuiltValueField(wireName: 'Edate')
  DateTime? get edate;

  String? get status;

  String? get category;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ExtraActRecordBuilder builder) => builder
    ..actId = 0
    ..actType = ''
    ..actName = ''
    ..actPic = ''
    ..actDec = ''
    ..actLoc = ''
    ..status = ''
    ..category = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('extra_act');

  static Stream<ExtraActRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ExtraActRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ExtraActRecord._();
  factory ExtraActRecord([void Function(ExtraActRecordBuilder) updates]) =
      _$ExtraActRecord;

  static ExtraActRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createExtraActRecordData({
  int? actId,
  String? actType,
  String? actName,
  String? actPic,
  String? actDec,
  String? actLoc,
  DateTime? sdate,
  DateTime? edate,
  String? status,
  String? category,
}) {
  final firestoreData = serializers.toFirestore(
    ExtraActRecord.serializer,
    ExtraActRecord(
      (e) => e
        ..actId = actId
        ..actType = actType
        ..actName = actName
        ..actPic = actPic
        ..actDec = actDec
        ..actLoc = actLoc
        ..sdate = sdate
        ..edate = edate
        ..status = status
        ..category = category,
    ),
  );

  return firestoreData;
}
