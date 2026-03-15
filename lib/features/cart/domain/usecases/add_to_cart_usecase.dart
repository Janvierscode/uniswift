import 'package:injectable/injectable.dart';
import '../../../catalog/domain/entities/product_entity.dart';
import '../entities/cart_entity.dart';
import '../repositories/cart_repository.dart';

@injectable
class AddToCartUseCase {
  final CartRepository repository;

  AddToCartUseCase(this.repository);

  Future<CartEntity> call(ProductEntity product, int quantity) {
    return repository.addToCart(product, quantity);
  }
}
