import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'opportunities_record.g.dart';

abstract class OpportunitiesRecord
    implements Built<OpportunitiesRecord, OpportunitiesRecordBuilder> {
  static Serializer<OpportunitiesRecord> get serializer =>
      _$opportunitiesRecordSerializer;

  @BuiltValueField(wireName: 'OpID')
  int? get opID;

  @BuiltValueField(wireName: 'OpDesc')
  String? get opDesc;

  @BuiltValueField(wireName: 'Sdate')
  DateTime? get sdate;

  @BuiltValueField(wireName: 'Edate')
  DateTime? get edate;

  @BuiltValueField(wireName: 'OpSkills')
  BuiltList<String>? get opSkills;

  @BuiltValueField(wireName: 'OpProvider')
  String? get opProvider;

  @BuiltValueField(wireName: 'OpProviderLogo')
  String? get opProviderLogo;

  @BuiltValueField(wireName: 'Category')
  BuiltList<String>? get category;

  @BuiltValueField(wireName: 'OpQ')
  int? get opQ;

  String? get oppName;

  @BuiltValueField(wireName: 'applied_by')
  BuiltList<String>? get appliedBy;

  String? get status;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(OpportunitiesRecordBuilder builder) => builder
    ..opID = 0
    ..opDesc = ''
    ..opSkills = ListBuilder()
    ..opProvider = ''
    ..opProviderLogo = ''
    ..category = ListBuilder()
    ..opQ = 0
    ..oppName = ''
    ..appliedBy = ListBuilder()
    ..status = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Opportunities');

  static Stream<OpportunitiesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<OpportunitiesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  OpportunitiesRecord._();
  factory OpportunitiesRecord(
          [void Function(OpportunitiesRecordBuilder) updates]) =
      _$OpportunitiesRecord;

  static OpportunitiesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createOpportunitiesRecordData({
  int? opID,
  String? opDesc,
  DateTime? sdate,
  DateTime? edate,
  String? opProvider,
  String? opProviderLogo,
  int? opQ,
  String? oppName,
  String? status,
}) {
  final firestoreData = serializers.toFirestore(
    OpportunitiesRecord.serializer,
    OpportunitiesRecord(
      (o) => o
        ..opID = opID
        ..opDesc = opDesc
        ..sdate = sdate
        ..edate = edate
        ..opSkills = null
        ..opProvider = opProvider
        ..opProviderLogo = opProviderLogo
        ..category = null
        ..opQ = opQ
        ..oppName = oppName
        ..appliedBy = null
        ..status = status,
    ),
  );

  return firestoreData;
}
