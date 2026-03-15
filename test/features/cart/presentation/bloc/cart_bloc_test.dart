import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:uniswift/features/cart/domain/entities/cart_entity.dart';
import 'package:uniswift/features/cart/domain/usecases/add_to_cart_usecase.dart';
import 'package:uniswift/features/cart/domain/usecases/get_cart_usecase.dart';
import 'package:uniswift/features/cart/domain/usecases/remove_from_cart_usecase.dart';
import 'package:uniswift/features/cart/domain/usecases/update_cart_quantity_usecase.dart';
import 'package:uniswift/features/cart/domain/usecases/clear_cart_usecase.dart';
import 'package:uniswift/features/cart/domain/usecases/checkout_usecase.dart';
import 'package:uniswift/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:uniswift/features/cart/presentation/bloc/cart_event.dart';
import 'package:uniswift/features/cart/presentation/bloc/cart_state.dart';

class MockGetCartUseCase extends Mock implements GetCartUseCase {}
class MockAddToCartUseCase extends Mock implements AddToCartUseCase {}
class MockRemoveFromCartUseCase extends Mock implements RemoveFromCartUseCase {}
class MockUpdateCartQuantityUseCase extends Mock implements UpdateCartQuantityUseCase {}
class MockClearCartUseCase extends Mock implements ClearCartUseCase {}
class MockCheckoutUseCase extends Mock implements CheckoutUseCase {}

void main() {
  late MockGetCartUseCase mockGetCart;
  late MockAddToCartUseCase mockAddToCart;
  late MockRemoveFromCartUseCase mockRemoveFromCart;
  late MockUpdateCartQuantityUseCase mockUpdateQty;
  late MockClearCartUseCase mockClearCart;
  late MockCheckoutUseCase mockCheckout;
  late CartBloc cartBloc;

  setUp(() {
    mockGetCart = MockGetCartUseCase();
    mockAddToCart = MockAddToCartUseCase();
    mockRemoveFromCart = MockRemoveFromCartUseCase();
    mockUpdateQty = MockUpdateCartQuantityUseCase();
    mockClearCart = MockClearCartUseCase();
    mockCheckout = MockCheckoutUseCase();

    cartBloc = CartBloc(
      mockGetCart,
      mockAddToCart,
      mockRemoveFromCart,
      mockUpdateQty,
      mockClearCart,
      mockCheckout,
    );
  });

  tearDown(() {
    cartBloc.close();
  });

  group('CartBloc', () {
    const emptyCart = CartEntity(items: []);

    test('initial state should be CartInitial', () {
      expect(cartBloc.state, CartInitial());
    });

    blocTest<CartBloc, CartState>(
      'emits [CartLoading, CartLoaded] when LoadCartEvent succeeds',
      build: () {
        when(() => mockGetCart()).thenAnswer((_) async => emptyCart);
        return cartBloc;
      },
      act: (bloc) => bloc.add(LoadCartEvent()),
      expect: () => [
        CartLoading(),
        const CartLoaded(emptyCart),
      ],
    );

    blocTest<CartBloc, CartState>(
      'emits [CheckoutProcessing, CheckoutSuccess] when CheckoutCartEvent succeeds',
      build: () {
        when(() => mockCheckout(address: any(named: 'address'), paymentMethod: any(named: 'paymentMethod')))
            .thenAnswer((_) async => true);
        return cartBloc;
      },
      act: (bloc) => bloc.add(const CheckoutCartEvent(address: 'Test Addr', paymentMethod: 'EcoCash')),
      expect: () => [
        CheckoutProcessing(),
        CheckoutSuccess(),
      ],
    );
    
    blocTest<CartBloc, CartState>(
      'emits [CheckoutProcessing, CartError] when CheckoutCartEvent fails',
      build: () {
        when(() => mockCheckout(address: any(named: 'address'), paymentMethod: any(named: 'paymentMethod')))
            .thenAnswer((_) async => false);
        return cartBloc;
      },
      act: (bloc) => bloc.add(const CheckoutCartEvent(address: 'Test Addr', paymentMethod: 'EcoCash')),
      expect: () => [
        CheckoutProcessing(),
        const CartError("Checkout failed. Cart might be empty."),
      ],
    );
  });
}
