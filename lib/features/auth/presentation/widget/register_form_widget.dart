import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import '../provider/register_provider.dart';

class RegisterFormWidget extends StatefulWidget {
  const RegisterFormWidget({super.key});

  @override
  State<RegisterFormWidget> createState() => _RegisterFormWidgetState();
}

class _RegisterFormWidgetState extends State<RegisterFormWidget> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  // TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ShadCard(
      title: const Text('Sign Up'),
      footer: Consumer<RegisterProvider>(
        builder:
            (context, registerProvider, child) => ShadButton(
              onPressed:
                  () =>
                      registerProvider.isLoading
                          ? null
                          : registerProvider.signUp(
                            emailController.text.trim(),
                            passwordController.text.trim(),
                            // phoneController.text.trim(),
                            context,
                          ),
              leading:
                  registerProvider.isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : null,
              child: Text(
                registerProvider.isLoading ? 'Registering...' : 'Register',
              ),
            ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 16),
          ShadInputFormField(
            label: const Text('Email'),
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 8),
          ShadInputFormField(
            label: const Text('Phone Number'),
            // controller: phoneController,
            keyboardType: TextInputType.phone,
          ),
          const SizedBox(height: 8),
          ShadInputFormField(
            label: const Text('Password'),
            controller: passwordController,
            obscureText: true,
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
