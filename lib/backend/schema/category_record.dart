import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'category_record.g.dart';

abstract class CategoryRecord
    implements Built<CategoryRecord, CategoryRecordBuilder> {
  static Serializer<CategoryRecord> get serializer =>
      _$categoryRecordSerializer;

  String? get name;

  String? get icon;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(CategoryRecordBuilder builder) => builder
    ..name = ''
    ..icon = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('category');

  static Stream<CategoryRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<CategoryRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  CategoryRecord._();
  factory CategoryRecord([void Function(CategoryRecordBuilder) updates]) =
      _$CategoryRecord;

  static CategoryRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createCategoryRecordData({
  String? name,
  String? icon,
}) {
  final firestoreData = serializers.toFirestore(
    CategoryRecord.serializer,
    CategoryRecord(
      (c) => c
        ..name = name
        ..icon = icon,
    ),
  );

  return firestoreData;
}
