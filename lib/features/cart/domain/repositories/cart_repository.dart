import '../../../catalog/domain/entities/product_entity.dart';
import '../entities/cart_entity.dart';

abstract class CartRepository {
  Future<CartEntity> getCart();
  Future<CartEntity> addToCart(ProductEntity product, int quantity);
  Future<CartEntity> removeFromCart(String productId);
  Future<CartEntity> updateQuantity(String productId, int quantity);
  Future<void> clearCart();
  Future<bool> checkout({required String address, required String paymentMethod});
}
