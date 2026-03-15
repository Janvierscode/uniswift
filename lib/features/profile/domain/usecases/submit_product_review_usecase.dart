import 'package:injectable/injectable.dart';
import '../repositories/profile_repository.dart';

@injectable
class SubmitProductReviewUseCase {
  final ProfileRepository repository;

  SubmitProductReviewUseCase(this.repository);

  Future<bool> call(String productId, double rating, String comment) {
    return repository.submitProductReview(productId, rating, comment);
  }
}
