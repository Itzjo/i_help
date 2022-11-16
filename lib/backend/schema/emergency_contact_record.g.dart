// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'emergency_contact_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<EmergencyContactRecord> _$emergencyContactRecordSerializer =
    new _$EmergencyContactRecordSerializer();

class _$EmergencyContactRecordSerializer
    implements StructuredSerializer<EmergencyContactRecord> {
  @override
  final Iterable<Type> types = const [
    EmergencyContactRecord,
    _$EmergencyContactRecord
  ];
  @override
  final String wireName = 'EmergencyContactRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, EmergencyContactRecord object,
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
    value = object.emergencyNumber;
    if (value != null) {
      result
        ..add('emergency_number')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.contactName;
    if (value != null) {
      result
        ..add('contact_name')
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
  EmergencyContactRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new EmergencyContactRecordBuilder();

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
        case 'emergency_number':
          result.emergencyNumber = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'contact_name':
          result.contactName = serializers.deserialize(value,
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

class _$EmergencyContactRecord extends EmergencyContactRecord {
  @override
  final DocumentReference<Object?>? users;
  @override
  final int? emergencyNumber;
  @override
  final String? contactName;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$EmergencyContactRecord(
          [void Function(EmergencyContactRecordBuilder)? updates]) =>
      (new EmergencyContactRecordBuilder()..update(updates))._build();

  _$EmergencyContactRecord._(
      {this.users, this.emergencyNumber, this.contactName, this.ffRef})
      : super._();

  @override
  EmergencyContactRecord rebuild(
          void Function(EmergencyContactRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EmergencyContactRecordBuilder toBuilder() =>
      new EmergencyContactRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EmergencyContactRecord &&
        users == other.users &&
        emergencyNumber == other.emergencyNumber &&
        contactName == other.contactName &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, users.hashCode), emergencyNumber.hashCode),
            contactName.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EmergencyContactRecord')
          ..add('users', users)
          ..add('emergencyNumber', emergencyNumber)
          ..add('contactName', contactName)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class EmergencyContactRecordBuilder
    implements Builder<EmergencyContactRecord, EmergencyContactRecordBuilder> {
  _$EmergencyContactRecord? _$v;

  DocumentReference<Object?>? _users;
  DocumentReference<Object?>? get users => _$this._users;
  set users(DocumentReference<Object?>? users) => _$this._users = users;

  int? _emergencyNumber;
  int? get emergencyNumber => _$this._emergencyNumber;
  set emergencyNumber(int? emergencyNumber) =>
      _$this._emergencyNumber = emergencyNumber;

  String? _contactName;
  String? get contactName => _$this._contactName;
  set contactName(String? contactName) => _$this._contactName = contactName;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  EmergencyContactRecordBuilder() {
    EmergencyContactRecord._initializeBuilder(this);
  }

  EmergencyContactRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _users = $v.users;
      _emergencyNumber = $v.emergencyNumber;
      _contactName = $v.contactName;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EmergencyContactRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EmergencyContactRecord;
  }

  @override
  void update(void Function(EmergencyContactRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EmergencyContactRecord build() => _build();

  _$EmergencyContactRecord _build() {
    final _$result = _$v ??
        new _$EmergencyContactRecord._(
            users: users,
            emergencyNumber: emergencyNumber,
            contactName: contactName,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
