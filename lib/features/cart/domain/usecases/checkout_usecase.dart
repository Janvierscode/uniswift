import 'package:injectable/injectable.dart';
import '../repositories/cart_repository.dart';

@injectable
class CheckoutUseCase {
  final CartRepository repository;

  CheckoutUseCase(this.repository);

  Future<bool> call({required String address, required String paymentMethod}) {
    return repository.checkout(address: address, paymentMethod: paymentMethod);
  }
}
