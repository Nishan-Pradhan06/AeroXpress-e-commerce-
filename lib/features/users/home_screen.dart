import 'package:flutter/material.dart';
import '../auth/data/services/auth_services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = AuthServices();
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 50),
          Image.asset('assets/logo/logo.png', height: 100),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Welcome to AeroXpress',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            authService.getCurrentUser() ?? 'No user logged in',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
