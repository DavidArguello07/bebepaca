import 'package:bebepaca/auth/models/admin_user_model.dart';
import 'package:bebepaca/auth/repository/auth_repository_api.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final AuthRepositoryAPI authRepositoryAPI = AuthRepositoryAPI();

  Future<String> loginWithEmail(String email, String password) {
    return authRepositoryAPI.loginWithEmail(email, password);
  }

  Future<String> registerWithEmail(String email, String password, String name) {
    return authRepositoryAPI.registerWithEmail(email, password, name);
  }

  Stream<User?> authStateChanges() => authRepositoryAPI.authStateChanges();

  Stream<AdminUserModel> get getCurrentUserAdmin$ =>
      authRepositoryAPI.getCurrentUserAdmin$;

  Future<void> logout() => authRepositoryAPI.logout();

  User? get getUser {
    return authRepositoryAPI.getUser;
  }
}
