import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
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
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).colorScheme.inversePrimary,
        // borderRadius: BorderRadius.circular(50),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: icon,
      ),
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
