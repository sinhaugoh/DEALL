import 'package:deall/auth/infrastructure/auth_repository.dart';
import 'package:deall/core/application/value_validator.dart';
import 'package:deall/core/infrastructure/form_error_message.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'consumer_sign_up_form_notifier.freezed.dart';

@freezed
class ConsumerSignUpFormState with _$ConsumerSignUpFormState {
  const ConsumerSignUpFormState._();

  const factory ConsumerSignUpFormState({
    required bool showErrorMessage,
    required bool isSaving,
    required bool successful,
    required String? emailErrorMessage,
    required String? passwordErrorMessage,
    required String email,
    required String password,
  }) = _SignInFormState;

  factory ConsumerSignUpFormState.initial() => const ConsumerSignUpFormState(
        showErrorMessage: false,
        isSaving: false,
        successful: false,
        emailErrorMessage: null,
        passwordErrorMessage: null,
        email: '',
        password: '',
      );
}

class ConsumerSignUpFormNotifier extends StateNotifier<ConsumerSignUpFormState> {
  final AuthRepository _authRepository;

  ConsumerSignUpFormNotifier(this._authRepository) : super(ConsumerSignUpFormState.initial());



  void emailChanged(String email) {
    state = state.copyWith(email: email);
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
            stateCopy = stateCopy.copyWith(emailErrorMessage: FormErrorMessage.emailErrorMessage);
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

  Future<void> signUp() async {
    _validateInputs();

    //if the input are valid
    if (state.emailErrorMessage == null && state.passwordErrorMessage == null) {
      state = state.copyWith(
        isSaving: true,
      );

      final failureOrSuccess = await _authRepository.consumerSignUp(
        email: state.email,
        password: state.password,
      );

      failureOrSuccess.fold((authFailure) {
        authFailure.maybeWhen(
          server: (failureMessage) {
            state = state.copyWith(
              emailErrorMessage: failureMessage,
              isSaving: false,
            );
          },
          orElse: () {},
        );
      }, (_) {
        state = state.copyWith(
          isSaving: false,
          successful: true,
        );
      });
    }
  }
}