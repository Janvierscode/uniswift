import 'package:equatable/equatable.dart';
import 'cart_item_entity.dart';

class CartEntity extends Equatable {
  final List<CartItemEntity> items;

  const CartEntity({
    required this.items,
  });

  double get subtotal => items.fold(0, (sum, item) => sum + item.totalPrice);
  double get deliveryFee => 2.0; // Mock fixed delivery fee
  double get total => subtotal + deliveryFee;

  @override
  List<Object?> get props => [items];
}
