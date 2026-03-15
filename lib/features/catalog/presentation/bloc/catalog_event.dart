import 'package:equatable/equatable.dart';

abstract class CatalogEvent extends Equatable {
  const CatalogEvent();

  @override
  List<Object?> get props => [];
}

class LoadHomeCatalogEvent extends CatalogEvent {}

class LoadCategoryProductsEvent extends CatalogEvent {
  final String categoryId;

  const LoadCategoryProductsEvent(this.categoryId);

  @override
  List<Object?> get props => [categoryId];
}
