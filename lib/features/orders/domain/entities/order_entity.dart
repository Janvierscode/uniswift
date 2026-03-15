import 'package:equatable/equatable.dart';
import '../../../catalog/domain/entities/product_entity.dart';

class OrderItemEntity extends Equatable {
  final ProductEntity product;
  final int quantity;

  const OrderItemEntity({required this.product, required this.quantity});

  @override
  List<Object?> get props => [product, quantity];
}

class OrderEntity extends Equatable {
  final String id;
  final DateTime date;
  final double total;
  final String status;
  final List<OrderItemEntity> items;
  final String address;
  final String paymentMethod;

  const OrderEntity({
    required this.id,
    required this.date,
    required this.total,
    required this.status,
    required this.items,
    required this.address,
    required this.paymentMethod,
  });

  @override
  List<Object?> get props => [
        id,
        date,
        total,
        status,
        items,
        address,
        paymentMethod,
      ];
}
