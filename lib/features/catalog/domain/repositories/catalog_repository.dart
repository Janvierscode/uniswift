import '../entities/category_entity.dart';
import '../entities/product_entity.dart';


abstract class CatalogRepository {
  Future<List<CategoryEntity>> getCategories();
  Future<List<ProductEntity>> getPopularProducts();
  Future<List<ProductEntity>> getProductsByCategory(String categoryId);
}
