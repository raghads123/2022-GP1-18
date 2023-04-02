// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_history_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserHistoryRecord> _$userHistoryRecordSerializer =
    new _$UserHistoryRecordSerializer();

class _$UserHistoryRecordSerializer
    implements StructuredSerializer<UserHistoryRecord> {
  @override
  final Iterable<Type> types = const [UserHistoryRecord, _$UserHistoryRecord];
  @override
  final String wireName = 'UserHistoryRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, UserHistoryRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.userEmail;
    if (value != null) {
      result
        ..add('user_email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.extraActivityID;
    if (value != null) {
      result
        ..add('extra_activityID')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.aCTType;
    if (value != null) {
      result
        ..add('ACT_type')
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
  UserHistoryRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserHistoryRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'user_email':
          result.userEmail = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'extra_activityID':
          result.extraActivityID = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'ACT_type':
          result.aCTType = serializers.deserialize(value,
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

class _$UserHistoryRecord extends UserHistoryRecord {
  @override
  final String? userEmail;
  @override
  final String? extraActivityID;
  @override
  final String? aCTType;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$UserHistoryRecord(
          [void Function(UserHistoryRecordBuilder)? updates]) =>
      (new UserHistoryRecordBuilder()..update(updates))._build();

  _$UserHistoryRecord._(
      {this.userEmail, this.extraActivityID, this.aCTType, this.ffRef})
      : super._();

  @override
  UserHistoryRecord rebuild(void Function(UserHistoryRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserHistoryRecordBuilder toBuilder() =>
      new UserHistoryRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserHistoryRecord &&
        userEmail == other.userEmail &&
        extraActivityID == other.extraActivityID &&
        aCTType == other.aCTType &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, userEmail.hashCode);
    _$hash = $jc(_$hash, extraActivityID.hashCode);
    _$hash = $jc(_$hash, aCTType.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserHistoryRecord')
          ..add('userEmail', userEmail)
          ..add('extraActivityID', extraActivityID)
          ..add('aCTType', aCTType)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class UserHistoryRecordBuilder
    implements Builder<UserHistoryRecord, UserHistoryRecordBuilder> {
  _$UserHistoryRecord? _$v;

  String? _userEmail;
  String? get userEmail => _$this._userEmail;
  set userEmail(String? userEmail) => _$this._userEmail = userEmail;

  String? _extraActivityID;
  String? get extraActivityID => _$this._extraActivityID;
  set extraActivityID(String? extraActivityID) =>
      _$this._extraActivityID = extraActivityID;

  String? _aCTType;
  String? get aCTType => _$this._aCTType;
  set aCTType(String? aCTType) => _$this._aCTType = aCTType;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  UserHistoryRecordBuilder() {
    UserHistoryRecord._initializeBuilder(this);
  }

  UserHistoryRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _userEmail = $v.userEmail;
      _extraActivityID = $v.extraActivityID;
      _aCTType = $v.aCTType;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserHistoryRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserHistoryRecord;
  }

  @override
  void update(void Function(UserHistoryRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserHistoryRecord build() => _build();

  _$UserHistoryRecord _build() {
    final _$result = _$v ??
        new _$UserHistoryRecord._(
            userEmail: userEmail,
            extraActivityID: extraActivityID,
            aCTType: aCTType,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
