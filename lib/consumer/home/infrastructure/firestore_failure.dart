import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'firestore_failure.freezed.dart';

@freezed
class FirestoreFailure with _$FirestoreFailure {
  const FirestoreFailure._();
  const factory FirestoreFailure.noConnection() = NoConnection;
  const factory FirestoreFailure.unknown() = Unknown;
  const factory FirestoreFailure.noData() = NoData;
}