import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import '../../data/services/auth_services.dart';

class VerifyWithOtpScreen extends StatelessWidget {
  const VerifyWithOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = AuthServices();
    final userEmail = authService.getCurrentUser() ?? 'example@email.com';

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: ShadButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  leading: const Icon(LucideIcons.chevronLeft, size: 20),
                  width: 40,
                  height: 40,
                  padding: EdgeInsets.zero,
                  decoration: ShadDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey.shade200,
                  ),
                ),
              ),

              const SizedBox(height: 40),
              const Icon(
                LucideIcons.mailCheck,
                size: 48,
                color: Colors.blueAccent,
              ),
              const SizedBox(height: 16),
              const Text(
                'Verify Your Email',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                'We have sent a 6-digit verification code to:',
                style: TextStyle(color: Colors.grey[700]),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              Text(
                userEmail,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 32),

              // OTP Field
              ShadInputOTPFormField(
                id: 'otp',
                maxLength: 6,
                label: const Text('OTP'),
                keyboardType: TextInputType.number,
                description: const Text('Enter the code sent to your email.'),
                validator: (v) {
                  if (v.contains(' ')) {
                    return 'Fill the complete OTP code';
                  }
                  return null;
                },
                children: const [
                  ShadInputOTPGroup(
                    children: [
                      ShadInputOTPSlot(),
                      ShadInputOTPSlot(),
                      ShadInputOTPSlot(),
                    ],
                  ),
                  Icon(size: 24, LucideIcons.dot),
                  ShadInputOTPGroup(
                    children: [
                      ShadInputOTPSlot(),
                      ShadInputOTPSlot(),
                      ShadInputOTPSlot(),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Verify Button
              ShadButton(
                width: double.infinity,
                size: ShadButtonSize.lg,
                onPressed: () {
                  // TODO: Handle OTP verification logic
                },
                child: const Text('Verify'),
              ),

              const SizedBox(height: 20),

              // Resend Option
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Didn’t receive the code?'),
                  ShadButton.link(
                    child: const Text(
                      'Resend',
                      style: TextStyle(
                        fontSize: 12,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    onPressed: () {
                      log('Resend OTP');
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
