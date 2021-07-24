import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_failure.freezed.dart';

@freezed
class AuthFailure with _$AuthFailure {
  const AuthFailure._();
  const factory AuthFailure.server(String errorMessage) = Server;
  const factory AuthFailure.noConnection() = NoConnection;
  const factory AuthFailure.unexpectedError(String errorMessage) = UnexpectedError;
}