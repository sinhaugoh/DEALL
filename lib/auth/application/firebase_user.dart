import 'package:freezed_annotation/freezed_annotation.dart';

part 'firebase_user.freezed.dart';

enum UserType {
  consumer,
  retailer,
  unknown,
}

@freezed
class FirebaseUser with _$FirebaseUser {
  const FirebaseUser._();
  const factory FirebaseUser({
    required String id,
    required UserType userType,
  }) = _FirebaseUser;
}