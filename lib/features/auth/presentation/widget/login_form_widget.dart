import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import '../provider/login_provider.dart';

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({super.key});

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(
      builder:
          (context, loginProvider, child) => ShadCard(
            title: const Text('Login'),
            footer: ShadButton(
              onPressed:
                  () =>
                      loginProvider.isLoading
                          ? null
                          : loginProvider.signIn(
                            emailController.text.trim(),
                            passwordController.text.trim(),
                            context,
                          ),
              leading:
                  loginProvider.isLoading
                      ? const SizedBox.square(
                        dimension: 16,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 1.5,
                        ),
                      )
                      : null,
              child: Text(loginProvider.isLoading ? 'Logging in...' : 'Login'),
            ),
            child: Column(
              children: [
                const SizedBox(height: 16),
                ShadInputFormField(
                  label: const Text('Email'),
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  // validator: ,
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
          ),
    );
  }
}
