import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_user.freezed.dart';

enum UserType {
  consumer,
  retailer,
  unknown,
}

@freezed
class AppUser with _$AppUser {
  const AppUser._();
  const factory AppUser({
    required String id,
    required UserType userType,
  }) = _AppUser;
}