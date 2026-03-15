import 'package:injectable/injectable.dart';
import '../../domain/entities/category_entity.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/repositories/catalog_repository.dart';

@LazySingleton(as: CatalogRepository)
class CatalogRepositoryImpl implements CatalogRepository {
  final List<CategoryEntity> _mockCategories = const [
    CategoryEntity(id: 'c1', name: 'Snacks', iconUrl: 'fastfood', colorHex: '#FF9500'),
    CategoryEntity(id: 'c2', name: 'Drinks', iconUrl: 'local_drink', colorHex: '#2196F3'),
    CategoryEntity(id: 'c3', name: 'Stationery', iconUrl: 'edit', colorHex: '#4CAF50'),
    CategoryEntity(id: 'c4', name: 'Toiletries', iconUrl: 'clean_hands', colorHex: '#9C27B0'),
    CategoryEntity(id: 'c5', name: 'Electronics', iconUrl: 'devices', colorHex: '#607D8B'),
  ];

  final List<ProductEntity> _mockProducts = const [
    ProductEntity(
      id: 'p1',
      title: 'Lays Potato Chips',
      description: 'Classic salted potato chips.',
      price: 1.50,
      imageUrl: 'https://via.placeholder.com/150',
      categoryId: 'c1',
      isPopular: true,
    ),
    ProductEntity(
      id: 'p2',
      title: 'Coca-Cola 500ml',
      description: 'Refreshing cold drink.',
      price: 1.00,
      imageUrl: 'https://via.placeholder.com/150',
      categoryId: 'c2',
      isPopular: true,
    ),
    ProductEntity(
      id: 'p3',
      title: 'A4 Notebook (2 Quire)',
      description: 'Ruled A4 notebook for lectures.',
      price: 3.50,
      imageUrl: 'https://via.placeholder.com/150',
      categoryId: 'c3',
      isPopular: false,
    ),
    ProductEntity(
      id: 'p4',
      title: 'Colgate Toothpaste',
      description: 'Minty fresh toothpaste.',
      price: 2.00,
      imageUrl: 'https://via.placeholder.com/150',
      categoryId: 'c4',
      isPopular: false,
    ),
    ProductEntity(
      id: 'p5',
      title: 'Type-C Charger Cable',
      description: 'Fast charging Type-C cable.',
      price: 5.00,
      imageUrl: 'https://via.placeholder.com/150',
      categoryId: 'c5',
      isPopular: true,
    ),
    ProductEntity(
      id: 'p6',
      title: 'Simba Chutney Chips',
      description: 'Fruit chutney flavored chips.',
      price: 1.50,
      imageUrl: 'https://via.placeholder.com/150',
      categoryId: 'c1',
      isPopular: true,
    ),
  ];

  @override
  Future<List<CategoryEntity>> getCategories() async {
    await Future.delayed(const Duration(milliseconds: 800));
    return _mockCategories;
  }

  @override
  Future<List<ProductEntity>> getPopularProducts() async {
    await Future.delayed(const Duration(milliseconds: 800));
    return _mockProducts.where((p) => p.isPopular).toList();
  }

  @override
  Future<List<ProductEntity>> getProductsByCategory(String categoryId) async {
    await Future.delayed(const Duration(milliseconds: 800));
    return _mockProducts.where((p) => p.categoryId == categoryId).toList();
  }
}
