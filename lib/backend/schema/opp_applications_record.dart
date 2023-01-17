import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'opp_applications_record.g.dart';

abstract class OppApplicationsRecord
    implements Built<OppApplicationsRecord, OppApplicationsRecordBuilder> {
  static Serializer<OppApplicationsRecord> get serializer =>
      _$oppApplicationsRecordSerializer;

  @BuiltValueField(wireName: 'app_email')
  String? get appEmail;

  @BuiltValueField(wireName: 'app_skills')
  String? get appSkills;

  @BuiltValueField(wireName: 'app_bio')
  String? get appBio;

  String? get status;

  @BuiltValueField(wireName: 'opp_name')
  String? get oppName;

  @BuiltValueField(wireName: 'oppprovider_email')
  String? get oppproviderEmail;

  String? get oppIDDD;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(OppApplicationsRecordBuilder builder) =>
      builder
        ..appEmail = ''
        ..appSkills = ''
        ..appBio = ''
        ..status = ''
        ..oppName = ''
        ..oppproviderEmail = ''
        ..oppIDDD = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('opp_applications');

  static Stream<OppApplicationsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<OppApplicationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  OppApplicationsRecord._();
  factory OppApplicationsRecord(
          [void Function(OppApplicationsRecordBuilder) updates]) =
      _$OppApplicationsRecord;

  static OppApplicationsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createOppApplicationsRecordData({
  String? appEmail,
  String? appSkills,
  String? appBio,
  String? status,
  String? oppName,
  String? oppproviderEmail,
  String? oppIDDD,
}) {
  final firestoreData = serializers.toFirestore(
    OppApplicationsRecord.serializer,
    OppApplicationsRecord(
      (o) => o
        ..appEmail = appEmail
        ..appSkills = appSkills
        ..appBio = appBio
        ..status = status
        ..oppName = oppName
        ..oppproviderEmail = oppproviderEmail
        ..oppIDDD = oppIDDD,
    ),
  );

  return firestoreData;
}
