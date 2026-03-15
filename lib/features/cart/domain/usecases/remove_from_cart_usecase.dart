import 'package:injectable/injectable.dart';
import '../entities/cart_entity.dart';
import '../repositories/cart_repository.dart';

@injectable
class RemoveFromCartUseCase {
  final CartRepository repository;

  RemoveFromCartUseCase(this.repository);

  Future<CartEntity> call(String productId) {
    return repository.removeFromCart(productId);
  }
}
