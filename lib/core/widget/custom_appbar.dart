import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final bool centerTitle;
  final Color? backgroundColor;
  final double elevation;
  final Widget? leading;
  final PreferredSizeWidget? bottom; // Added the bottom widget

  const CustomAppBar({
    super.key,
    required this.title,
    this.actions,
    this.centerTitle = true,
    this.backgroundColor,
    this.elevation = 0.01,
    this.leading,
    this.bottom, // Accept bottom widget in the constructor
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      elevation: elevation,
      color: backgroundColor ?? theme.appBarTheme.backgroundColor,
      child: AppBar(
        title: Text(title, style: theme.appBarTheme.titleTextStyle),
        centerTitle: centerTitle,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: actions,
        leading: leading,
        bottom: bottom,
      ),
    );
  }

  @override
  Size get preferredSize {
    // Adjust height depending on whether the bottom widget exists
    if (bottom != null) {
      return Size.fromHeight(kToolbarHeight + bottom!.preferredSize.height);
    }
    return const Size.fromHeight(kToolbarHeight);
  }
}
