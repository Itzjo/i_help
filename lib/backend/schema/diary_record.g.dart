// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diary_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DiaryRecord> _$diaryRecordSerializer = new _$DiaryRecordSerializer();

class _$DiaryRecordSerializer implements StructuredSerializer<DiaryRecord> {
  @override
  final Iterable<Type> types = const [DiaryRecord, _$DiaryRecord];
  @override
  final String wireName = 'DiaryRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, DiaryRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.diaryTitle;
    if (value != null) {
      result
        ..add('diary_title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.diaryContent;
    if (value != null) {
      result
        ..add('diary_content')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.user;
    if (value != null) {
      result
        ..add('user')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
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
  DiaryRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DiaryRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'diary_title':
          result.diaryTitle = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'diary_content':
          result.diaryContent = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'user':
          result.user = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
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

class _$DiaryRecord extends DiaryRecord {
  @override
  final String? diaryTitle;
  @override
  final String? diaryContent;
  @override
  final DocumentReference<Object?>? user;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$DiaryRecord([void Function(DiaryRecordBuilder)? updates]) =>
      (new DiaryRecordBuilder()..update(updates))._build();

  _$DiaryRecord._({this.diaryTitle, this.diaryContent, this.user, this.ffRef})
      : super._();

  @override
  DiaryRecord rebuild(void Function(DiaryRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DiaryRecordBuilder toBuilder() => new DiaryRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DiaryRecord &&
        diaryTitle == other.diaryTitle &&
        diaryContent == other.diaryContent &&
        user == other.user &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, diaryTitle.hashCode), diaryContent.hashCode),
            user.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DiaryRecord')
          ..add('diaryTitle', diaryTitle)
          ..add('diaryContent', diaryContent)
          ..add('user', user)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class DiaryRecordBuilder implements Builder<DiaryRecord, DiaryRecordBuilder> {
  _$DiaryRecord? _$v;

  String? _diaryTitle;
  String? get diaryTitle => _$this._diaryTitle;
  set diaryTitle(String? diaryTitle) => _$this._diaryTitle = diaryTitle;

  String? _diaryContent;
  String? get diaryContent => _$this._diaryContent;
  set diaryContent(String? diaryContent) => _$this._diaryContent = diaryContent;

  DocumentReference<Object?>? _user;
  DocumentReference<Object?>? get user => _$this._user;
  set user(DocumentReference<Object?>? user) => _$this._user = user;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  DiaryRecordBuilder() {
    DiaryRecord._initializeBuilder(this);
  }

  DiaryRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _diaryTitle = $v.diaryTitle;
      _diaryContent = $v.diaryContent;
      _user = $v.user;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DiaryRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DiaryRecord;
  }

  @override
  void update(void Function(DiaryRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DiaryRecord build() => _build();

  _$DiaryRecord _build() {
    final _$result = _$v ??
        new _$DiaryRecord._(
            diaryTitle: diaryTitle,
            diaryContent: diaryContent,
            user: user,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
