import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ThemeButton extends StatefulWidget {
  final VoidCallback onPressed;
  final Icon icon;
  const ThemeButton({
    required this.onPressed,
    required this.icon,
    Key? key,
  }) : super(key: key);

  @override
  State<ThemeButton> createState() => _ThemeButtonState();
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(ObjectFlagProperty<VoidCallback>.has('onPressed', onPressed));
  }
}

class _ThemeButtonState extends State<ThemeButton> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(50, 50),
        elevation: 3.0,
        shape: const CircleBorder(),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      child: widget.icon,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty<Function>('onPressed', widget.onPressed));
    properties.add(DiagnosticsProperty<bool>('isDarkmode', isDarkMode));
    properties.add(DiagnosticsProperty<bool?>('isDarkMode', isDarkMode));
  }
}
