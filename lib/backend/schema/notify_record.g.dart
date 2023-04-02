// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notify_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<NotifyRecord> _$notifyRecordSerializer =
    new _$NotifyRecordSerializer();

class _$NotifyRecordSerializer implements StructuredSerializer<NotifyRecord> {
  @override
  final Iterable<Type> types = const [NotifyRecord, _$NotifyRecord];
  @override
  final String wireName = 'NotifyRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, NotifyRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.actID;
    if (value != null) {
      result
        ..add('act_ID')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.multiuser;
    if (value != null) {
      result
        ..add('multiuser')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
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
  NotifyRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new NotifyRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'act_ID':
          result.actID = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'multiuser':
          result.multiuser.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
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

class _$NotifyRecord extends NotifyRecord {
  @override
  final String? actID;
  @override
  final BuiltList<DocumentReference<Object?>>? multiuser;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$NotifyRecord([void Function(NotifyRecordBuilder)? updates]) =>
      (new NotifyRecordBuilder()..update(updates))._build();

  _$NotifyRecord._({this.actID, this.multiuser, this.ffRef}) : super._();

  @override
  NotifyRecord rebuild(void Function(NotifyRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NotifyRecordBuilder toBuilder() => new NotifyRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NotifyRecord &&
        actID == other.actID &&
        multiuser == other.multiuser &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, actID.hashCode);
    _$hash = $jc(_$hash, multiuser.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NotifyRecord')
          ..add('actID', actID)
          ..add('multiuser', multiuser)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class NotifyRecordBuilder
    implements Builder<NotifyRecord, NotifyRecordBuilder> {
  _$NotifyRecord? _$v;

  String? _actID;
  String? get actID => _$this._actID;
  set actID(String? actID) => _$this._actID = actID;

  ListBuilder<DocumentReference<Object?>>? _multiuser;
  ListBuilder<DocumentReference<Object?>> get multiuser =>
      _$this._multiuser ??= new ListBuilder<DocumentReference<Object?>>();
  set multiuser(ListBuilder<DocumentReference<Object?>>? multiuser) =>
      _$this._multiuser = multiuser;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  NotifyRecordBuilder() {
    NotifyRecord._initializeBuilder(this);
  }

  NotifyRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _actID = $v.actID;
      _multiuser = $v.multiuser?.toBuilder();
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NotifyRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NotifyRecord;
  }

  @override
  void update(void Function(NotifyRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NotifyRecord build() => _build();

  _$NotifyRecord _build() {
    _$NotifyRecord _$result;
    try {
      _$result = _$v ??
          new _$NotifyRecord._(
              actID: actID, multiuser: _multiuser?.build(), ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'multiuser';
        _multiuser?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'NotifyRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
