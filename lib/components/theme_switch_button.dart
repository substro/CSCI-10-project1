import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ThemeButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Icon icon;
  ThemeButton({
    required this.onPressed,
    required this.icon,
    Key? key,
  }) : super(key: key);
  bool isDarkMode = false; // new variable

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(30, 30),
        elevation: 3.0,
        shape: const CircleBorder(),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      child: icon,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<Function>('onPressed', onPressed));
    properties.add(DiagnosticsProperty<bool>('isDarkmode', isDarkMode));
    properties.add(DiagnosticsProperty<bool?>('isDarkMode', isDarkMode));
  }
}
