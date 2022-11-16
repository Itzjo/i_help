import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'emergency_contact_record.g.dart';

abstract class EmergencyContactRecord
    implements Built<EmergencyContactRecord, EmergencyContactRecordBuilder> {
  static Serializer<EmergencyContactRecord> get serializer =>
      _$emergencyContactRecordSerializer;

  DocumentReference? get users;

  @BuiltValueField(wireName: 'emergency_number')
  int? get emergencyNumber;

  @BuiltValueField(wireName: 'contact_name')
  String? get contactName;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(EmergencyContactRecordBuilder builder) =>
      builder
        ..emergencyNumber = 0
        ..contactName = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Emergency_contact');

  static Stream<EmergencyContactRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<EmergencyContactRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  EmergencyContactRecord._();
  factory EmergencyContactRecord(
          [void Function(EmergencyContactRecordBuilder) updates]) =
      _$EmergencyContactRecord;

  static EmergencyContactRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createEmergencyContactRecordData({
  DocumentReference? users,
  int? emergencyNumber,
  String? contactName,
}) {
  final firestoreData = serializers.toFirestore(
    EmergencyContactRecord.serializer,
    EmergencyContactRecord(
      (e) => e
        ..users = users
        ..emergencyNumber = emergencyNumber
        ..contactName = contactName,
    ),
  );

  return firestoreData;
}
