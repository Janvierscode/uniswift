import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories/auth_repository.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/signup_usecase.dart';
import 'auth_event.dart';
import 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase _loginUseCase;
  final SignUpUseCase _signUpUseCase;
  final AuthRepository _authRepository; // For status check/logout

  AuthBloc(
    this._loginUseCase,
    this._signUpUseCase,
    this._authRepository,
  ) : super(AuthInitial()) {
    on<CheckAuthStatusEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        final user = await _authRepository.getCurrentUser();
        if (user != null) {
          emit(AuthAuthenticated(user));
        } else {
          emit(AuthUnauthenticated());
        }
      } catch (e) {
        emit(AuthUnauthenticated());
      }
    });

    on<LoginRequestedEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        final user = await _loginUseCase(event.email, event.password);
        emit(AuthAuthenticated(user));
      } catch (e) {
        emit(AuthError(e.toString()));
      }
    });

    on<SignUpRequestedEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        final user = await _signUpUseCase(event.name, event.email, event.password);
        emit(AuthAuthenticated(user));
      } catch (e) {
        emit(AuthError(e.toString()));
      }
    });

    on<LogoutRequestedEvent>((event, emit) async {
      emit(AuthLoading());
      await _authRepository.logout();
      emit(AuthUnauthenticated());
    });
  }
}
