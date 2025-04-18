import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            Image.asset('assets/logo/logo.png', height: 100),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ShadTabs<String>(
                value: 'login',
                tabBarConstraints: const BoxConstraints(maxWidth: 400),
                // contentConstraints: const BoxConstraints(maxHeight: 400),
                tabs: [
                  ShadTab(
                    value: 'login',
                    content: ShadCard(
                      title: const Text('Login'),
                      footer: const ShadButton(child: Text('Login')),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(height: 16),
                          ShadInputFormField(
                            label: const Text('Email'),
                            initialValue: 'nishanpradhan@gmail.com',
                          ),
                          const SizedBox(height: 8),
                          ShadInputFormField(
                            label: const Text('password'),
                            initialValue: 'password',
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
                    ),
                    child: const Text('Login'),
                  ),
                  ShadTab(
                    value: 'signup',
                    content: ShadCard(
                      title: const Text('Sign Up'),

                      footer: const ShadButton(child: Text('Register')),
                      child: Column(
                        children: [
                          const SizedBox(height: 16),
                          ShadInputFormField(
                            label: const Text('User Name'),
                            obscureText: true,
                          ),
                          ShadInputFormField(
                            label: const Text('Email'),
                            obscureText: true,
                          ),
                          ShadInputFormField(
                            label: const Text('Phone Number'),
                            obscureText: true,
                          ),
                          const SizedBox(height: 8),
                          ShadInputFormField(
                            label: const Text('Password'),
                            obscureText: true,
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
                    ),
                    child: const Text('Register'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
