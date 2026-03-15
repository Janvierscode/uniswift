import 'package:injectable/injectable.dart';
import '../repositories/cart_repository.dart';

@injectable
class ClearCartUseCase {
  final CartRepository repository;

  ClearCartUseCase(this.repository);

  Future<void> call() {
    return repository.clearCart();
  }
}
