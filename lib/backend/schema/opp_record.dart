import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'opp_record.g.dart';

abstract class OppRecord implements Built<OppRecord, OppRecordBuilder> {
  static Serializer<OppRecord> get serializer => _$oppRecordSerializer;

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

  static void _initializeBuilder(OppRecordBuilder builder) => builder
    ..postPhoto = ''
    ..postTitle = ''
    ..postDescription = ''
    ..collage = ''
    ..noSub = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('opp');

  static Stream<OppRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<OppRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  OppRecord._();
  factory OppRecord([void Function(OppRecordBuilder) updates]) = _$OppRecord;

  static OppRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createOppRecordData({
  String? postPhoto,
  String? postTitle,
  String? postDescription,
  DateTime? timePosted,
  String? collage,
  int? noSub,
}) {
  final firestoreData = serializers.toFirestore(
    OppRecord.serializer,
    OppRecord(
      (o) => o
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
