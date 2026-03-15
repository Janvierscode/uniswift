import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/usecases/submit_product_review_usecase.dart';
import '../../domain/usecases/submit_product_suggestion_usecase.dart';
import '../../domain/usecases/submit_service_rating_usecase.dart';
import 'profile_event.dart';
import 'profile_state.dart';

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final SubmitProductReviewUseCase _submitProductReview;
  final SubmitServiceRatingUseCase _submitServiceRating;
  final SubmitProductSuggestionUseCase _submitProductSuggestion;

  ProfileBloc(
    this._submitProductReview,
    this._submitServiceRating,
    this._submitProductSuggestion,
  ) : super(ProfileInitial()) {
    on<SuggestProductEvent>((event, emit) async {
      emit(ProfileSubmitting());
      try {
        final success = await _submitProductSuggestion(event.productName, event.description);
        if (success) emit(const ProfileSubmissionSuccess("Suggestion submitted successfully!"));
      } catch (e) {
        emit(ProfileError(e.toString()));
      }
    });

    on<SubmitReviewEvent>((event, emit) async {
      emit(ProfileSubmitting());
      try {
        bool success;
        if (event.isProduct) {
          success = await _submitProductReview(event.targetId, event.rating, event.comment);
        } else {
          success = await _submitServiceRating(event.targetId, event.rating, event.comment);
        }
        if (success) emit(const ProfileSubmissionSuccess("Review submitted successfully!"));
      } catch (e) {
        emit(ProfileError(e.toString()));
      }
    });
  }
}
