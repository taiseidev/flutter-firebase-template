import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

const timestampConverter = TimestampConverter();

// FirestoreのTimestampとDateTimeをコンバート
class TimestampConverter implements JsonConverter<DateTime?, dynamic> {
  const TimestampConverter();
  @override
  DateTime? fromJson(dynamic json) {
    if (json is Timestamp) {
      return json.toDate();
    }
    return null;
  }

  // Firesotoreの書き込みの際にDateTimeを指定すると自動的にFieldValue.serverTimestampに変換
  @override
  dynamic toJson(DateTime? dateTime) =>
      dateTime == null ? null : Timestamp.fromDate(dateTime);
}
