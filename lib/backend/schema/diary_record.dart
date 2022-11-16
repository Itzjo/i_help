import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'diary_record.g.dart';

abstract class DiaryRecord implements Built<DiaryRecord, DiaryRecordBuilder> {
  static Serializer<DiaryRecord> get serializer => _$diaryRecordSerializer;

  @BuiltValueField(wireName: 'diary_title')
  String? get diaryTitle;

  @BuiltValueField(wireName: 'diary_content')
  String? get diaryContent;

  DocumentReference? get user;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(DiaryRecordBuilder builder) => builder
    ..diaryTitle = ''
    ..diaryContent = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Diary');

  static Stream<DiaryRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<DiaryRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  DiaryRecord._();
  factory DiaryRecord([void Function(DiaryRecordBuilder) updates]) =
      _$DiaryRecord;

  static DiaryRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createDiaryRecordData({
  String? diaryTitle,
  String? diaryContent,
  DocumentReference? user,
}) {
  final firestoreData = serializers.toFirestore(
    DiaryRecord.serializer,
    DiaryRecord(
      (d) => d
        ..diaryTitle = diaryTitle
        ..diaryContent = diaryContent
        ..user = user,
    ),
  );

  return firestoreData;
}
