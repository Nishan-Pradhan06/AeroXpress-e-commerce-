import '../../../../path/path.dart';
import '../../providers/theme_provider.dart';

class ThemeSelectorScreen extends StatelessWidget {
  const ThemeSelectorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ThemeProvider>(context);
    final selected = provider.themeMode;

    return Scaffold(
      appBar: AppBar(title: const Text('Choose Theme')),
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
