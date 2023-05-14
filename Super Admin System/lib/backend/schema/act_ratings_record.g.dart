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
    value = object.num1;
    if (value != null) {
      result
        ..add('num1')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.num2;
    if (value != null) {
      result
        ..add('num2')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.num3;
    if (value != null) {
      result
        ..add('num3')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.num4;
    if (value != null) {
      result
        ..add('num4')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.num5;
    if (value != null) {
      result
        ..add('num5')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.actId;
    if (value != null) {
      result
        ..add('act_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.count;
    if (value != null) {
      result
        ..add('count')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.num21;
    if (value != null) {
      result
        ..add('num2_1')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.num22;
    if (value != null) {
      result
        ..add('num2_2')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.num23;
    if (value != null) {
      result
        ..add('num2_3')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.num24;
    if (value != null) {
      result
        ..add('num2_4')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.num25;
    if (value != null) {
      result
        ..add('num2_5')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.num31;
    if (value != null) {
      result
        ..add('num3_1')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.num32;
    if (value != null) {
      result
        ..add('num3_2')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.num33;
    if (value != null) {
      result
        ..add('num3_3')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.num34;
    if (value != null) {
      result
        ..add('num3_4')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.num35;
    if (value != null) {
      result
        ..add('num3_5')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.raters;
    if (value != null) {
      result
        ..add('raters')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
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
        case 'num1':
          result.num1 = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'num2':
          result.num2 = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'num3':
          result.num3 = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'num4':
          result.num4 = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'num5':
          result.num5 = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'act_id':
          result.actId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'count':
          result.count = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'num2_1':
          result.num21 = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'num2_2':
          result.num22 = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'num2_3':
          result.num23 = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'num2_4':
          result.num24 = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'num2_5':
          result.num25 = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'num3_1':
          result.num31 = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'num3_2':
          result.num32 = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'num3_3':
          result.num33 = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'num3_4':
          result.num34 = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'num3_5':
          result.num35 = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'raters':
          result.raters.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
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
  final int? num1;
  @override
  final int? num2;
  @override
  final int? num3;
  @override
  final int? num4;
  @override
  final int? num5;
  @override
  final String? actId;
  @override
  final int? count;
  @override
  final int? num21;
  @override
  final int? num22;
  @override
  final int? num23;
  @override
  final int? num24;
  @override
  final int? num25;
  @override
  final int? num31;
  @override
  final int? num32;
  @override
  final int? num33;
  @override
  final int? num34;
  @override
  final int? num35;
  @override
  final BuiltList<String>? raters;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ActRatingsRecord(
          [void Function(ActRatingsRecordBuilder)? updates]) =>
      (new ActRatingsRecordBuilder()..update(updates))._build();

  _$ActRatingsRecord._(
      {this.num1,
      this.num2,
      this.num3,
      this.num4,
      this.num5,
      this.actId,
      this.count,
      this.num21,
      this.num22,
      this.num23,
      this.num24,
      this.num25,
      this.num31,
      this.num32,
      this.num33,
      this.num34,
      this.num35,
      this.raters,
      this.ffRef})
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
        num1 == other.num1 &&
        num2 == other.num2 &&
        num3 == other.num3 &&
        num4 == other.num4 &&
        num5 == other.num5 &&
        actId == other.actId &&
        count == other.count &&
        num21 == other.num21 &&
        num22 == other.num22 &&
        num23 == other.num23 &&
        num24 == other.num24 &&
        num25 == other.num25 &&
        num31 == other.num31 &&
        num32 == other.num32 &&
        num33 == other.num33 &&
        num34 == other.num34 &&
        num35 == other.num35 &&
        raters == other.raters &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, num1.hashCode);
    _$hash = $jc(_$hash, num2.hashCode);
    _$hash = $jc(_$hash, num3.hashCode);
    _$hash = $jc(_$hash, num4.hashCode);
    _$hash = $jc(_$hash, num5.hashCode);
    _$hash = $jc(_$hash, actId.hashCode);
    _$hash = $jc(_$hash, count.hashCode);
    _$hash = $jc(_$hash, num21.hashCode);
    _$hash = $jc(_$hash, num22.hashCode);
    _$hash = $jc(_$hash, num23.hashCode);
    _$hash = $jc(_$hash, num24.hashCode);
    _$hash = $jc(_$hash, num25.hashCode);
    _$hash = $jc(_$hash, num31.hashCode);
    _$hash = $jc(_$hash, num32.hashCode);
    _$hash = $jc(_$hash, num33.hashCode);
    _$hash = $jc(_$hash, num34.hashCode);
    _$hash = $jc(_$hash, num35.hashCode);
    _$hash = $jc(_$hash, raters.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ActRatingsRecord')
          ..add('num1', num1)
          ..add('num2', num2)
          ..add('num3', num3)
          ..add('num4', num4)
          ..add('num5', num5)
          ..add('actId', actId)
          ..add('count', count)
          ..add('num21', num21)
          ..add('num22', num22)
          ..add('num23', num23)
          ..add('num24', num24)
          ..add('num25', num25)
          ..add('num31', num31)
          ..add('num32', num32)
          ..add('num33', num33)
          ..add('num34', num34)
          ..add('num35', num35)
          ..add('raters', raters)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ActRatingsRecordBuilder
    implements Builder<ActRatingsRecord, ActRatingsRecordBuilder> {
  _$ActRatingsRecord? _$v;

  int? _num1;
  int? get num1 => _$this._num1;
  set num1(int? num1) => _$this._num1 = num1;

  int? _num2;
  int? get num2 => _$this._num2;
  set num2(int? num2) => _$this._num2 = num2;

  int? _num3;
  int? get num3 => _$this._num3;
  set num3(int? num3) => _$this._num3 = num3;

  int? _num4;
  int? get num4 => _$this._num4;
  set num4(int? num4) => _$this._num4 = num4;

  int? _num5;
  int? get num5 => _$this._num5;
  set num5(int? num5) => _$this._num5 = num5;

  String? _actId;
  String? get actId => _$this._actId;
  set actId(String? actId) => _$this._actId = actId;

  int? _count;
  int? get count => _$this._count;
  set count(int? count) => _$this._count = count;

  int? _num21;
  int? get num21 => _$this._num21;
  set num21(int? num21) => _$this._num21 = num21;

  int? _num22;
  int? get num22 => _$this._num22;
  set num22(int? num22) => _$this._num22 = num22;

  int? _num23;
  int? get num23 => _$this._num23;
  set num23(int? num23) => _$this._num23 = num23;

  int? _num24;
  int? get num24 => _$this._num24;
  set num24(int? num24) => _$this._num24 = num24;

  int? _num25;
  int? get num25 => _$this._num25;
  set num25(int? num25) => _$this._num25 = num25;

  int? _num31;
  int? get num31 => _$this._num31;
  set num31(int? num31) => _$this._num31 = num31;

  int? _num32;
  int? get num32 => _$this._num32;
  set num32(int? num32) => _$this._num32 = num32;

  int? _num33;
  int? get num33 => _$this._num33;
  set num33(int? num33) => _$this._num33 = num33;

  int? _num34;
  int? get num34 => _$this._num34;
  set num34(int? num34) => _$this._num34 = num34;

  int? _num35;
  int? get num35 => _$this._num35;
  set num35(int? num35) => _$this._num35 = num35;

  ListBuilder<String>? _raters;
  ListBuilder<String> get raters =>
      _$this._raters ??= new ListBuilder<String>();
  set raters(ListBuilder<String>? raters) => _$this._raters = raters;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ActRatingsRecordBuilder() {
    ActRatingsRecord._initializeBuilder(this);
  }

  ActRatingsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _num1 = $v.num1;
      _num2 = $v.num2;
      _num3 = $v.num3;
      _num4 = $v.num4;
      _num5 = $v.num5;
      _actId = $v.actId;
      _count = $v.count;
      _num21 = $v.num21;
      _num22 = $v.num22;
      _num23 = $v.num23;
      _num24 = $v.num24;
      _num25 = $v.num25;
      _num31 = $v.num31;
      _num32 = $v.num32;
      _num33 = $v.num33;
      _num34 = $v.num34;
      _num35 = $v.num35;
      _raters = $v.raters?.toBuilder();
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
              num1: num1,
              num2: num2,
              num3: num3,
              num4: num4,
              num5: num5,
              actId: actId,
              count: count,
              num21: num21,
              num22: num22,
              num23: num23,
              num24: num24,
              num25: num25,
              num31: num31,
              num32: num32,
              num33: num33,
              num34: num34,
              num35: num35,
              raters: _raters?.build(),
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'raters';
        _raters?.build();
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
