import 'package:injectable/injectable.dart';
import '../entities/product_entity.dart';
import '../repositories/catalog_repository.dart';

@injectable
class GetPopularProductsUseCase {
  final CatalogRepository repository;

  GetPopularProductsUseCase(this.repository);

  Future<List<ProductEntity>> call() => repository.getPopularProducts();
}
