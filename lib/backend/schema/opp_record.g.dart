// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'opp_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<OppRecord> _$oppRecordSerializer = new _$OppRecordSerializer();

class _$OppRecordSerializer implements StructuredSerializer<OppRecord> {
  @override
  final Iterable<Type> types = const [OppRecord, _$OppRecord];
  @override
  final String wireName = 'OppRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, OppRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.postPhoto;
    if (value != null) {
      result
        ..add('post_photo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.postTitle;
    if (value != null) {
      result
        ..add('post_title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.postDescription;
    if (value != null) {
      result
        ..add('post_description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.timePosted;
    if (value != null) {
      result
        ..add('time_posted')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.collage;
    if (value != null) {
      result
        ..add('collage')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.noSub;
    if (value != null) {
      result
        ..add('no_sub')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
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
  OppRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new OppRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'post_photo':
          result.postPhoto = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'post_title':
          result.postTitle = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'post_description':
          result.postDescription = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'time_posted':
          result.timePosted = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'collage':
          result.collage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'no_sub':
          result.noSub = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
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

class _$OppRecord extends OppRecord {
  @override
  final String? postPhoto;
  @override
  final String? postTitle;
  @override
  final String? postDescription;
  @override
  final DateTime? timePosted;
  @override
  final String? collage;
  @override
  final int? noSub;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$OppRecord([void Function(OppRecordBuilder)? updates]) =>
      (new OppRecordBuilder()..update(updates))._build();

  _$OppRecord._(
      {this.postPhoto,
      this.postTitle,
      this.postDescription,
      this.timePosted,
      this.collage,
      this.noSub,
      this.ffRef})
      : super._();

  @override
  OppRecord rebuild(void Function(OppRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OppRecordBuilder toBuilder() => new OppRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OppRecord &&
        postPhoto == other.postPhoto &&
        postTitle == other.postTitle &&
        postDescription == other.postDescription &&
        timePosted == other.timePosted &&
        collage == other.collage &&
        noSub == other.noSub &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, postPhoto.hashCode), postTitle.hashCode),
                        postDescription.hashCode),
                    timePosted.hashCode),
                collage.hashCode),
            noSub.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OppRecord')
          ..add('postPhoto', postPhoto)
          ..add('postTitle', postTitle)
          ..add('postDescription', postDescription)
          ..add('timePosted', timePosted)
          ..add('collage', collage)
          ..add('noSub', noSub)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class OppRecordBuilder implements Builder<OppRecord, OppRecordBuilder> {
  _$OppRecord? _$v;

  String? _postPhoto;
  String? get postPhoto => _$this._postPhoto;
  set postPhoto(String? postPhoto) => _$this._postPhoto = postPhoto;

  String? _postTitle;
  String? get postTitle => _$this._postTitle;
  set postTitle(String? postTitle) => _$this._postTitle = postTitle;

  String? _postDescription;
  String? get postDescription => _$this._postDescription;
  set postDescription(String? postDescription) =>
      _$this._postDescription = postDescription;

  DateTime? _timePosted;
  DateTime? get timePosted => _$this._timePosted;
  set timePosted(DateTime? timePosted) => _$this._timePosted = timePosted;

  String? _collage;
  String? get collage => _$this._collage;
  set collage(String? collage) => _$this._collage = collage;

  int? _noSub;
  int? get noSub => _$this._noSub;
  set noSub(int? noSub) => _$this._noSub = noSub;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  OppRecordBuilder() {
    OppRecord._initializeBuilder(this);
  }

  OppRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _postPhoto = $v.postPhoto;
      _postTitle = $v.postTitle;
      _postDescription = $v.postDescription;
      _timePosted = $v.timePosted;
      _collage = $v.collage;
      _noSub = $v.noSub;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OppRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OppRecord;
  }

  @override
  void update(void Function(OppRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OppRecord build() => _build();

  _$OppRecord _build() {
    final _$result = _$v ??
        new _$OppRecord._(
            postPhoto: postPhoto,
            postTitle: postTitle,
            postDescription: postDescription,
            timePosted: timePosted,
            collage: collage,
            noSub: noSub,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
