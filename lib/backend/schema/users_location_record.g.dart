// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_location_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UsersLocationRecord> _$usersLocationRecordSerializer =
    new _$UsersLocationRecordSerializer();

class _$UsersLocationRecordSerializer
    implements StructuredSerializer<UsersLocationRecord> {
  @override
  final Iterable<Type> types = const [
    UsersLocationRecord,
    _$UsersLocationRecord
  ];
  @override
  final String wireName = 'UsersLocationRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, UsersLocationRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.users;
    if (value != null) {
      result
        ..add('users')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.usersLocation;
    if (value != null) {
      result
        ..add('usersLocation')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(LatLng)));
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
  UsersLocationRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UsersLocationRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'users':
          result.users = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'usersLocation':
          result.usersLocation = serializers.deserialize(value,
              specifiedType: const FullType(LatLng)) as LatLng?;
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

class _$UsersLocationRecord extends UsersLocationRecord {
  @override
  final DocumentReference<Object?>? users;
  @override
  final LatLng? usersLocation;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$UsersLocationRecord(
          [void Function(UsersLocationRecordBuilder)? updates]) =>
      (new UsersLocationRecordBuilder()..update(updates))._build();

  _$UsersLocationRecord._({this.users, this.usersLocation, this.ffRef})
      : super._();

  @override
  UsersLocationRecord rebuild(
          void Function(UsersLocationRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UsersLocationRecordBuilder toBuilder() =>
      new UsersLocationRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UsersLocationRecord &&
        users == other.users &&
        usersLocation == other.usersLocation &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, users.hashCode), usersLocation.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UsersLocationRecord')
          ..add('users', users)
          ..add('usersLocation', usersLocation)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class UsersLocationRecordBuilder
    implements Builder<UsersLocationRecord, UsersLocationRecordBuilder> {
  _$UsersLocationRecord? _$v;

  DocumentReference<Object?>? _users;
  DocumentReference<Object?>? get users => _$this._users;
  set users(DocumentReference<Object?>? users) => _$this._users = users;

  LatLng? _usersLocation;
  LatLng? get usersLocation => _$this._usersLocation;
  set usersLocation(LatLng? usersLocation) =>
      _$this._usersLocation = usersLocation;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  UsersLocationRecordBuilder() {
    UsersLocationRecord._initializeBuilder(this);
  }

  UsersLocationRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _users = $v.users;
      _usersLocation = $v.usersLocation;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UsersLocationRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UsersLocationRecord;
  }

  @override
  void update(void Function(UsersLocationRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UsersLocationRecord build() => _build();

  _$UsersLocationRecord _build() {
    final _$result = _$v ??
        new _$UsersLocationRecord._(
            users: users, usersLocation: usersLocation, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
