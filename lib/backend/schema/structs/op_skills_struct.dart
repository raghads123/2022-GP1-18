import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'op_skills_struct.g.dart';

abstract class OpSkillsStruct
    implements Built<OpSkillsStruct, OpSkillsStructBuilder> {
  static Serializer<OpSkillsStruct> get serializer =>
      _$opSkillsStructSerializer;

  BuiltList<String>? get skills;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(OpSkillsStructBuilder builder) => builder
    ..skills = ListBuilder()
    ..firestoreUtilData = FirestoreUtilData();

  OpSkillsStruct._();
  factory OpSkillsStruct([void Function(OpSkillsStructBuilder) updates]) =
      _$OpSkillsStruct;
}

OpSkillsStruct createOpSkillsStruct({
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    OpSkillsStruct(
      (o) => o
        ..skills = null
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

OpSkillsStruct? updateOpSkillsStruct(
  OpSkillsStruct? opSkills, {
  bool clearUnsetFields = true,
}) =>
    opSkills != null
        ? (opSkills.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addOpSkillsStructData(
  Map<String, dynamic> firestoreData,
  OpSkillsStruct? opSkills,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (opSkills == null) {
    return;
  }
  if (opSkills.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && opSkills.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final opSkillsData = getOpSkillsFirestoreData(opSkills, forFieldValue);
  final nestedData = opSkillsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = opSkills.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getOpSkillsFirestoreData(
  OpSkillsStruct? opSkills, [
  bool forFieldValue = false,
]) {
  if (opSkills == null) {
    return {};
  }
  final firestoreData =
      serializers.toFirestore(OpSkillsStruct.serializer, opSkills);

  // Add any Firestore field values
  opSkills.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getOpSkillsListFirestoreData(
  List<OpSkillsStruct>? opSkillss,
) =>
    opSkillss?.map((o) => getOpSkillsFirestoreData(o, true)).toList() ?? [];
