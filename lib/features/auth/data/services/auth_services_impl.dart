import 'package:supabase_flutter/supabase_flutter.dart';
import 'auth_services.dart';

class AuthServicesImpl implements AuthService {
  final SupabaseClient _supaBase = Supabase.instance.client;

  @override
  Future<AuthResponse> signIn(String email, String password) {
    return _supaBase.auth.signInWithPassword(password: password, email: email);
  }

  @override
  Future<AuthResponse> signUp(String email, String password) {
    return _supaBase.auth.signUp(
      password: password,
      email: email,
    );
  }
}
