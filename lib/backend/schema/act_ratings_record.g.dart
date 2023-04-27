// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'act_ratings_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ActRatingsRecord> _$actRatingsRecordSerializer =
    new _$ActRatingsRecordSerializer();

class _$ActRatingsRecordSerializer
    implements StructuredSerializer<ActRatingsRecord> {
  @override
  final Iterable<Type> types = const [ActRatingsRecord, _$ActRatingsRecord];
  @override
  final String wireName = 'ActRatingsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, ActRatingsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.c1;
    if (value != null) {
      result
        ..add('c1')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
    }
    value = object.c2;
    if (value != null) {
      result
        ..add('c2')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
    }
    value = object.c3;
    if (value != null) {
      result
        ..add('c3')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
    }
    value = object.rateCount;
    if (value != null) {
      result
        ..add('rate_count')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.actName;
    if (value != null) {
      result
        ..add('act_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
  ActRatingsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ActRatingsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'c1':
          result.c1.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))!
              as BuiltList<Object?>);
          break;
        case 'c2':
          result.c2.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))!
              as BuiltList<Object?>);
          break;
        case 'c3':
          result.c3.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))!
              as BuiltList<Object?>);
          break;
        case 'rate_count':
          result.rateCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'act_name':
          result.actName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
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

class _$ActRatingsRecord extends ActRatingsRecord {
  @override
  final BuiltList<int>? c1;
  @override
  final BuiltList<int>? c2;
  @override
  final BuiltList<int>? c3;
  @override
  final int? rateCount;
  @override
  final String? actName;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ActRatingsRecord(
          [void Function(ActRatingsRecordBuilder)? updates]) =>
      (new ActRatingsRecordBuilder()..update(updates))._build();

  _$ActRatingsRecord._(
      {this.c1, this.c2, this.c3, this.rateCount, this.actName, this.ffRef})
      : super._();

  @override
  ActRatingsRecord rebuild(void Function(ActRatingsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ActRatingsRecordBuilder toBuilder() =>
      new ActRatingsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ActRatingsRecord &&
        c1 == other.c1 &&
        c2 == other.c2 &&
        c3 == other.c3 &&
        rateCount == other.rateCount &&
        actName == other.actName &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, c1.hashCode);
    _$hash = $jc(_$hash, c2.hashCode);
    _$hash = $jc(_$hash, c3.hashCode);
    _$hash = $jc(_$hash, rateCount.hashCode);
    _$hash = $jc(_$hash, actName.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ActRatingsRecord')
          ..add('c1', c1)
          ..add('c2', c2)
          ..add('c3', c3)
          ..add('rateCount', rateCount)
          ..add('actName', actName)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ActRatingsRecordBuilder
    implements Builder<ActRatingsRecord, ActRatingsRecordBuilder> {
  _$ActRatingsRecord? _$v;

  ListBuilder<int>? _c1;
  ListBuilder<int> get c1 => _$this._c1 ??= new ListBuilder<int>();
  set c1(ListBuilder<int>? c1) => _$this._c1 = c1;

  ListBuilder<int>? _c2;
  ListBuilder<int> get c2 => _$this._c2 ??= new ListBuilder<int>();
  set c2(ListBuilder<int>? c2) => _$this._c2 = c2;

  ListBuilder<int>? _c3;
  ListBuilder<int> get c3 => _$this._c3 ??= new ListBuilder<int>();
  set c3(ListBuilder<int>? c3) => _$this._c3 = c3;

  int? _rateCount;
  int? get rateCount => _$this._rateCount;
  set rateCount(int? rateCount) => _$this._rateCount = rateCount;

  String? _actName;
  String? get actName => _$this._actName;
  set actName(String? actName) => _$this._actName = actName;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ActRatingsRecordBuilder() {
    ActRatingsRecord._initializeBuilder(this);
  }

  ActRatingsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _c1 = $v.c1?.toBuilder();
      _c2 = $v.c2?.toBuilder();
      _c3 = $v.c3?.toBuilder();
      _rateCount = $v.rateCount;
      _actName = $v.actName;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ActRatingsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ActRatingsRecord;
  }

  @override
  void update(void Function(ActRatingsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ActRatingsRecord build() => _build();

  _$ActRatingsRecord _build() {
    _$ActRatingsRecord _$result;
    try {
      _$result = _$v ??
          new _$ActRatingsRecord._(
              c1: _c1?.build(),
              c2: _c2?.build(),
              c3: _c3?.build(),
              rateCount: rateCount,
              actName: actName,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'c1';
        _c1?.build();
        _$failedField = 'c2';
        _c2?.build();
        _$failedField = 'c3';
        _c3?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ActRatingsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
