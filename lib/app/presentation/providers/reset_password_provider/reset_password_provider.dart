import 'package:proofmaster/app/data/responses/general/reset_password_response.dart';
import 'package:proofmaster/app/domain/entities/input_text/inputtext.dart';
import 'package:proofmaster/app/presentation/providers/auth_provider/auth_provider.dart';
import 'package:proofmaster/app/utils/extensions/inputtext_extension.dart';
import 'package:proofmaster/app/utils/ui_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'reset_password_provider.g.dart';

class ResetPasswordState {
  final InputText email;
  final UIState<String> uiState;

  ResetPasswordState({
    InputText? email,
    InputText? passwordConfirm,
    UIState<String>? uiState,
  })  : email = email ??
            InputText(
                value: "",
                errorMessage: null,
                isRequired: true,
                regexCheck: r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$'),
        uiState = uiState ?? const UIInitial();

  ResetPasswordState copyWith({
    InputText? email,
    InputText? password,
    UIState<String>? uiState,
  }) {
    return ResetPasswordState(
      email: email ?? this.email,
      uiState: uiState ?? this.uiState,
    );
  }
}

@riverpod
class ResetPassword extends _$ResetPassword {
  @override
  ResetPasswordState build() {
    state = ResetPasswordState();
    return state;
  }

  Future<ResetPasswordResponse> performResetPasswordWithEmail() async {
    state = state.copyWith(uiState: const UILoading());

    try {
      final authRepository = ref.watch(authRepositoryProvider);
      final response = await authRepository.resetPassword(state.email.value);

      state = state.copyWith(
          uiState: const UISuccess("Password reset email sent successfully"));
      return response;
    } catch (e) {
      state = state.copyWith(uiState: UIError("$e"));
      throw Exception(e);
    }
  }

  void updateInputState({
    String? email,
  }) {
    final inputEmail = email != null
        ? state.email.copyWith(
            value: email, errorMessage: state.email.validateInput(email))
        : null;

    state = state.copyWith(
      email: inputEmail,
    );
  }
}
