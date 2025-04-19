import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/widget/toast.dart';
import '../../data/repository/auth_repo_impl.dart';
import '../../domain/repository/auth_repo.dart';

class RegisterProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  late AuthRepo _authRepo;

  RegisterProvider() {
    _authRepo = AuthRepoImpl();
  }

  void signUp(
    String email,
    String password,
    BuildContext context,
  ) async {
    _isLoading = true;
    notifyListeners();
    try {
      if (email.isEmpty || password.isEmpty ) {
        ToastCustomization.showErrorToast(
          title: 'Missing Info',
          message: 'All fields required',
        );
      }
      await _authRepo.signUp(email, password);
      if (context.mounted) {
        context.pushNamed('AuthScreen');
      }
      ToastCustomization.showSuccessToast(title: 'Registration Success');
    } catch (e) {
      log(e.toString());
      ToastCustomization.showErrorToast(
        title: 'Registration Failed',
        message: e.toString(),
      );
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
