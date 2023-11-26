import 'package:csci410_project1/components/theme_switch_button.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isDarkMode;
  final VoidCallback onPressed;

  const MyAppBar({
    required this.isDarkMode,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Converter"),
      actions: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: ThemeButton(
            onPressed: onPressed,
            icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode_rounded),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(90);
}
