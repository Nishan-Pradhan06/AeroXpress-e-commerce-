import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class ToastCustomization {
  static void showErrorToast({required String title, String? message}) {
    Toastification().show(
      title: Text(title),
      description: message != null ? Text(message) : null,
      autoCloseDuration: const Duration(seconds: 5),

      type: ToastificationType.error,
    );
  }

  static void showSuccessToast({required String title, String? message}) {
    Toastification().show(
      title: Text(title),
      description: message != null ? Text(message) : null,
      autoCloseDuration: const Duration(seconds: 5),

      type: ToastificationType.success,
    );
  }
}
