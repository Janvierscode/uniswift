import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/usecases/get_order_details_usecase.dart';
import '../../domain/usecases/get_order_history_usecase.dart';
import 'orders_event.dart';
import 'orders_state.dart';

@injectable
class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  final GetOrderHistoryUseCase _getOrderHistory;
  final GetOrderDetailsUseCase _getOrderDetails;

  OrdersBloc(this._getOrderHistory, this._getOrderDetails) : super(OrdersInitial()) {
    on<LoadOrderHistoryEvent>((event, emit) async {
      emit(OrdersLoading());
      try {
        final orders = await _getOrderHistory();
        emit(OrderHistoryLoaded(orders));
      } catch (e) {
        emit(OrdersError(e.toString()));
      }
    });

    on<LoadOrderDetailsEvent>((event, emit) async {
      emit(OrdersLoading());
      try {
        final order = await _getOrderDetails(event.orderId);
        emit(OrderDetailsLoaded(order));
      } catch (e) {
        emit(OrdersError(e.toString()));
      }
    });
  }
}
