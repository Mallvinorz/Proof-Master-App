import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:fimber/fimber.dart';
import 'package:http/http.dart' as http;
import 'package:proofmaster/app/data/repositories/activity_repository_impl.dart';
import 'package:proofmaster/app/domain/repositories/activity_repository.dart';
import 'package:proofmaster/app/utils/ui_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'activity_provider.g.dart';

@riverpod
ActivityRepository activityRepository(ActivityRepositoryRef ref) {
  return ActivityRepositoryImpl(http.Client());
}

class ActivityState {
  final UIState<String> uploadUiState;

  ActivityState({
    UIState<String>? uiState,
  }) : uploadUiState = uiState ?? const UIInitial();

  ActivityState copyWith({
    UIState<String>? uiState,
  }) {
    return ActivityState(
      uiState: uiState ?? uploadUiState,
    );
  }
}

@Riverpod(keepAlive: false)
class Activity extends _$Activity {
  @override
  ActivityState build() {
    return ActivityState();
  }

  Future<void> performUploadFile(
      FilePickerResult? pickedFile, String id) async {
    state = state.copyWith(uiState: const UILoading());
    try {
      final PlatformFile? pdfFile = pickedFile?.files[0];

      if (pdfFile?.path == null) {
        throw Exception("File path is invalid! Filepath is null");
      }

      final activityRepository = ref.read(activityRepositoryProvider);
      final result = await activityRepository.uploadFile(
          File(pdfFile!.path!), pdfFile.name, id);
      Fimber.d("Test message $result");

      state = state.copyWith(
          uiState: const UISuccess("Berhasil upload file jawaban"));
    } catch (e) {
      state = state.copyWith(uiState: UIError(e.toString()));
      rethrow;
    }
  }

  void resetUiState() {
    state = state.copyWith(uiState: const UIInitial());
  }
}
