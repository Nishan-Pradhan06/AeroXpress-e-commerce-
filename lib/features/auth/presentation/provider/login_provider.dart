import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/utils/exception_handler.dart';
import '../../../../core/widget/toast.dart';
import '../../data/repository/auth_repo_impl.dart';
import '../../domain/repository/auth_repo.dart';

class LoginProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  late AuthRepo _authRepo;

  LoginProvider() {
    _authRepo = AuthRepoImpl();
  }

  void signIn(String email, String password, BuildContext context) async {
    _isLoading = true;
    notifyListeners();
    try {
      if (email.isEmpty || password.isEmpty) {
        ToastCustomization.showErrorToast(
          title: 'Missing Info',
          message: 'Email & password required',
        );
      }
      await _authRepo.signIn(email, password);
      if (context.mounted) {
        context.pushReplacementNamed('HomeScreen');
      }
      ToastCustomization.showSuccessToast(
        title: 'Login Success',
        message: 'Welcome back!',
      );
    } catch (e) {
      log(e.toString());
      final errorMessage = SupabaseErrorHandler.getErrorMessage(e);
      ToastCustomization.showErrorToast(
        title: 'Login Failed',
        message: errorMessage,
      );
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
