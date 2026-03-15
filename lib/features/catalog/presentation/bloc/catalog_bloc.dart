import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/usecases/get_categories_usecase.dart';
import '../../domain/usecases/get_popular_products_usecase.dart';
import '../../domain/usecases/get_products_by_category_usecase.dart';
import 'catalog_event.dart';
import 'catalog_state.dart';

@injectable
class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {
  final GetCategoriesUseCase _getCategories;
  final GetPopularProductsUseCase _getPopularProducts;
  final GetProductsByCategoryUseCase _getProductsByCategory;

  CatalogBloc(
    this._getCategories,
    this._getPopularProducts,
    this._getProductsByCategory,
  ) : super(CatalogInitial()) {
    on<LoadHomeCatalogEvent>((event, emit) async {
      emit(CatalogLoading());
      try {
        final categories = await _getCategories();
        final popularProducts = await _getPopularProducts();
        
        emit(HomeCatalogLoaded(
          categories: categories,
          popularProducts: popularProducts, 
        ));
      } catch (e) {
        emit(CatalogError(e.toString()));
      }
    });

    on<LoadCategoryProductsEvent>((event, emit) async {
      emit(CatalogLoading());
      try {
        final products = await _getProductsByCategory(event.categoryId);
        emit(CategoryProductsLoaded(products));
      } catch (e) {
        emit(CatalogError(e.toString()));
      }
    });
  }
}
