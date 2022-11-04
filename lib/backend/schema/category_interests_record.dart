import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'category_interests_record.g.dart';

abstract class CategoryInterestsRecord
    implements Built<CategoryInterestsRecord, CategoryInterestsRecordBuilder> {
  static Serializer<CategoryInterestsRecord> get serializer =>
      _$categoryInterestsRecordSerializer;

  @BuiltValueField(wireName: 'cat_in')
  BuiltList<String>? get catIn;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(CategoryInterestsRecordBuilder builder) =>
      builder..catIn = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Category_interests');

  static Stream<CategoryInterestsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<CategoryInterestsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  CategoryInterestsRecord._();
  factory CategoryInterestsRecord(
          [void Function(CategoryInterestsRecordBuilder) updates]) =
      _$CategoryInterestsRecord;

  static CategoryInterestsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createCategoryInterestsRecordData() {
  final firestoreData = serializers.toFirestore(
    CategoryInterestsRecord.serializer,
    CategoryInterestsRecord(
      (c) => c..catIn = null,
    ),
  );

  return firestoreData;
}
