import 'package:deall/auth/application/app_user.dart';
import 'package:deall/auth/infrastructure/auth_repository.dart';
import 'package:deall/core/application/value_validator.dart';
import 'package:deall/core/infrastructure/form_error_message.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_form_notifier.freezed.dart';

@freezed
class SignInFormState with _$SignInFormState {
  const SignInFormState._();

  const factory SignInFormState({
    required bool hasConnection,
    required bool showErrorMessage,
    required bool isSaving,
    required String? emailErrorMessage,
    required String? passwordErrorMessage,
    required String email,
    required String password,
    required UserType userType,
    required bool hidePassword,
  }) = _SignInFormState;

  factory SignInFormState.initial() => const SignInFormState(
        hasConnection: true,
        showErrorMessage: false,
        isSaving: false,
        emailErrorMessage: null,
        passwordErrorMessage: null,
        email: '',
        password: '',
        userType: UserType.unknown,
        hidePassword: true,
      );
}

class SignInFormNotifier extends StateNotifier<SignInFormState> {
  final AuthRepository _authRepository;

  SignInFormNotifier(this._authRepository) : super(SignInFormState.initial());

  void emailChanged(String email) {
    state = state.copyWith(email: email.trim());
  }

  void passwordChanged(String password) {
    state = state.copyWith(password: password);
  }

  void _validateInputs() {
    var stateCopy = state.copyWith(showErrorMessage: true);

    //validate email
    final emailValidate = validateEmail(state.email);
    emailValidate.fold(
      (valueFailure) => valueFailure.maybeWhen(
          invalidEmail: () {
            stateCopy = stateCopy.copyWith(
                emailErrorMessage: FormErrorMessage.emailErrorMessage);
          },
          orElse: () {}),
      (r) {
        stateCopy = stateCopy.copyWith(emailErrorMessage: null);
      },
    );

    //validate password
    final passwordValidate = validatePassword(state.password);
    passwordValidate.fold(
      (valueFailure) => valueFailure.maybeWhen(
          invalidPassword: () {
            stateCopy = stateCopy.copyWith(
                passwordErrorMessage: FormErrorMessage.passwordErrorMessage);
          },
          orElse: () {}),
      (r) {
        stateCopy = stateCopy.copyWith(passwordErrorMessage: null);
      },
    );

    state = stateCopy;
  }

  void toggleShowPassword() {
    state = state.copyWith(hidePassword: !state.hidePassword);
  }

  Future<void> signIn() async {
    _validateInputs();

    //if the input are valid
    if (state.emailErrorMessage == null && state.passwordErrorMessage == null) {
      state = state.copyWith(
        isSaving: true,
        hasConnection: true,
      );

      final failureOrSuccess = await _authRepository.signIn(
        email: state.email,
        password: state.password,
      );

      failureOrSuccess.fold((authFailure) {
        authFailure.maybeMap(
          server: (_) {
            state = state.copyWith(
              emailErrorMessage: FormErrorMessage.signInAuthfailureMessage,
              passwordErrorMessage: FormErrorMessage.signInAuthfailureMessage,
              isSaving: false,
            );
          },
          noConnection: (_) {
            state = state.copyWith(
              hasConnection: false,
              isSaving: false,
            );
          },
          orElse: () {},
        );
      }, (firebaseUser) {
        state = state.copyWith(
          isSaving: false,
          userType: firebaseUser.userType,
        );
      });
    }
  }
}
