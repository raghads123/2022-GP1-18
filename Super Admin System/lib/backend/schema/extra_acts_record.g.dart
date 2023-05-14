// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'extra_acts_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ExtraActsRecord> _$extraActsRecordSerializer =
    new _$ExtraActsRecordSerializer();

class _$ExtraActsRecordSerializer
    implements StructuredSerializer<ExtraActsRecord> {
  @override
  final Iterable<Type> types = const [ExtraActsRecord, _$ExtraActsRecord];
  @override
  final String wireName = 'ExtraActsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, ExtraActsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
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
    value = object.actDec;
    if (value != null) {
      result
        ..add('Act_dec')
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
    value = object.status;
    if (value != null) {
      result
        ..add('status')
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
    value = object.actLoc;
    if (value != null) {
      result
        ..add('Act_loc')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.seats;
    if (value != null) {
      result
        ..add('seats')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.numSeats;
    if (value != null) {
      result
        ..add('num_seats')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.actCategory;
    if (value != null) {
      result
        ..add('Act_category')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.actProvider;
    if (value != null) {
      result
        ..add('Act_provider')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.actID;
    if (value != null) {
      result
        ..add('Act_ID')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.actProviderEmail;
    if (value != null) {
      result
        ..add('Act_provider_email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.lastD2enroll;
    if (value != null) {
      result
        ..add('LastD2enroll')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.lastD2disenroll;
    if (value != null) {
      result
        ..add('LastD2disenroll')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
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
  ExtraActsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ExtraActsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'Act_type':
          result.actType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Act_name':
          result.actName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Act_dec':
          result.actDec = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Act_pic':
          result.actPic = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
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
        case 'Act_loc':
          result.actLoc = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'seats':
          result.seats = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'num_seats':
          result.numSeats = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'Act_category':
          result.actCategory.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'Act_provider':
          result.actProvider = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Act_ID':
          result.actID = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Act_provider_email':
          result.actProviderEmail = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'LastD2enroll':
          result.lastD2enroll = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'LastD2disenroll':
          result.lastD2disenroll = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
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

class _$ExtraActsRecord extends ExtraActsRecord {
  @override
  final String? actType;
  @override
  final String? actName;
  @override
  final String? actDec;
  @override
  final String? actPic;
  @override
  final String? status;
  @override
  final DateTime? sdate;
  @override
  final DateTime? edate;
  @override
  final String? actLoc;
  @override
  final bool? seats;
  @override
  final int? numSeats;
  @override
  final BuiltList<String>? actCategory;
  @override
  final String? actProvider;
  @override
  final String? actID;
  @override
  final String? actProviderEmail;
  @override
  final DateTime? lastD2enroll;
  @override
  final DateTime? lastD2disenroll;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ExtraActsRecord([void Function(ExtraActsRecordBuilder)? updates]) =>
      (new ExtraActsRecordBuilder()..update(updates))._build();

  _$ExtraActsRecord._(
      {this.actType,
      this.actName,
      this.actDec,
      this.actPic,
      this.status,
      this.sdate,
      this.edate,
      this.actLoc,
      this.seats,
      this.numSeats,
      this.actCategory,
      this.actProvider,
      this.actID,
      this.actProviderEmail,
      this.lastD2enroll,
      this.lastD2disenroll,
      this.ffRef})
      : super._();

  @override
  ExtraActsRecord rebuild(void Function(ExtraActsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ExtraActsRecordBuilder toBuilder() =>
      new ExtraActsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ExtraActsRecord &&
        actType == other.actType &&
        actName == other.actName &&
        actDec == other.actDec &&
        actPic == other.actPic &&
        status == other.status &&
        sdate == other.sdate &&
        edate == other.edate &&
        actLoc == other.actLoc &&
        seats == other.seats &&
        numSeats == other.numSeats &&
        actCategory == other.actCategory &&
        actProvider == other.actProvider &&
        actID == other.actID &&
        actProviderEmail == other.actProviderEmail &&
        lastD2enroll == other.lastD2enroll &&
        lastD2disenroll == other.lastD2disenroll &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, actType.hashCode);
    _$hash = $jc(_$hash, actName.hashCode);
    _$hash = $jc(_$hash, actDec.hashCode);
    _$hash = $jc(_$hash, actPic.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, sdate.hashCode);
    _$hash = $jc(_$hash, edate.hashCode);
    _$hash = $jc(_$hash, actLoc.hashCode);
    _$hash = $jc(_$hash, seats.hashCode);
    _$hash = $jc(_$hash, numSeats.hashCode);
    _$hash = $jc(_$hash, actCategory.hashCode);
    _$hash = $jc(_$hash, actProvider.hashCode);
    _$hash = $jc(_$hash, actID.hashCode);
    _$hash = $jc(_$hash, actProviderEmail.hashCode);
    _$hash = $jc(_$hash, lastD2enroll.hashCode);
    _$hash = $jc(_$hash, lastD2disenroll.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ExtraActsRecord')
          ..add('actType', actType)
          ..add('actName', actName)
          ..add('actDec', actDec)
          ..add('actPic', actPic)
          ..add('status', status)
          ..add('sdate', sdate)
          ..add('edate', edate)
          ..add('actLoc', actLoc)
          ..add('seats', seats)
          ..add('numSeats', numSeats)
          ..add('actCategory', actCategory)
          ..add('actProvider', actProvider)
          ..add('actID', actID)
          ..add('actProviderEmail', actProviderEmail)
          ..add('lastD2enroll', lastD2enroll)
          ..add('lastD2disenroll', lastD2disenroll)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ExtraActsRecordBuilder
    implements Builder<ExtraActsRecord, ExtraActsRecordBuilder> {
  _$ExtraActsRecord? _$v;

  String? _actType;
  String? get actType => _$this._actType;
  set actType(String? actType) => _$this._actType = actType;

  String? _actName;
  String? get actName => _$this._actName;
  set actName(String? actName) => _$this._actName = actName;

  String? _actDec;
  String? get actDec => _$this._actDec;
  set actDec(String? actDec) => _$this._actDec = actDec;

  String? _actPic;
  String? get actPic => _$this._actPic;
  set actPic(String? actPic) => _$this._actPic = actPic;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  DateTime? _sdate;
  DateTime? get sdate => _$this._sdate;
  set sdate(DateTime? sdate) => _$this._sdate = sdate;

  DateTime? _edate;
  DateTime? get edate => _$this._edate;
  set edate(DateTime? edate) => _$this._edate = edate;

  String? _actLoc;
  String? get actLoc => _$this._actLoc;
  set actLoc(String? actLoc) => _$this._actLoc = actLoc;

  bool? _seats;
  bool? get seats => _$this._seats;
  set seats(bool? seats) => _$this._seats = seats;

  int? _numSeats;
  int? get numSeats => _$this._numSeats;
  set numSeats(int? numSeats) => _$this._numSeats = numSeats;

  ListBuilder<String>? _actCategory;
  ListBuilder<String> get actCategory =>
      _$this._actCategory ??= new ListBuilder<String>();
  set actCategory(ListBuilder<String>? actCategory) =>
      _$this._actCategory = actCategory;

  String? _actProvider;
  String? get actProvider => _$this._actProvider;
  set actProvider(String? actProvider) => _$this._actProvider = actProvider;

  String? _actID;
  String? get actID => _$this._actID;
  set actID(String? actID) => _$this._actID = actID;

  String? _actProviderEmail;
  String? get actProviderEmail => _$this._actProviderEmail;
  set actProviderEmail(String? actProviderEmail) =>
      _$this._actProviderEmail = actProviderEmail;

  DateTime? _lastD2enroll;
  DateTime? get lastD2enroll => _$this._lastD2enroll;
  set lastD2enroll(DateTime? lastD2enroll) =>
      _$this._lastD2enroll = lastD2enroll;

  DateTime? _lastD2disenroll;
  DateTime? get lastD2disenroll => _$this._lastD2disenroll;
  set lastD2disenroll(DateTime? lastD2disenroll) =>
      _$this._lastD2disenroll = lastD2disenroll;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ExtraActsRecordBuilder() {
    ExtraActsRecord._initializeBuilder(this);
  }

  ExtraActsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _actType = $v.actType;
      _actName = $v.actName;
      _actDec = $v.actDec;
      _actPic = $v.actPic;
      _status = $v.status;
      _sdate = $v.sdate;
      _edate = $v.edate;
      _actLoc = $v.actLoc;
      _seats = $v.seats;
      _numSeats = $v.numSeats;
      _actCategory = $v.actCategory?.toBuilder();
      _actProvider = $v.actProvider;
      _actID = $v.actID;
      _actProviderEmail = $v.actProviderEmail;
      _lastD2enroll = $v.lastD2enroll;
      _lastD2disenroll = $v.lastD2disenroll;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ExtraActsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ExtraActsRecord;
  }

  @override
  void update(void Function(ExtraActsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ExtraActsRecord build() => _build();

  _$ExtraActsRecord _build() {
    _$ExtraActsRecord _$result;
    try {
      _$result = _$v ??
          new _$ExtraActsRecord._(
              actType: actType,
              actName: actName,
              actDec: actDec,
              actPic: actPic,
              status: status,
              sdate: sdate,
              edate: edate,
              actLoc: actLoc,
              seats: seats,
              numSeats: numSeats,
              actCategory: _actCategory?.build(),
              actProvider: actProvider,
              actID: actID,
              actProviderEmail: actProviderEmail,
              lastD2enroll: lastD2enroll,
              lastD2disenroll: lastD2disenroll,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'actCategory';
        _actCategory?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ExtraActsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
