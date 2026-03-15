import 'package:injectable/injectable.dart';
import '../entities/cart_entity.dart';
import '../repositories/cart_repository.dart';

@injectable
class GetCartUseCase {
  final CartRepository repository;

  GetCartUseCase(this.repository);

  Future<CartEntity> call() => repository.getCart();
}
