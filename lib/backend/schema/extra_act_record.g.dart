// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'extra_act_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ExtraActRecord> _$extraActRecordSerializer =
    new _$ExtraActRecordSerializer();

class _$ExtraActRecordSerializer
    implements StructuredSerializer<ExtraActRecord> {
  @override
  final Iterable<Type> types = const [ExtraActRecord, _$ExtraActRecord];
  @override
  final String wireName = 'ExtraActRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, ExtraActRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.actId;
    if (value != null) {
      result
        ..add('Act_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.actType;
    if (value != null) {
      result
        ..add('Act_type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.actName;
    if (value != null) {
      result
        ..add('Act_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.actPic;
    if (value != null) {
      result
        ..add('Act_pic')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.actDec;
    if (value != null) {
      result
        ..add('Act_dec')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.actLoc;
    if (value != null) {
      result
        ..add('Act_loc')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.sdate;
    if (value != null) {
      result
        ..add('Sdate')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.edate;
    if (value != null) {
      result
        ..add('Edate')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.status;
    if (value != null) {
      result
        ..add('status')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.category;
    if (value != null) {
      result
        ..add('category')
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
  ExtraActRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ExtraActRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'Act_id':
          result.actId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'Act_type':
          result.actType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Act_name':
          result.actName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Act_pic':
          result.actPic = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Act_dec':
          result.actDec = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Act_loc':
          result.actLoc = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Sdate':
          result.sdate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'Edate':
          result.edate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'category':
          result.category = serializers.deserialize(value,
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

class _$ExtraActRecord extends ExtraActRecord {
  @override
  final int? actId;
  @override
  final String? actType;
  @override
  final String? actName;
  @override
  final String? actPic;
  @override
  final String? actDec;
  @override
  final String? actLoc;
  @override
  final DateTime? sdate;
  @override
  final DateTime? edate;
  @override
  final String? status;
  @override
  final String? category;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ExtraActRecord([void Function(ExtraActRecordBuilder)? updates]) =>
      (new ExtraActRecordBuilder()..update(updates))._build();

  _$ExtraActRecord._(
      {this.actId,
      this.actType,
      this.actName,
      this.actPic,
      this.actDec,
      this.actLoc,
      this.sdate,
      this.edate,
      this.status,
      this.category,
      this.ffRef})
      : super._();

  @override
  ExtraActRecord rebuild(void Function(ExtraActRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ExtraActRecordBuilder toBuilder() =>
      new ExtraActRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ExtraActRecord &&
        actId == other.actId &&
        actType == other.actType &&
        actName == other.actName &&
        actPic == other.actPic &&
        actDec == other.actDec &&
        actLoc == other.actLoc &&
        sdate == other.sdate &&
        edate == other.edate &&
        status == other.status &&
        category == other.category &&
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
                                $jc(
                                    $jc(
                                        $jc($jc(0, actId.hashCode),
                                            actType.hashCode),
                                        actName.hashCode),
                                    actPic.hashCode),
                                actDec.hashCode),
                            actLoc.hashCode),
                        sdate.hashCode),
                    edate.hashCode),
                status.hashCode),
            category.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ExtraActRecord')
          ..add('actId', actId)
          ..add('actType', actType)
          ..add('actName', actName)
          ..add('actPic', actPic)
          ..add('actDec', actDec)
          ..add('actLoc', actLoc)
          ..add('sdate', sdate)
          ..add('edate', edate)
          ..add('status', status)
          ..add('category', category)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ExtraActRecordBuilder
    implements Builder<ExtraActRecord, ExtraActRecordBuilder> {
  _$ExtraActRecord? _$v;

  int? _actId;
  int? get actId => _$this._actId;
  set actId(int? actId) => _$this._actId = actId;

  String? _actType;
  String? get actType => _$this._actType;
  set actType(String? actType) => _$this._actType = actType;

  String? _actName;
  String? get actName => _$this._actName;
  set actName(String? actName) => _$this._actName = actName;

  String? _actPic;
  String? get actPic => _$this._actPic;
  set actPic(String? actPic) => _$this._actPic = actPic;

  String? _actDec;
  String? get actDec => _$this._actDec;
  set actDec(String? actDec) => _$this._actDec = actDec;

  String? _actLoc;
  String? get actLoc => _$this._actLoc;
  set actLoc(String? actLoc) => _$this._actLoc = actLoc;

  DateTime? _sdate;
  DateTime? get sdate => _$this._sdate;
  set sdate(DateTime? sdate) => _$this._sdate = sdate;

  DateTime? _edate;
  DateTime? get edate => _$this._edate;
  set edate(DateTime? edate) => _$this._edate = edate;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  String? _category;
  String? get category => _$this._category;
  set category(String? category) => _$this._category = category;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ExtraActRecordBuilder() {
    ExtraActRecord._initializeBuilder(this);
  }

  ExtraActRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _actId = $v.actId;
      _actType = $v.actType;
      _actName = $v.actName;
      _actPic = $v.actPic;
      _actDec = $v.actDec;
      _actLoc = $v.actLoc;
      _sdate = $v.sdate;
      _edate = $v.edate;
      _status = $v.status;
      _category = $v.category;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ExtraActRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ExtraActRecord;
  }

  @override
  void update(void Function(ExtraActRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ExtraActRecord build() => _build();

  _$ExtraActRecord _build() {
    final _$result = _$v ??
        new _$ExtraActRecord._(
            actId: actId,
            actType: actType,
            actName: actName,
            actPic: actPic,
            actDec: actDec,
            actLoc: actLoc,
            sdate: sdate,
            edate: edate,
            status: status,
            category: category,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
