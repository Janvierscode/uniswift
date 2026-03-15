import 'package:injectable/injectable.dart';
import '../entities/product_entity.dart';
import '../repositories/catalog_repository.dart';

@injectable
class GetProductsByCategoryUseCase {
  final CatalogRepository repository;

  GetProductsByCategoryUseCase(this.repository);

  Future<List<ProductEntity>> call(String categoryId) => repository.getProductsByCategory(categoryId);
}
