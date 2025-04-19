import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseErrorHandler {
  static String getErrorMessage(dynamic error) {
    if (error is AuthException) {
      return _mapAuthError(error.message);
    } else if (error is PostgrestException) {
      return _mapPostgrestError(error.message);
    } else {
      return "Something went wrong. Please try again.";
    }
  }

  static String _mapAuthError(String message) {
    if (message.contains("Email not confirmed")) {
      return "Please verify your email before logging in.";
    } else if (message.contains("Invalid login credentials")) {
      return "Incorrect email or password.";
    } else if (message.contains("Email address is invalid")) {
      return "The email address format is invalid.";
    } else if (message.contains("Email already registered")) {
      return "This email is already registered.";
    } else {
      return message; // default fallback to Supabase error message
    }
  }

  static String _mapPostgrestError(String message) {
    if (message.contains("duplicate key value violates unique constraint")) {
      return "Account already exists.";
    } else {
      return message;
    }
  }
}
