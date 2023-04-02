// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<RatingRecord> _$ratingRecordSerializer =
    new _$RatingRecordSerializer();

class _$RatingRecordSerializer implements StructuredSerializer<RatingRecord> {
  @override
  final Iterable<Type> types = const [RatingRecord, _$RatingRecord];
  @override
  final String wireName = 'RatingRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, RatingRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.actID;
    if (value != null) {
      result
        ..add('Act_ID')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.actType;
    if (value != null) {
      result
        ..add('Act_type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.rating;
    if (value != null) {
      result
        ..add('rating')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.useremail;
    if (value != null) {
      result
        ..add('useremail')
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
  RatingRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RatingRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'Act_ID':
          result.actID = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Act_type':
          result.actType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'rating':
          result.rating = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'useremail':
          result.useremail = serializers.deserialize(value,
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

class _$RatingRecord extends RatingRecord {
  @override
  final String? actID;
  @override
  final String? actType;
  @override
  final int? rating;
  @override
  final String? useremail;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$RatingRecord([void Function(RatingRecordBuilder)? updates]) =>
      (new RatingRecordBuilder()..update(updates))._build();

  _$RatingRecord._(
      {this.actID, this.actType, this.rating, this.useremail, this.ffRef})
      : super._();

  @override
  RatingRecord rebuild(void Function(RatingRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RatingRecordBuilder toBuilder() => new RatingRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RatingRecord &&
        actID == other.actID &&
        actType == other.actType &&
        rating == other.rating &&
        useremail == other.useremail &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, actID.hashCode);
    _$hash = $jc(_$hash, actType.hashCode);
    _$hash = $jc(_$hash, rating.hashCode);
    _$hash = $jc(_$hash, useremail.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RatingRecord')
          ..add('actID', actID)
          ..add('actType', actType)
          ..add('rating', rating)
          ..add('useremail', useremail)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class RatingRecordBuilder
    implements Builder<RatingRecord, RatingRecordBuilder> {
  _$RatingRecord? _$v;

  String? _actID;
  String? get actID => _$this._actID;
  set actID(String? actID) => _$this._actID = actID;

  String? _actType;
  String? get actType => _$this._actType;
  set actType(String? actType) => _$this._actType = actType;

  int? _rating;
  int? get rating => _$this._rating;
  set rating(int? rating) => _$this._rating = rating;

  String? _useremail;
  String? get useremail => _$this._useremail;
  set useremail(String? useremail) => _$this._useremail = useremail;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  RatingRecordBuilder() {
    RatingRecord._initializeBuilder(this);
  }

  RatingRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _actID = $v.actID;
      _actType = $v.actType;
      _rating = $v.rating;
      _useremail = $v.useremail;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RatingRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RatingRecord;
  }

  @override
  void update(void Function(RatingRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RatingRecord build() => _build();

  _$RatingRecord _build() {
    final _$result = _$v ??
        new _$RatingRecord._(
            actID: actID,
            actType: actType,
            rating: rating,
            useremail: useremail,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
