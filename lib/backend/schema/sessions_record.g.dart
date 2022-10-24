// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sessions_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SessionsRecord> _$sessionsRecordSerializer =
    new _$SessionsRecordSerializer();

class _$SessionsRecordSerializer
    implements StructuredSerializer<SessionsRecord> {
  @override
  final Iterable<Type> types = const [SessionsRecord, _$SessionsRecord];
  @override
  final String wireName = 'SessionsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, SessionsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdAt;
    if (value != null) {
      result
        ..add('created_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.modifiedAt;
    if (value != null) {
      result
        ..add('modified_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.finished;
    if (value != null) {
      result
        ..add('finished')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.chairs;
    if (value != null) {
      result
        ..add('chairs')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.collage;
    if (value != null) {
      result
        ..add('collage')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.open;
    if (value != null) {
      result
        ..add('open')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  SessionsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SessionsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'created_at':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'modified_at':
          result.modifiedAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'finished':
          result.finished = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'chairs':
          result.chairs = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'collage':
          result.collage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'open':
          result.open = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$SessionsRecord extends SessionsRecord {
  @override
  final String? name;
  @override
  final String? description;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? modifiedAt;
  @override
  final bool? finished;
  @override
  final int? chairs;
  @override
  final String? collage;
  @override
  final bool? open;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$SessionsRecord([void Function(SessionsRecordBuilder)? updates]) =>
      (new SessionsRecordBuilder()..update(updates))._build();

  _$SessionsRecord._(
      {this.name,
      this.description,
      this.createdAt,
      this.modifiedAt,
      this.finished,
      this.chairs,
      this.collage,
      this.open,
      this.ffRef})
      : super._();

  @override
  SessionsRecord rebuild(void Function(SessionsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SessionsRecordBuilder toBuilder() =>
      new SessionsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SessionsRecord &&
        name == other.name &&
        description == other.description &&
        createdAt == other.createdAt &&
        modifiedAt == other.modifiedAt &&
        finished == other.finished &&
        chairs == other.chairs &&
        collage == other.collage &&
        open == other.open &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc($jc(0, name.hashCode),
                                    description.hashCode),
                                createdAt.hashCode),
                            modifiedAt.hashCode),
                        finished.hashCode),
                    chairs.hashCode),
                collage.hashCode),
            open.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SessionsRecord')
          ..add('name', name)
          ..add('description', description)
          ..add('createdAt', createdAt)
          ..add('modifiedAt', modifiedAt)
          ..add('finished', finished)
          ..add('chairs', chairs)
          ..add('collage', collage)
          ..add('open', open)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class SessionsRecordBuilder
    implements Builder<SessionsRecord, SessionsRecordBuilder> {
  _$SessionsRecord? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DateTime? _modifiedAt;
  DateTime? get modifiedAt => _$this._modifiedAt;
  set modifiedAt(DateTime? modifiedAt) => _$this._modifiedAt = modifiedAt;

  bool? _finished;
  bool? get finished => _$this._finished;
  set finished(bool? finished) => _$this._finished = finished;

  int? _chairs;
  int? get chairs => _$this._chairs;
  set chairs(int? chairs) => _$this._chairs = chairs;

  String? _collage;
  String? get collage => _$this._collage;
  set collage(String? collage) => _$this._collage = collage;

  bool? _open;
  bool? get open => _$this._open;
  set open(bool? open) => _$this._open = open;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  SessionsRecordBuilder() {
    SessionsRecord._initializeBuilder(this);
  }

  SessionsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _description = $v.description;
      _createdAt = $v.createdAt;
      _modifiedAt = $v.modifiedAt;
      _finished = $v.finished;
      _chairs = $v.chairs;
      _collage = $v.collage;
      _open = $v.open;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SessionsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SessionsRecord;
  }

  @override
  void update(void Function(SessionsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SessionsRecord build() => _build();

  _$SessionsRecord _build() {
    final _$result = _$v ??
        new _$SessionsRecord._(
            name: name,
            description: description,
            createdAt: createdAt,
            modifiedAt: modifiedAt,
            finished: finished,
            chairs: chairs,
            collage: collage,
            open: open,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
