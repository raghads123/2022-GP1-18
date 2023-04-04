import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'opportunities_record.g.dart';

abstract class OpportunitiesRecord
    implements Built<OpportunitiesRecord, OpportunitiesRecordBuilder> {
  static Serializer<OpportunitiesRecord> get serializer =>
      _$opportunitiesRecordSerializer;

  @BuiltValueField(wireName: 'OpDesc')
  String? get opDesc;

  @BuiltValueField(wireName: 'Sdate')
  DateTime? get sdate;

  @BuiltValueField(wireName: 'Edate')
  DateTime? get edate;

  @BuiltValueField(wireName: 'OpProvider')
  String? get opProvider;

  @BuiltValueField(wireName: 'OpProviderLogo')
  String? get opProviderLogo;

  @BuiltValueField(wireName: 'Category')
  BuiltList<String>? get category;

  @BuiltValueField(wireName: 'OpQ')
  int? get opQ;

  String? get oppName;

  String? get status;

  @BuiltValueField(wireName: 'OpSkills')
  BuiltList<String>? get opSkills;

  @BuiltValueField(wireName: 'OpID')
  String? get opID;

  @BuiltValueField(wireName: 'OpProvider_email')
  String? get opProviderEmail;

  @BuiltValueField(wireName: 'LastD2apply')
  DateTime? get lastD2apply;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(OpportunitiesRecordBuilder builder) => builder
    ..opDesc = ''
    ..opProvider = ''
    ..opProviderLogo = ''
    ..category = ListBuilder()
    ..opQ = 0
    ..oppName = ''
    ..status = ''
    ..opSkills = ListBuilder()
    ..opID = ''
    ..opProviderEmail = '';

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
  String? opDesc,
  DateTime? sdate,
  DateTime? edate,
  String? opProvider,
  String? opProviderLogo,
  int? opQ,
  String? oppName,
  String? status,
  String? opID,
  String? opProviderEmail,
  DateTime? lastD2apply,
}) {
  final firestoreData = serializers.toFirestore(
    OpportunitiesRecord.serializer,
    OpportunitiesRecord(
      (o) => o
        ..opDesc = opDesc
        ..sdate = sdate
        ..edate = edate
        ..opProvider = opProvider
        ..opProviderLogo = opProviderLogo
        ..category = null
        ..opQ = opQ
        ..oppName = oppName
        ..status = status
        ..opSkills = null
        ..opID = opID
        ..opProviderEmail = opProviderEmail
        ..lastD2apply = lastD2apply,
    ),
  );

  return firestoreData;
}
