import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:uniswift/features/auth/domain/entities/user_entity.dart';
import 'package:uniswift/features/auth/domain/usecases/login_usecase.dart';
import 'package:uniswift/features/auth/domain/usecases/signup_usecase.dart';
import 'package:uniswift/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:uniswift/features/auth/presentation/bloc/auth_event.dart';
import 'package:uniswift/features/auth/presentation/bloc/auth_state.dart';

class MockLoginUseCase extends Mock implements LoginUseCase {}
class MockSignUpUseCase extends Mock implements SignUpUseCase {}

void main() {
  late MockLoginUseCase mockLoginUseCase;
  late MockSignUpUseCase mockSignUpUseCase;
  late AuthBloc authBloc;

  setUp(() {
    mockLoginUseCase = MockLoginUseCase();
    mockSignUpUseCase = MockSignUpUseCase();
    authBloc = AuthBloc(mockLoginUseCase, mockSignUpUseCase);
  });

  tearDown(() {
    authBloc.close();
  });

  group('AuthBloc', () {
    const user = UserEntity(
      id: '123',
      name: 'Test User',
      email: 'test@example.com',
      token: 'token123',
    );

    test('initial state should be AuthInitial', () {
      expect(authBloc.state, AuthInitial());
    });

    blocTest<AuthBloc, AuthState>(
      'emits [AuthLoading, AuthAuthenticated] when LoginEvent succeeds',
      build: () {
        when(() => mockLoginUseCase(any(), any())).thenAnswer((_) async => user);
        return authBloc;
      },
      act: (bloc) => bloc.add(const LoginEvent("test@example.com", "password")),
      expect: () => [
        AuthLoading(),
        const AuthAuthenticated(user),
      ],
      verify: (_) {
        verify(() => mockLoginUseCase("test@example.com", "password")).called(1);
      },
    );

    blocTest<AuthBloc, AuthState>(
      'emits [AuthLoading, AuthError] when LoginEvent fails',
      build: () {
        when(() => mockLoginUseCase(any(), any())).thenThrow(Exception("Invalid credentials"));
        return authBloc;
      },
      act: (bloc) => bloc.add(const LoginEvent("test@example.com", "wrong")),
      expect: () => [
        AuthLoading(),
        const AuthError("Exception: Invalid credentials"),
      ],
    );
  });
}
