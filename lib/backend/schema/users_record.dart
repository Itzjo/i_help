import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'users_record.g.dart';

abstract class UsersRecord implements Built<UsersRecord, UsersRecordBuilder> {
  static Serializer<UsersRecord> get serializer =>
      _$usersRecordSerializer; //make it into a object

  String? get email;

  String? get uid;

  @BuiltValueField(wireName: 'phone_number')
  String? get phoneNumber;

  String? get username;

  @BuiltValueField(wireName: 'photo_url')
  String? get photoUrl;

  @BuiltValueField(wireName: 'created_time')
  DateTime? get createdTime;

  String? get userpassword;

  @BuiltValueField(wireName: 'display_name')
  String? get displayName;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(UsersRecordBuilder builder) => builder
    ..email = ''
    ..uid = ''
    ..phoneNumber = ''
    ..username = ''
    ..photoUrl = ''
    ..userpassword = ''
    ..displayName = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users'); //take from collection

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => serializers.deserializeWith(
          serializer, serializedData(s))!); //take list of items from collection

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => serializers.deserializeWith(
          serializer, serializedData(s))!); //get specific data

  UsersRecord._();
  factory UsersRecord([void Function(UsersRecordBuilder) updates]) =
      _$UsersRecord;

  static UsersRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createUsersRecordData({
  //map = object
  String? email,
  String? uid,
  String? phoneNumber,
  String? username,
  String? photoUrl,
  DateTime? createdTime,
  String? userpassword,
  String? displayName,
}) {
  final firestoreData = serializers.toFirestore(
    UsersRecord.serializer,
    UsersRecord(
      (u) => u
        ..email = email
        ..uid = uid
        ..phoneNumber = phoneNumber
        ..username = username
        ..photoUrl = photoUrl
        ..createdTime = createdTime
        ..userpassword = userpassword
        ..displayName = displayName,
    ),
  );

  return firestoreData;
}
