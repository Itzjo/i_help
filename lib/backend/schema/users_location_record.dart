import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'users_location_record.g.dart';

abstract class UsersLocationRecord
    implements Built<UsersLocationRecord, UsersLocationRecordBuilder> {
  static Serializer<UsersLocationRecord> get serializer =>
      _$usersLocationRecordSerializer;

  DocumentReference? get users;

  LatLng? get usersLocation;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(UsersLocationRecordBuilder builder) => builder;

  static CollectionReference get collection => //retrive firebase collection
      FirebaseFirestore.instance.collection('usersLocation');

  static Stream<UsersLocationRecord> getDocument(DocumentReference ref) =>
      ref //retrive all object location
          .snapshots()
          .map((s) =>
              serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<UsersLocationRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => serializers.deserializeWith(
          serializer, serializedData(s))!); //retrive specific location

  UsersLocationRecord._();
  factory UsersLocationRecord(
          [void Function(UsersLocationRecordBuilder) updates]) =
      _$UsersLocationRecord;

  static UsersLocationRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createUsersLocationRecordData({
  DocumentReference? users,
  LatLng? usersLocation,
}) {
  final firestoreData = serializers.toFirestore(
    UsersLocationRecord.serializer,
    UsersLocationRecord(
      (u) => u
        ..users = users
        ..usersLocation = usersLocation,
    ),
  );

  return firestoreData;
}
