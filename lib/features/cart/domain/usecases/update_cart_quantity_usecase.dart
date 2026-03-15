import 'package:injectable/injectable.dart';
import '../entities/cart_entity.dart';
import '../repositories/cart_repository.dart';

@injectable
class UpdateCartQuantityUseCase {
  final CartRepository repository;

  UpdateCartQuantityUseCase(this.repository);

  Future<CartEntity> call(String productId, int quantity) {
    return repository.updateQuantity(productId, quantity);
  }
}
