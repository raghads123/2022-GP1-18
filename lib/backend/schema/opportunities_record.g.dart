// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'opportunities_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<OpportunitiesRecord> _$opportunitiesRecordSerializer =
    new _$OpportunitiesRecordSerializer();

class _$OpportunitiesRecordSerializer
    implements StructuredSerializer<OpportunitiesRecord> {
  @override
  final Iterable<Type> types = const [
    OpportunitiesRecord,
    _$OpportunitiesRecord
  ];
  @override
  final String wireName = 'OpportunitiesRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, OpportunitiesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.opID;
    if (value != null) {
      result
        ..add('OpID')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.opDesc;
    if (value != null) {
      result
        ..add('OpDesc')
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
    value = object.opSkills;
    if (value != null) {
      result
        ..add('OpSkills')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.opProvider;
    if (value != null) {
      result
        ..add('OpProvider')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.opProviderLogo;
    if (value != null) {
      result
        ..add('OpProviderLogo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.category;
    if (value != null) {
      result
        ..add('Category')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.opQ;
    if (value != null) {
      result
        ..add('OpQ')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.oppName;
    if (value != null) {
      result
        ..add('oppName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.appliedBy;
    if (value != null) {
      result
        ..add('applied_by')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.status;
    if (value != null) {
      result
        ..add('status')
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
  OpportunitiesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new OpportunitiesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'OpID':
          result.opID = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'OpDesc':
          result.opDesc = serializers.deserialize(value,
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
        case 'OpSkills':
          result.opSkills.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'OpProvider':
          result.opProvider = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'OpProviderLogo':
          result.opProviderLogo = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Category':
          result.category.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'OpQ':
          result.opQ = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'oppName':
          result.oppName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'applied_by':
          result.appliedBy.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'status':
          result.status = serializers.deserialize(value,
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

class _$OpportunitiesRecord extends OpportunitiesRecord {
  @override
  final int? opID;
  @override
  final String? opDesc;
  @override
  final DateTime? sdate;
  @override
  final DateTime? edate;
  @override
  final BuiltList<String>? opSkills;
  @override
  final String? opProvider;
  @override
  final String? opProviderLogo;
  @override
  final BuiltList<String>? category;
  @override
  final int? opQ;
  @override
  final String? oppName;
  @override
  final BuiltList<String>? appliedBy;
  @override
  final String? status;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$OpportunitiesRecord(
          [void Function(OpportunitiesRecordBuilder)? updates]) =>
      (new OpportunitiesRecordBuilder()..update(updates))._build();

  _$OpportunitiesRecord._(
      {this.opID,
      this.opDesc,
      this.sdate,
      this.edate,
      this.opSkills,
      this.opProvider,
      this.opProviderLogo,
      this.category,
      this.opQ,
      this.oppName,
      this.appliedBy,
      this.status,
      this.ffRef})
      : super._();

  @override
  OpportunitiesRecord rebuild(
          void Function(OpportunitiesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OpportunitiesRecordBuilder toBuilder() =>
      new OpportunitiesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OpportunitiesRecord &&
        opID == other.opID &&
        opDesc == other.opDesc &&
        sdate == other.sdate &&
        edate == other.edate &&
        opSkills == other.opSkills &&
        opProvider == other.opProvider &&
        opProviderLogo == other.opProviderLogo &&
        category == other.category &&
        opQ == other.opQ &&
        oppName == other.oppName &&
        appliedBy == other.appliedBy &&
        status == other.status &&
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
                                        $jc(
                                            $jc(
                                                $jc($jc(0, opID.hashCode),
                                                    opDesc.hashCode),
                                                sdate.hashCode),
                                            edate.hashCode),
                                        opSkills.hashCode),
                                    opProvider.hashCode),
                                opProviderLogo.hashCode),
                            category.hashCode),
                        opQ.hashCode),
                    oppName.hashCode),
                appliedBy.hashCode),
            status.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OpportunitiesRecord')
          ..add('opID', opID)
          ..add('opDesc', opDesc)
          ..add('sdate', sdate)
          ..add('edate', edate)
          ..add('opSkills', opSkills)
          ..add('opProvider', opProvider)
          ..add('opProviderLogo', opProviderLogo)
          ..add('category', category)
          ..add('opQ', opQ)
          ..add('oppName', oppName)
          ..add('appliedBy', appliedBy)
          ..add('status', status)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class OpportunitiesRecordBuilder
    implements Builder<OpportunitiesRecord, OpportunitiesRecordBuilder> {
  _$OpportunitiesRecord? _$v;

  int? _opID;
  int? get opID => _$this._opID;
  set opID(int? opID) => _$this._opID = opID;

  String? _opDesc;
  String? get opDesc => _$this._opDesc;
  set opDesc(String? opDesc) => _$this._opDesc = opDesc;

  DateTime? _sdate;
  DateTime? get sdate => _$this._sdate;
  set sdate(DateTime? sdate) => _$this._sdate = sdate;

  DateTime? _edate;
  DateTime? get edate => _$this._edate;
  set edate(DateTime? edate) => _$this._edate = edate;

  ListBuilder<String>? _opSkills;
  ListBuilder<String> get opSkills =>
      _$this._opSkills ??= new ListBuilder<String>();
  set opSkills(ListBuilder<String>? opSkills) => _$this._opSkills = opSkills;

  String? _opProvider;
  String? get opProvider => _$this._opProvider;
  set opProvider(String? opProvider) => _$this._opProvider = opProvider;

  String? _opProviderLogo;
  String? get opProviderLogo => _$this._opProviderLogo;
  set opProviderLogo(String? opProviderLogo) =>
      _$this._opProviderLogo = opProviderLogo;

  ListBuilder<String>? _category;
  ListBuilder<String> get category =>
      _$this._category ??= new ListBuilder<String>();
  set category(ListBuilder<String>? category) => _$this._category = category;

  int? _opQ;
  int? get opQ => _$this._opQ;
  set opQ(int? opQ) => _$this._opQ = opQ;

  String? _oppName;
  String? get oppName => _$this._oppName;
  set oppName(String? oppName) => _$this._oppName = oppName;

  ListBuilder<String>? _appliedBy;
  ListBuilder<String> get appliedBy =>
      _$this._appliedBy ??= new ListBuilder<String>();
  set appliedBy(ListBuilder<String>? appliedBy) =>
      _$this._appliedBy = appliedBy;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  OpportunitiesRecordBuilder() {
    OpportunitiesRecord._initializeBuilder(this);
  }

  OpportunitiesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _opID = $v.opID;
      _opDesc = $v.opDesc;
      _sdate = $v.sdate;
      _edate = $v.edate;
      _opSkills = $v.opSkills?.toBuilder();
      _opProvider = $v.opProvider;
      _opProviderLogo = $v.opProviderLogo;
      _category = $v.category?.toBuilder();
      _opQ = $v.opQ;
      _oppName = $v.oppName;
      _appliedBy = $v.appliedBy?.toBuilder();
      _status = $v.status;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OpportunitiesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OpportunitiesRecord;
  }

  @override
  void update(void Function(OpportunitiesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OpportunitiesRecord build() => _build();

  _$OpportunitiesRecord _build() {
    _$OpportunitiesRecord _$result;
    try {
      _$result = _$v ??
          new _$OpportunitiesRecord._(
              opID: opID,
              opDesc: opDesc,
              sdate: sdate,
              edate: edate,
              opSkills: _opSkills?.build(),
              opProvider: opProvider,
              opProviderLogo: opProviderLogo,
              category: _category?.build(),
              opQ: opQ,
              oppName: oppName,
              appliedBy: _appliedBy?.build(),
              status: status,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'opSkills';
        _opSkills?.build();

        _$failedField = 'category';
        _category?.build();

        _$failedField = 'appliedBy';
        _appliedBy?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'OpportunitiesRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
