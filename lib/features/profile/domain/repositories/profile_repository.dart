abstract class ProfileRepository {
  Future<bool> submitProductReview(String productId, double rating, String comment);
  Future<bool> submitServiceRating(String orderId, double rating, String comment);
  Future<bool> submitProductSuggestion(String productName, String description);
}
