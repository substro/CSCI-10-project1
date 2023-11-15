import 'package:csci410_project1/components/converter_section.dart';
import 'package:csci410_project1/components/app_bar.dart'; // Import the new file
import 'package:csci410_project1/theme/theme_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        isDarkMode: isDarkMode,
        onPressed: () {
          final themeProvider = Provider.of<ThemeProvider>(
            context,
            listen: false,
          );

          setState(() {
            isDarkMode = !isDarkMode;
          });

          isDarkMode
              ? themeProvider.setDarkMode()
              : themeProvider.setLightMode();
        },
      ),
      body: const CurrencyConverterBody(),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<bool>('isDarkMode', isDarkMode));
  }
}
