import 'package:supabase_flutter/supabase_flutter.dart';

import '../../domain/repository/auth_repo.dart';
import '../services/auth_services.dart';
import '../services/auth_services_impl.dart';

class AuthRepoImpl implements AuthRepo {
  late AuthService _authService;

  AuthRepoImpl() {
    _authService = AuthServicesImpl();
  }

  @override
  Future<AuthResponse> signIn(String email, String password) {
    return _authService.signIn(email, password);
  }

  @override
  Future<AuthResponse> signUp(String email, String password) {
    return _authService.signUp(email, password);
  }
}
