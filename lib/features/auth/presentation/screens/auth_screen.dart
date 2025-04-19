import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import '../widget/login_form_widget.dart';
import '../widget/register_form_widget.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            Image.asset('assets/logo/logo.png', height: 100),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ShadTabs<String>(
                value: 'login',
                tabBarConstraints: const BoxConstraints(maxWidth: 400),
                tabs: [
                  ShadTab(
                    value: 'login',
                    content: LoginFormWidget(),
                    child: const Text('Login'),
                  ),
                  ShadTab(
                    value: 'signup',
                    content: RegisterFormWidget(),
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
