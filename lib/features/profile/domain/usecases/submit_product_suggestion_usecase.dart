import 'package:injectable/injectable.dart';
import '../repositories/profile_repository.dart';

@injectable
class SubmitProductSuggestionUseCase {
  final ProfileRepository repository;

  SubmitProductSuggestionUseCase(this.repository);

  Future<bool> call(String productName, String description) {
    return repository.submitProductSuggestion(productName, description);
  }
}
