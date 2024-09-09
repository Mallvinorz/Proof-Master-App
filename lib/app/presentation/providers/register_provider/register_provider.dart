import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
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
  return AuthRepositoryImpl(http.Client());
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
    bool? isSuccess,
  }) {
    final isPasswordSame = password != null &&
            passwordConfirm != null &&
            (password != passwordConfirm)
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
            errorMessage: state.password.validateInput(password))
        : null;
    final inputPasswordConfirm = passwordConfirm != null
        ? state.passwordConfirm.copyWith(
            value: passwordConfirm,
            errorMessage:
                state.passwordConfirm.validateInput(passwordConfirm) ??
                    isPasswordSame)
        : null;

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

      final authRepository = AuthRepositoryImpl(http.Client());
      final registerDto = RegisterDTO(
          email: state.email.value,
          password: state.password.value,
          nim: "000",
          name: state.name.value);
      final result = await authRepository.signup(registerDto);
      state = state.copyWith(uiState: UISuccess(result.message ?? "-"));
    } catch (e) {
      state = state.copyWith(uiState: UIError(e.toString()));
    }
  }
}

final registerProvider =
    StateNotifierProvider<RegisterNotifier, RegisterState>((ref) {
  return RegisterNotifier();
});
