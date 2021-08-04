import 'package:freezed_annotation/freezed_annotation.dart';

part 'firestore_failures.freezed.dart';

@freezed
class FirestoreFailures with _$FirestoreFailures {
  const FirestoreFailures._();
  const factory FirestoreFailures.cancelledOperation() = CancelledOperation;
  const factory FirestoreFailures.objectNotFound() = ObjectNotFound;
  const factory FirestoreFailures.resourceExhausted() = ResourceExhausted;
  const factory FirestoreFailures.serviceUnavailable() = ServiceUnavailable;
  const factory FirestoreFailures.unknown() = Unknown;
  const factory FirestoreFailures.noConnection() = NoConnection;
}