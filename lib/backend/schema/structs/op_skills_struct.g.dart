// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'op_skills_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<OpSkillsStruct> _$opSkillsStructSerializer =
    new _$OpSkillsStructSerializer();

class _$OpSkillsStructSerializer
    implements StructuredSerializer<OpSkillsStruct> {
  @override
  final Iterable<Type> types = const [OpSkillsStruct, _$OpSkillsStruct];
  @override
  final String wireName = 'OpSkillsStruct';

  @override
  Iterable<Object?> serialize(Serializers serializers, OpSkillsStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];
    Object? value;
    value = object.skills;
    if (value != null) {
      result
        ..add('skills')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    return result;
  }

  @override
  OpSkillsStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new OpSkillsStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'skills':
          result.skills.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'firestoreUtilData':
          result.firestoreUtilData = serializers.deserialize(value,
                  specifiedType: const FullType(FirestoreUtilData))!
              as FirestoreUtilData;
          break;
      }
    }

    return result.build();
  }
}

class _$OpSkillsStruct extends OpSkillsStruct {
  @override
  final BuiltList<String>? skills;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$OpSkillsStruct([void Function(OpSkillsStructBuilder)? updates]) =>
      (new OpSkillsStructBuilder()..update(updates))._build();

  _$OpSkillsStruct._({this.skills, required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'OpSkillsStruct', 'firestoreUtilData');
  }

  @override
  OpSkillsStruct rebuild(void Function(OpSkillsStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OpSkillsStructBuilder toBuilder() =>
      new OpSkillsStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OpSkillsStruct &&
        skills == other.skills &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, skills.hashCode), firestoreUtilData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OpSkillsStruct')
          ..add('skills', skills)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class OpSkillsStructBuilder
    implements Builder<OpSkillsStruct, OpSkillsStructBuilder> {
  _$OpSkillsStruct? _$v;

  ListBuilder<String>? _skills;
  ListBuilder<String> get skills =>
      _$this._skills ??= new ListBuilder<String>();
  set skills(ListBuilder<String>? skills) => _$this._skills = skills;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  OpSkillsStructBuilder() {
    OpSkillsStruct._initializeBuilder(this);
  }

  OpSkillsStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _skills = $v.skills?.toBuilder();
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OpSkillsStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OpSkillsStruct;
  }

  @override
  void update(void Function(OpSkillsStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OpSkillsStruct build() => _build();

  _$OpSkillsStruct _build() {
    _$OpSkillsStruct _$result;
    try {
      _$result = _$v ??
          new _$OpSkillsStruct._(
              skills: _skills?.build(),
              firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                  firestoreUtilData, r'OpSkillsStruct', 'firestoreUtilData'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'skills';
        _skills?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'OpSkillsStruct', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
