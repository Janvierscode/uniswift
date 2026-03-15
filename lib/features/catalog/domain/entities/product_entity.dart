import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  final String categoryId;
  final bool isPopular;

  const ProductEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.categoryId,
    this.isPopular = false,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        price,
        imageUrl,
        categoryId,
        isPopular,
      ];
}
