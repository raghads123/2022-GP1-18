// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_interests_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CategoryInterestsRecord> _$categoryInterestsRecordSerializer =
    new _$CategoryInterestsRecordSerializer();

class _$CategoryInterestsRecordSerializer
    implements StructuredSerializer<CategoryInterestsRecord> {
  @override
  final Iterable<Type> types = const [
    CategoryInterestsRecord,
    _$CategoryInterestsRecord
  ];
  @override
  final String wireName = 'CategoryInterestsRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, CategoryInterestsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.catIn;
    if (value != null) {
      result
        ..add('cat_in')
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
  CategoryInterestsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CategoryInterestsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'cat_in':
          result.catIn.replace(serializers.deserialize(value,
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

class _$CategoryInterestsRecord extends CategoryInterestsRecord {
  @override
  final BuiltList<String>? catIn;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$CategoryInterestsRecord(
          [void Function(CategoryInterestsRecordBuilder)? updates]) =>
      (new CategoryInterestsRecordBuilder()..update(updates))._build();

  _$CategoryInterestsRecord._({this.catIn, this.ffRef}) : super._();

  @override
  CategoryInterestsRecord rebuild(
          void Function(CategoryInterestsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CategoryInterestsRecordBuilder toBuilder() =>
      new CategoryInterestsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CategoryInterestsRecord &&
        catIn == other.catIn &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, catIn.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CategoryInterestsRecord')
          ..add('catIn', catIn)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class CategoryInterestsRecordBuilder
    implements
        Builder<CategoryInterestsRecord, CategoryInterestsRecordBuilder> {
  _$CategoryInterestsRecord? _$v;

  ListBuilder<String>? _catIn;
  ListBuilder<String> get catIn => _$this._catIn ??= new ListBuilder<String>();
  set catIn(ListBuilder<String>? catIn) => _$this._catIn = catIn;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  CategoryInterestsRecordBuilder() {
    CategoryInterestsRecord._initializeBuilder(this);
  }

  CategoryInterestsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _catIn = $v.catIn?.toBuilder();
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CategoryInterestsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CategoryInterestsRecord;
  }

  @override
  void update(void Function(CategoryInterestsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CategoryInterestsRecord build() => _build();

  _$CategoryInterestsRecord _build() {
    _$CategoryInterestsRecord _$result;
    try {
      _$result = _$v ??
          new _$CategoryInterestsRecord._(catIn: _catIn?.build(), ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'catIn';
        _catIn?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CategoryInterestsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
