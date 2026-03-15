import 'package:injectable/injectable.dart';
import '../../../catalog/domain/entities/product_entity.dart';
import '../../domain/entities/cart_entity.dart';
import '../../domain/entities/cart_item_entity.dart';
import '../../domain/repositories/cart_repository.dart';

@LazySingleton(as: CartRepository)
class CartRepositoryImpl implements CartRepository {
  CartEntity _cart = const CartEntity(items: []);

  @override
  Future<CartEntity> getCart() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return _cart;
  }

  @override
  Future<CartEntity> addToCart(ProductEntity product, int quantity) async {
    await Future.delayed(const Duration(milliseconds: 300));
    final currentItems = List<CartItemEntity>.from(_cart.items);
    final index = currentItems.indexWhere((item) => item.product.id == product.id);

    if (index >= 0) {
      currentItems[index] = currentItems[index].copyWith(
        quantity: currentItems[index].quantity + quantity,
      );
    } else {
      currentItems.add(CartItemEntity(product: product, quantity: quantity));
    }

    _cart = CartEntity(items: currentItems);
    return _cart;
  }

  @override
  Future<CartEntity> removeFromCart(String productId) async {
    await Future.delayed(const Duration(milliseconds: 300));
    final currentItems = List<CartItemEntity>.from(_cart.items)
      ..removeWhere((item) => item.product.id == productId);
    _cart = CartEntity(items: currentItems);
    return _cart;
  }

  @override
  Future<CartEntity> updateQuantity(String productId, int quantity) async {
    await Future.delayed(const Duration(milliseconds: 300));
    final currentItems = List<CartItemEntity>.from(_cart.items);
    final index = currentItems.indexWhere((item) => item.product.id == productId);

    if (index >= 0) {
      if (quantity <= 0) {
        currentItems.removeAt(index);
      } else {
        currentItems[index] = currentItems[index].copyWith(quantity: quantity);
      }
    }

    _cart = CartEntity(items: currentItems);
    return _cart;
  }

  @override
  Future<void> clearCart() async {
    await Future.delayed(const Duration(milliseconds: 300));
    _cart = const CartEntity(items: []);
  }

  @override
  Future<bool> checkout({required String address, required String paymentMethod}) async {
    await Future.delayed(const Duration(seconds: 2));
    // Mock success
    if (_cart.items.isEmpty) return false;
    await clearCart();
    return true;
  }
}
