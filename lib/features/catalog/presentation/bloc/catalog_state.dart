import 'package:equatable/equatable.dart';
import '../../domain/entities/category_entity.dart';
import '../../domain/entities/product_entity.dart';

abstract class CatalogState extends Equatable {
  const CatalogState();

  @override
  List<Object?> get props => [];
}

class CatalogInitial extends CatalogState {}

class CatalogLoading extends CatalogState {}

class HomeCatalogLoaded extends CatalogState {
  final List<CategoryEntity> categories;
  final List<ProductEntity> popularProducts;

  const HomeCatalogLoaded({
    required this.categories,
    required this.popularProducts,
  });

  @override
  List<Object?> get props => [categories, popularProducts];
}

class CategoryProductsLoaded extends CatalogState {
  final List<ProductEntity> products;

  const CategoryProductsLoaded(this.products);

  @override
  List<Object?> get props => [products];
}

class CatalogError extends CatalogState {
  final String message;

  const CatalogError(this.message);

  @override
  List<Object?> get props => [message];
}
