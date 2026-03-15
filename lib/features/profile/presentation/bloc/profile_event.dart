import 'package:equatable/equatable.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object?> get props => [];
}

class SuggestProductEvent extends ProfileEvent {
  final String productName;
  final String description;

  const SuggestProductEvent({required this.productName, required this.description});

  @override
  List<Object?> get props => [productName, description];
}

class SubmitReviewEvent extends ProfileEvent {
  final String targetId; // productId or orderId
  final double rating;
  final String comment;
  final bool isProduct;

  const SubmitReviewEvent({
    required this.targetId,
    required this.rating,
    required this.comment,
    required this.isProduct,
  });

  @override
  List<Object?> get props => [targetId, rating, comment, isProduct];
}
