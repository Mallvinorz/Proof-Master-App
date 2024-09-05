import 'package:http/http.dart' as http;
import 'package:proofmaster/app/data/repositories/introduction_proof_repository_impl.dart';
import 'package:proofmaster/app/data/responses/student/get_introduction_proof_response/get_introduction_proof_response.dart';
import 'package:proofmaster/app/domain/repositories/introduction_proof_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'introduction_proof_provider.g.dart';

@riverpod
IntroductionProofRepository introductionProofRepository(
    IntroductionProofRepositoryRef ref) {
  return IntroductionProofRepositoryImpl(http.Client());
}

@riverpod
Future<GetIntroductionProofResponse> getMenuItems(GetMenuItemsRef ref) {
  return ref.watch(introductionProofRepositoryProvider).getMenuItems();
}
