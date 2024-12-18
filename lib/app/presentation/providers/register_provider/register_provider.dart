import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proofmaster/app/data/repositories/auth_repository_impl.dart';
import 'package:proofmaster/app/domain/entities/input_text/inputtext.dart';
import 'package:proofmaster/app/domain/entities/register_dto/registerdto.dart';
import 'package:proofmaster/app/domain/repositories/auth_repository.dart';
import 'package:proofmaster/app/utils/extensions/inputtext_extension.dart';
import 'package:proofmaster/app/utils/ui_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'register_provider.g.dart';

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) {
  return AuthRepositoryImpl();
}

class RegisterState {
  final InputText email;
  final InputText name;
  final InputText nim;
  final InputText password;
  final InputText passwordConfirm;
  final UIState<String> uiState;

  RegisterState({
    InputText? email,
    InputText? name,
    InputText? nim,
    InputText? password,
    InputText? passwordConfirm,
    UIState<String>? uiState,
  })  : email = email ??
            InputText(
                value: "",
                errorMessage: null,
                isRequired: true,
                regexCheck: r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$'),
        name =
            name ?? InputText(value: "", errorMessage: null, isRequired: true),
        nim = nim ??
            InputText(
              value: "",
              errorMessage: null,
              isRequired: true,
              minLen: 11,
              maxLen: 13,
              regexCheck: r'^[0-9]+$',
            ),
        password = password ??
            InputText(value: "", errorMessage: null, isRequired: true),
        passwordConfirm = passwordConfirm ??
            InputText(value: "", errorMessage: null, isRequired: true),
        uiState = uiState ?? const UIInitial();

  RegisterState copyWith({
    InputText? email,
    InputText? name,
    InputText? nim,
    InputText? password,
    InputText? passwordConfirm,
    UIState<String>? uiState,
  }) {
    return RegisterState(
      email: email ?? this.email,
      name: name ?? this.name,
      nim: nim ?? this.nim,
      password: password ?? this.password,
      passwordConfirm: passwordConfirm ?? this.passwordConfirm,
      uiState: uiState ?? this.uiState,
    );
  }
}

class RegisterNotifier extends StateNotifier<RegisterState> {
  RegisterNotifier() : super(RegisterState());

  void updateInputState({
    String? email,
    String? name,
    String? nim,
    String? password,
    String? passwordConfirm,
  }) {
    final passwordCheckValue = password ?? state.password.value;
    final passwordConfirmCheckValue =
        passwordConfirm ?? state.passwordConfirm.value;
    final isPasswordSame = (passwordCheckValue != passwordConfirmCheckValue)
        ? "Password tidak sama"
        : null;

    final inputEmail = email != null
        ? state.email.copyWith(
            value: email, errorMessage: state.email.validateInput(email))
        : null;
    final inputName = name != null
        ? state.name
            .copyWith(value: name, errorMessage: state.name.validateInput(name))
        : null;
    final inputNim = nim != null
        ? state.nim
            .copyWith(value: nim, errorMessage: state.nim.validateInput(nim))
        : null;
    final inputPassword = password != null
        ? state.password.copyWith(
            value: password,
            minLen: 8,
            errorMessage: state.password.validateInput(password))
        : null;
    final inputPasswordConfirm = passwordConfirm != null
        ? state.passwordConfirm.copyWith(
            value: passwordConfirm,
            minLen: 8,
            errorMessage: isPasswordSame ??
                state.passwordConfirm.validateInput(passwordConfirm))
        : null;

    print(state.passwordConfirm);

    state = state.copyWith(
      email: inputEmail,
      name: inputName,
      nim: inputNim,
      password: inputPassword,
      passwordConfirm: inputPasswordConfirm,
    );
  }

  bool _checkIsAllInputValid() =>
      state.email.checkIsValid() &&
      state.name.checkIsValid() &&
      state.nim.checkIsValid() &&
      state.password.checkIsValid() &&
      state.passwordConfirm.checkIsValid();

  Future<void> performRegisterAccount() async {
    state = state.copyWith(uiState: const UILoading());
    try {
      if (!_checkIsAllInputValid()) {
        throw Exception("Error saat register, cek kembali form register anda!");
      }

      final authRepository = AuthRepositoryImpl();
      final registerDto = RegisterDTO(
          email: state.email.value,
          password: state.password.value,
          nim: state.nim.value,
          name: state.name.value);
      final result = await authRepository.signup(registerDto);
      state = state.copyWith(uiState: UISuccess(result.message ?? "-"));
    } catch (e) {
      state = state.copyWith(uiState: UIError(e.toString()));
      rethrow;
    }
  }

  void resetUiState() {
    state = state.copyWith(uiState: const UIInitial());
  }
}

final registerProvider =
    StateNotifierProvider.autoDispose<RegisterNotifier, RegisterState>((ref) {
  return RegisterNotifier();
});
