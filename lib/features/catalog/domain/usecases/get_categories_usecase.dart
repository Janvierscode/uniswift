import 'package:injectable/injectable.dart';
import '../entities/category_entity.dart';
import '../repositories/catalog_repository.dart';

@injectable
class GetCategoriesUseCase {
  final CatalogRepository repository;

  GetCategoriesUseCase(this.repository);

  Future<List<CategoryEntity>> call() => repository.getCategories();
}
