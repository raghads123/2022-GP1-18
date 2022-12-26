import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'extra_acts_record.g.dart';

abstract class ExtraActsRecord
    implements Built<ExtraActsRecord, ExtraActsRecordBuilder> {
  static Serializer<ExtraActsRecord> get serializer =>
      _$extraActsRecordSerializer;

  @BuiltValueField(wireName: 'Act_type')
  String? get actType;

  @BuiltValueField(wireName: 'Act_name')
  String? get actName;

  @BuiltValueField(wireName: 'Act_dec')
  String? get actDec;

  @BuiltValueField(wireName: 'Act_pic')
  String? get actPic;

  String? get status;

  @BuiltValueField(wireName: 'Sdate')
  DateTime? get sdate;

  @BuiltValueField(wireName: 'Edate')
  DateTime? get edate;

  @BuiltValueField(wireName: 'Act_loc')
  String? get actLoc;

  bool? get seats;

  @BuiltValueField(wireName: 'num_seats')
  int? get numSeats;

  @BuiltValueField(wireName: 'enrolled_by')
  BuiltList<String>? get enrolledBy;

  @BuiltValueField(wireName: 'rate_cr')
  BuiltList<String>? get rateCr;

  @BuiltValueField(wireName: 'rate_num')
  BuiltList<int>? get rateNum;

  @BuiltValueField(wireName: 'Act_category')
  BuiltList<String>? get actCategory;

  @BuiltValueField(wireName: 'Act_provider')
  String? get actProvider;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ExtraActsRecordBuilder builder) => builder
    ..actType = ''
    ..actName = ''
    ..actDec = ''
    ..actPic = ''
    ..status = ''
    ..actLoc = ''
    ..seats = false
    ..numSeats = 0
    ..enrolledBy = ListBuilder()
    ..rateCr = ListBuilder()
    ..rateNum = ListBuilder()
    ..actCategory = ListBuilder()
    ..actProvider = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('extra_acts');

  static Stream<ExtraActsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ExtraActsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ExtraActsRecord._();
  factory ExtraActsRecord([void Function(ExtraActsRecordBuilder) updates]) =
      _$ExtraActsRecord;

  static ExtraActsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createExtraActsRecordData({
  String? actType,
  String? actName,
  String? actDec,
  String? actPic,
  String? status,
  DateTime? sdate,
  DateTime? edate,
  String? actLoc,
  bool? seats,
  int? numSeats,
  String? actProvider,
}) {
  final firestoreData = serializers.toFirestore(
    ExtraActsRecord.serializer,
    ExtraActsRecord(
      (e) => e
        ..actType = actType
        ..actName = actName
        ..actDec = actDec
        ..actPic = actPic
        ..status = status
        ..sdate = sdate
        ..edate = edate
        ..actLoc = actLoc
        ..seats = seats
        ..numSeats = numSeats
        ..enrolledBy = null
        ..rateCr = null
        ..rateNum = null
        ..actCategory = null
        ..actProvider = actProvider,
    ),
  );

  return firestoreData;
}
