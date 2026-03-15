import 'package:injectable/injectable.dart';
import '../../domain/repositories/profile_repository.dart';

@LazySingleton(as: ProfileRepository)
class ProfileRepositoryImpl implements ProfileRepository {
  @override
  Future<bool> submitProductReview(String productId, double rating, String comment) async {
    await Future.delayed(const Duration(seconds: 1));
    return true; // Mock success
  }

  @override
  Future<bool> submitServiceRating(String orderId, double rating, String comment) async {
    await Future.delayed(const Duration(seconds: 1));
    return true; 
  }

  @override
  Future<bool> submitProductSuggestion(String productName, String description) async {
    await Future.delayed(const Duration(seconds: 1));
    return true; 
  }
}
