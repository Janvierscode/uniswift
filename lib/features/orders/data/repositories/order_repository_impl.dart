import 'package:injectable/injectable.dart';
import 'package:uniswift/features/catalog/domain/entities/product_entity.dart';
import '../../domain/entities/order_entity.dart';
import '../../domain/repositories/order_repository.dart';

@LazySingleton(as: OrderRepository)
class OrderRepositoryImpl implements OrderRepository {
  final List<OrderEntity> _mockOrders = [
    OrderEntity(
      id: 'ORD-1001',
      date: DateTime.now().subtract(const Duration(minutes: 15)),
      total: 6.50,
      status: 'On the way',
      address: 'Dorm Block A, Room 102',
      paymentMethod: 'EcoCash',
      items: const [
        OrderItemEntity(
          product: ProductEntity(
            id: 'p1',
            title: 'Lays Potato Chips',
            description: 'Classic salted potato chips.',
            price: 1.50,
            imageUrl: 'https://via.placeholder.com/150',
            categoryId: 'c1',
          ),
          quantity: 2,
        ),
        OrderItemEntity(
          product: ProductEntity(
            id: 'p2',
            title: 'Coca-Cola 500ml',
            description: 'Refreshing cold drink.',
            price: 1.00,
            imageUrl: 'https://via.placeholder.com/150',
            categoryId: 'c2',
          ),
          quantity: 1,
        ),
      ],
    ),
    OrderEntity(
      id: 'ORD-0985',
      date: DateTime.now().subtract(const Duration(days: 2)),
      total: 12.00,
      status: 'Delivered',
      address: 'Design Studio 3',
      paymentMethod: 'Visa',
      items: const [
        OrderItemEntity(
          product: ProductEntity(
            id: 'p5',
            title: 'Type-C Charger Cable',
            description: 'Fast charging Type-C cable.',
            price: 5.00,
            imageUrl: 'https://via.placeholder.com/150',
            categoryId: 'c5',
          ),
          quantity: 2,
        ),
      ],
    ),
  ];

  @override
  Future<List<OrderEntity>> getOrderHistory() async {
    await Future.delayed(const Duration(milliseconds: 600));
    return _mockOrders;
  }

  @override
  Future<OrderEntity> getOrderDetails(String orderId) async {
    await Future.delayed(const Duration(milliseconds: 400));
    return _mockOrders.firstWhere((o) => o.id == orderId);
  }
}
