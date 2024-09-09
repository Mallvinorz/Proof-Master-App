import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:proofmaster/app/data/repositories/auth_repository_impl.dart';
import 'package:proofmaster/app/domain/entities/auth_dto/authdto.dart';
import 'package:proofmaster/app/domain/entities/input_text/inputtext.dart';
import 'package:proofmaster/app/domain/repositories/auth_repository.dart';
import 'package:proofmaster/app/utils/extensions/inputtext_extension.dart';
import 'package:proofmaster/app/utils/ui_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) {
  return AuthRepositoryImpl(http.Client());
}

class AuthState {
  final InputText email;
  final InputText password;
  final UIState<String> uiState;

  AuthState({
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
        password = password ??
            InputText(value: "", errorMessage: null, isRequired: true),
        uiState = uiState ?? const UIInitial();

  AuthState copyWith({
    InputText? email,
    InputText? password,
    UIState<String>? uiState,
  }) {
    return AuthState(
      email: email ?? this.email,
      password: password ?? this.password,
      uiState: uiState ?? this.uiState,
    );
  }
}

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(AuthState());

  void updateInputState({
    String? email,
    String? password,
  }) {
    final inputEmail = email != null
        ? state.email.copyWith(
            value: email, errorMessage: state.email.validateInput(email))
        : null;
    final inputPassword = password != null
        ? state.password.copyWith(
            value: password,
            minLen: 8,
            errorMessage: state.password.validateInput(password))
        : null;

    state = state.copyWith(
      email: inputEmail,
      password: inputPassword,
    );
  }

  bool _checkIsAllInputValid() =>
      state.email.checkIsValid() && state.password.checkIsValid();

  Future<String> performSignin() async {
    state = state.copyWith(uiState: const UILoading());
    try {
      if (!_checkIsAllInputValid()) {
        throw Exception("Error saat register, cek kembali form register anda!");
      }

      final authRepository = AuthRepositoryImpl(http.Client());
      final authDto =
          AuthDTO(email: state.email.value, password: state.password.value);
      final result = await authRepository.signin(authDto, authDto.password);
      if (result.data?.role == null) {
        throw Exception("User belum teregistrasi");
      }

      state = state.copyWith(uiState: UISuccess(result.data!.role!));
      return result.data!.role!;
    } catch (e) {
      state = state.copyWith(uiState: UIError(e.toString()));
      rethrow;
    }
  }

  void resetUiState() {
    state = state.copyWith(uiState: const UIInitial());
  }
}

final authProvider =
    StateNotifierProvider.autoDispose<AuthNotifier, AuthState>((ref) {
  return AuthNotifier();
});
