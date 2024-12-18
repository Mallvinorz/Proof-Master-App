import 'package:fimber/fimber.dart';
import 'package:proofmaster/app/data/repositories/activity_repository_impl.dart';
import 'package:proofmaster/app/data/responses/student/get_understanding_proof_activity_response/get_understanding_proof_activity_response.dart';
import 'package:proofmaster/app/data/responses/teacher/get_answered_activity_from_student_response/get_answered_activity_from_student_response.dart';
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
    return _fetchActivities();
  }

  Future<List<ListItem>> _fetchActivities() async {
    final repository = ref.watch(activityRepositoryProvider);
    return repository.getActivities();
  }

  Future<void> refresh() async {
    ref.read(isRefreshingProvider.notifier).setRefreshing(true);
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _fetchActivities());
    ref.read(isRefreshingProvider.notifier).setRefreshing(false);
  }
}

@riverpod
class IsRefreshingAnswered extends _$IsRefreshingAnswered {
  @override
  bool build() => false;

  void setRefreshing(bool value) => state = value;
}

@riverpod
class ProofUnderstadingAnsweredActivitiesFromTeacher
    extends _$ProofUnderstadingAnsweredActivitiesFromTeacher {
  @override
  Future<List<ListItem>> build(String studentId) async {
    return _fetchActivities(studentId);
  }

  Future<List<ListItem>> _fetchActivities(String studentId) async {
    final repository = ref.watch(activityRepositoryProvider);
    return repository.getStudentAnsweredActivities(studentId);
  }

  Future<void> refresh(String studentId) async {
    ref.read(isRefreshingProvider.notifier).setRefreshing(true);
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _fetchActivities(studentId));
    ref.read(isRefreshingProvider.notifier).setRefreshing(false);
  }
}

@riverpod
class ProofUnderstadingAnsweredActivitiesFromStudent
    extends _$ProofUnderstadingAnsweredActivitiesFromStudent {
  @override
  Future<List<ListItem>> build() async {
    return _fetchActivities();
  }

  Future<List<ListItem>> _fetchActivities() async {
    final repository = ref.watch(activityRepositoryProvider);
    return repository.getStudentAnsweredActivitiesFromStudent();
  }

  Future<void> refresh() async {
    ref.read(isRefreshingProvider.notifier).setRefreshing(true);
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _fetchActivities());
    ref.read(isRefreshingProvider.notifier).setRefreshing(false);
  }
}

@riverpod
class IsRefreshingAnsweredDetail extends _$IsRefreshingAnsweredDetail {
  @override
  bool build() => false;

  void setRefreshing(bool value) => state = value;
}

@riverpod
class ProofUnderstadingAnsweredDetailActivity
    extends _$ProofUnderstadingAnsweredDetailActivity {
  @override
  Future<GetAnsweredActivityFromStudentResponse> build(
      String activityId) async {
    return _fetchDetailActivity(activityId);
  }

  Future<GetAnsweredActivityFromStudentResponse> _fetchDetailActivity(
      String activityId) async {
    final repository = ref.watch(activityRepositoryProvider);
    return repository.getStudentAnsweredActivity(activityId);
  }

  Future<void> refresh(String activityId) async {
    ref.read(isRefreshingProvider.notifier).setRefreshing(true);
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _fetchDetailActivity(activityId));
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
