import 'package:equatable/equatable.dart';

abstract class OrdersEvent extends Equatable {
  const OrdersEvent();

  @override
  List<Object?> get props => [];
}

class LoadOrderHistoryEvent extends OrdersEvent {}

class LoadOrderDetailsEvent extends OrdersEvent {
  final String orderId;

  const LoadOrderDetailsEvent(this.orderId);

  @override
  List<Object?> get props => [orderId];
}
