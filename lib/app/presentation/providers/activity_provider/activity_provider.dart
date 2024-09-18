import 'package:fimber/fimber.dart';
import 'package:proofmaster/app/data/repositories/activity_repository_impl.dart';
import 'package:proofmaster/app/data/responses/student/get_understanding_proof_activity_response/get_understanding_proof_activity_response.dart';
import 'package:proofmaster/app/domain/entities/list_item/list_item.dart';
import 'package:proofmaster/app/domain/entities/post_understanding_proof_answer_dto/postunderstandingproofanswedto.dart';
import 'package:proofmaster/app/domain/repositories/activity_repository.dart';
import 'package:proofmaster/app/utils/ui_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'activity_provider.g.dart';

@riverpod
ActivityRepository activityRepository(ActivityRepositoryRef ref) {
  return ActivityRepositoryImpl();
}

@riverpod
class IsRefreshing extends _$IsRefreshing {
  @override
  bool build() => false;

  void setRefreshing(bool value) => state = value;
}

@riverpod
class ProofUnderstadingActivities extends _$ProofUnderstadingActivities {
  @override
  Future<List<ListItem>> build() async {
    return _fetchMenus();
  }

  Future<List<ListItem>> _fetchMenus() async {
    final repository = ref.watch(activityRepositoryProvider);
    return repository.getActivities();
  }

  Future<void> refresh() async {
    ref.read(isRefreshingProvider.notifier).setRefreshing(true);
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _fetchMenus());
    ref.read(isRefreshingProvider.notifier).setRefreshing(false);
  }
}

@riverpod
class IsRefreshingPdfActivity extends _$IsRefreshingPdfActivity {
  @override
  bool build() => false;

  void setRefreshing(bool value) => state = value;
}

@riverpod
class ProofUnderstadingActivity extends _$ProofUnderstadingActivity {
  @override
  Future<GetUnderstandingProofActivityResponse> build(String activityId) async {
    return _fetchActivity(activityId);
  }

  Future<GetUnderstandingProofActivityResponse> _fetchActivity(
      String activityId) async {
    final repository = ref.watch(activityRepositoryProvider);
    return repository.getActivity(activityId);
  }

  Future<void> refresh(String activityId) async {
    ref.read(isRefreshingProvider.notifier).setRefreshing(true);
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _fetchActivity(activityId));
    ref.read(isRefreshingProvider.notifier).setRefreshing(false);
  }
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

  Future<void> performUploadFile(PostUnderstandingProofAnsweDto dto) async {
    state = state.copyWith(uiState: const UILoading());
    try {
      final activityRepository = ref.read(activityRepositoryProvider);
      final result = await activityRepository.uploadFile(dto);

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
