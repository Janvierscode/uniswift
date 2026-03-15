import 'package:injectable/injectable.dart';
import '../repositories/profile_repository.dart';

@injectable
class SubmitServiceRatingUseCase {
  final ProfileRepository repository;

  SubmitServiceRatingUseCase(this.repository);

  Future<bool> call(String orderId, double rating, String comment) {
    return repository.submitServiceRating(orderId, rating, comment);
  }
}
