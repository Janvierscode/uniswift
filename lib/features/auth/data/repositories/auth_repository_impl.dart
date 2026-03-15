import 'package:injectable/injectable.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  UserEntity? _currentUser;

  @override
  Future<UserEntity> login(String email, String password) async {
    // Mock network delay
    await Future.delayed(const Duration(seconds: 1));
    if (email.isNotEmpty && password.length >= 6) {
      _currentUser = UserEntity(id: '1', name: 'Student ${email.split('@').first}', email: email);
      return _currentUser!;
    }
    throw Exception('Invalid credentials');
  }

  @override
  Future<UserEntity> signUp(String name, String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));
    _currentUser = UserEntity(id: '1', name: name, email: email);
    return _currentUser!;
  }

  @override
  Future<void> logout() async {
    await Future.delayed(const Duration(milliseconds: 500));
    _currentUser = null;
  }

  @override
  Future<UserEntity?> getCurrentUser() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return _currentUser;
  }
}
