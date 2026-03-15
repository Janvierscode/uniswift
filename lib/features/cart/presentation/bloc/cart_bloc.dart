import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/usecases/add_to_cart_usecase.dart';
import '../../domain/usecases/checkout_usecase.dart';
import '../../domain/usecases/clear_cart_usecase.dart';
import '../../domain/usecases/get_cart_usecase.dart';
import '../../domain/usecases/remove_from_cart_usecase.dart';
import '../../domain/usecases/update_cart_quantity_usecase.dart';
import 'cart_event.dart';
import 'cart_state.dart';

@injectable
class CartBloc extends Bloc<CartEvent, CartState> {
  final GetCartUseCase _getCart;
  final AddToCartUseCase _addToCart;
  final RemoveFromCartUseCase _removeFromCart;
  final UpdateCartQuantityUseCase _updateQuantity;
  final ClearCartUseCase _clearCart;
  final CheckoutUseCase _checkout;

  CartBloc(
    this._getCart,
    this._addToCart,
    this._removeFromCart,
    this._updateQuantity,
    this._clearCart,
    this._checkout,
  ) : super(CartInitial()) {
    on<LoadCartEvent>((event, emit) async {
      emit(CartLoading());
      try {
        final cart = await _getCart();
        emit(CartLoaded(cart));
      } catch (e) {
        emit(CartError(e.toString()));
      }
    });

    on<AddToCartEvent>((event, emit) async {
      try {
        final cart = await _addToCart(event.product, event.quantity);
        emit(CartLoaded(cart));
      } catch (e) {
        emit(CartError(e.toString()));
      }
    });

    on<UpdateCartItemQuantityEvent>((event, emit) async {
      try {
        final cart = await _updateQuantity(event.productId, event.quantity);
        emit(CartLoaded(cart));
      } catch (e) {
        emit(CartError(e.toString()));
      }
    });

    on<RemoveFromCartEvent>((event, emit) async {
      try {
        final cart = await _removeFromCart(event.productId);
        emit(CartLoaded(cart));
      } catch (e) {
        emit(CartError(e.toString()));
      }
    });

    on<ClearCartEvent>((event, emit) async {
      try {
        await _clearCart();
        final cart = await _getCart();
        emit(CartLoaded(cart));
      } catch (e) {
        emit(CartError(e.toString()));
      }
    });

    on<CheckoutCartEvent>((event, emit) async {
      emit(CheckoutProcessing());
      try {
        final success = await _checkout(
          address: event.address,
          paymentMethod: event.paymentMethod,
        );
        if (success) {
          emit(CheckoutSuccess());
        } else {
          emit(const CartError("Checkout failed. Cart might be empty."));
        }
      } catch (e) {
        emit(CartError(e.toString()));
      }
    });
  }
}
