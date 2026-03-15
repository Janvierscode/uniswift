import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  final String id;
  final String name;
  final String iconUrl;
  final String colorHex;

  const CategoryEntity({
    required this.id,
    required this.name,
    required this.iconUrl,
    required this.colorHex,
  });

  @override
  List<Object?> get props => [id, name, iconUrl, colorHex];
}
