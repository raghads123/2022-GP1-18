// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'opp_applications_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<OppApplicationsRecord> _$oppApplicationsRecordSerializer =
    new _$OppApplicationsRecordSerializer();

class _$OppApplicationsRecordSerializer
    implements StructuredSerializer<OppApplicationsRecord> {
  @override
  final Iterable<Type> types = const [
    OppApplicationsRecord,
    _$OppApplicationsRecord
  ];
  @override
  final String wireName = 'OppApplicationsRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, OppApplicationsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.appEmail;
    if (value != null) {
      result
        ..add('app_email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.appSkills;
    if (value != null) {
      result
        ..add('app_skills')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.appBio;
    if (value != null) {
      result
        ..add('app_bio')
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
    value = object.oppName;
    if (value != null) {
      result
        ..add('opp_name')
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
  OppApplicationsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new OppApplicationsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'app_email':
          result.appEmail = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'app_skills':
          result.appSkills = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'app_bio':
          result.appBio = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'opp_name':
          result.oppName = serializers.deserialize(value,
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

class _$OppApplicationsRecord extends OppApplicationsRecord {
  @override
  final String? appEmail;
  @override
  final String? appSkills;
  @override
  final String? appBio;
  @override
  final String? status;
  @override
  final String? oppName;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$OppApplicationsRecord(
          [void Function(OppApplicationsRecordBuilder)? updates]) =>
      (new OppApplicationsRecordBuilder()..update(updates))._build();

  _$OppApplicationsRecord._(
      {this.appEmail,
      this.appSkills,
      this.appBio,
      this.status,
      this.oppName,
      this.ffRef})
      : super._();

  @override
  OppApplicationsRecord rebuild(
          void Function(OppApplicationsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OppApplicationsRecordBuilder toBuilder() =>
      new OppApplicationsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OppApplicationsRecord &&
        appEmail == other.appEmail &&
        appSkills == other.appSkills &&
        appBio == other.appBio &&
        status == other.status &&
        oppName == other.oppName &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, appEmail.hashCode), appSkills.hashCode),
                    appBio.hashCode),
                status.hashCode),
            oppName.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OppApplicationsRecord')
          ..add('appEmail', appEmail)
          ..add('appSkills', appSkills)
          ..add('appBio', appBio)
          ..add('status', status)
          ..add('oppName', oppName)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class OppApplicationsRecordBuilder
    implements Builder<OppApplicationsRecord, OppApplicationsRecordBuilder> {
  _$OppApplicationsRecord? _$v;

  String? _appEmail;
  String? get appEmail => _$this._appEmail;
  set appEmail(String? appEmail) => _$this._appEmail = appEmail;

  String? _appSkills;
  String? get appSkills => _$this._appSkills;
  set appSkills(String? appSkills) => _$this._appSkills = appSkills;

  String? _appBio;
  String? get appBio => _$this._appBio;
  set appBio(String? appBio) => _$this._appBio = appBio;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  String? _oppName;
  String? get oppName => _$this._oppName;
  set oppName(String? oppName) => _$this._oppName = oppName;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  OppApplicationsRecordBuilder() {
    OppApplicationsRecord._initializeBuilder(this);
  }

  OppApplicationsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _appEmail = $v.appEmail;
      _appSkills = $v.appSkills;
      _appBio = $v.appBio;
      _status = $v.status;
      _oppName = $v.oppName;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OppApplicationsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OppApplicationsRecord;
  }

  @override
  void update(void Function(OppApplicationsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OppApplicationsRecord build() => _build();

  _$OppApplicationsRecord _build() {
    final _$result = _$v ??
        new _$OppApplicationsRecord._(
            appEmail: appEmail,
            appSkills: appSkills,
            appBio: appBio,
            status: status,
            oppName: oppName,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
