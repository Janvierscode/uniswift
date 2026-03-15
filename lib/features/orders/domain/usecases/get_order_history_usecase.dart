import 'package:injectable/injectable.dart';
import '../entities/order_entity.dart';
import '../repositories/order_repository.dart';

@injectable
class GetOrderHistoryUseCase {
  final OrderRepository repository;

  GetOrderHistoryUseCase(this.repository);

  Future<List<OrderEntity>> call() => repository.getOrderHistory();
}
