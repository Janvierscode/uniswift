import 'package:injectable/injectable.dart';
import '../entities/order_entity.dart';
import '../repositories/order_repository.dart';

@injectable
class GetOrderDetailsUseCase {
  final OrderRepository repository;

  GetOrderDetailsUseCase(this.repository);

  Future<OrderEntity> call(String orderId) => repository.getOrderDetails(orderId);
}
