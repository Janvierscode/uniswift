import 'package:equatable/equatable.dart';
import '../../../catalog/domain/entities/product_entity.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object?> get props => [];
}

class LoadCartEvent extends CartEvent {}

class AddToCartEvent extends CartEvent {
  final ProductEntity product;
  final int quantity;

  const AddToCartEvent(this.product, {this.quantity = 1});

  @override
  List<Object?> get props => [product, quantity];
}

class UpdateCartItemQuantityEvent extends CartEvent {
  final String productId;
  final int quantity;

  const UpdateCartItemQuantityEvent(this.productId, this.quantity);

  @override
  List<Object?> get props => [productId, quantity];
}

class RemoveFromCartEvent extends CartEvent {
  final String productId;

  const RemoveFromCartEvent(this.productId);

  @override
  List<Object?> get props => [productId];
}

class ClearCartEvent extends CartEvent {}

class CheckoutCartEvent extends CartEvent {
  final String address;
  final String paymentMethod;

  const CheckoutCartEvent({required this.address, required this.paymentMethod});

  @override
  List<Object?> get props => [address, paymentMethod];
}
