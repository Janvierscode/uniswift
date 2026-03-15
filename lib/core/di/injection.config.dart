// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth/data/repositories/auth_repository_impl.dart'
    as _i153;
import '../../features/auth/domain/repositories/auth_repository.dart' as _i787;
import '../../features/auth/domain/usecases/login_usecase.dart' as _i188;
import '../../features/auth/domain/usecases/signup_usecase.dart' as _i57;
import '../../features/auth/presentation/bloc/auth_bloc.dart' as _i797;
import '../../features/cart/data/repositories/cart_repository_impl.dart'
    as _i642;
import '../../features/cart/domain/repositories/cart_repository.dart' as _i322;
import '../../features/cart/domain/usecases/add_to_cart_usecase.dart' as _i659;
import '../../features/cart/domain/usecases/clear_cart_usecase.dart' as _i240;
import '../../features/cart/domain/usecases/get_cart_usecase.dart' as _i179;
import '../../features/cart/domain/usecases/remove_from_cart_usecase.dart'
    as _i355;
import '../../features/cart/domain/usecases/update_cart_quantity_usecase.dart'
    as _i302;
import '../../features/cart/presentation/bloc/cart_bloc.dart' as _i517;
import '../../features/catalog/data/repositories/catalog_repository_impl.dart'
    as _i428;
import '../../features/catalog/domain/repositories/catalog_repository.dart'
    as _i1018;
import '../../features/catalog/domain/usecases/get_categories_usecase.dart'
    as _i209;
import '../../features/catalog/domain/usecases/get_popular_products_usecase.dart'
    as _i7;
import '../../features/catalog/domain/usecases/get_products_by_category_usecase.dart'
    as _i298;
import '../../features/catalog/presentation/bloc/catalog_bloc.dart' as _i773;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i787.AuthRepository>(() => _i153.AuthRepositoryImpl());
    gh.lazySingleton<_i1018.CatalogRepository>(
      () => _i428.CatalogRepositoryImpl(),
    );
    gh.lazySingleton<_i322.CartRepository>(() => _i642.CartRepositoryImpl());
    gh.factory<_i188.LoginUseCase>(
      () => _i188.LoginUseCase(gh<_i787.AuthRepository>()),
    );
    gh.factory<_i57.SignUpUseCase>(
      () => _i57.SignUpUseCase(gh<_i787.AuthRepository>()),
    );
    gh.factory<_i209.GetCategoriesUseCase>(
      () => _i209.GetCategoriesUseCase(gh<_i1018.CatalogRepository>()),
    );
    gh.factory<_i7.GetPopularProductsUseCase>(
      () => _i7.GetPopularProductsUseCase(gh<_i1018.CatalogRepository>()),
    );
    gh.factory<_i298.GetProductsByCategoryUseCase>(
      () => _i298.GetProductsByCategoryUseCase(gh<_i1018.CatalogRepository>()),
    );
    gh.factory<_i659.AddToCartUseCase>(
      () => _i659.AddToCartUseCase(gh<_i322.CartRepository>()),
    );
    gh.factory<_i240.ClearCartUseCase>(
      () => _i240.ClearCartUseCase(gh<_i322.CartRepository>()),
    );
    gh.factory<_i179.GetCartUseCase>(
      () => _i179.GetCartUseCase(gh<_i322.CartRepository>()),
    );
    gh.factory<_i355.RemoveFromCartUseCase>(
      () => _i355.RemoveFromCartUseCase(gh<_i322.CartRepository>()),
    );
    gh.factory<_i302.UpdateCartQuantityUseCase>(
      () => _i302.UpdateCartQuantityUseCase(gh<_i322.CartRepository>()),
    );
    gh.factory<_i797.AuthBloc>(
      () => _i797.AuthBloc(
        gh<_i188.LoginUseCase>(),
        gh<_i57.SignUpUseCase>(),
        gh<_i787.AuthRepository>(),
      ),
    );
    gh.factory<_i773.CatalogBloc>(
      () => _i773.CatalogBloc(
        gh<_i209.GetCategoriesUseCase>(),
        gh<_i7.GetPopularProductsUseCase>(),
        gh<_i298.GetProductsByCategoryUseCase>(),
      ),
    );
    gh.factory<_i517.CartBloc>(
      () => _i517.CartBloc(
        gh<_i179.GetCartUseCase>(),
        gh<_i659.AddToCartUseCase>(),
        gh<_i355.RemoveFromCartUseCase>(),
        gh<_i302.UpdateCartQuantityUseCase>(),
        gh<_i240.ClearCartUseCase>(),
      ),
    );
    return this;
  }
}
