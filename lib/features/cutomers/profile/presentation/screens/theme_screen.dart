import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';

class ThemeSelectorScreen extends StatelessWidget {
  const ThemeSelectorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ThemeProvider>(context);
    final selected = provider.themeMode;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Material(
          elevation: 0.1,
          color: Colors.white,
          child: AppBar(
            iconTheme: const IconThemeData(color: Colors.black),
            backgroundColor: Colors.white,
            elevation: 0, // Set to 0 since Material provides elevation
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Theme", style: TextStyle(color: Colors.black)),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          RadioListTile<ThemeMode>(
            title: const Text('System Default'),
            value: ThemeMode.system,
            groupValue: selected,
            onChanged: (value) {
              provider.setThemeMode(value!);
            },
          ),
          RadioListTile<ThemeMode>(
            title: const Text('Light'),
            value: ThemeMode.light,
            groupValue: selected,
            onChanged: (value) {
              provider.setThemeMode(value!);
            },
          ),
          RadioListTile<ThemeMode>(
            title: const Text('Dark'),
            value: ThemeMode.dark,
            groupValue: selected,
            onChanged: (value) {
              provider.setThemeMode(value!);
            },
          ),
        ],
      ),
    );
  }
}
