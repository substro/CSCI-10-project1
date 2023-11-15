import 'package:csci410_project1/components/theme_switch_button.dart';
import 'package:csci410_project1/theme/theme_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Material App',
          home: const HomeScreen(),
          theme: Provider.of<ThemeProvider>(context).currentTheme,
        ),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Converter",
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ThemeButton(
              onPressed: () {
                final themeProvider = Provider.of<ThemeProvider>(context,
                    listen:
                        false); // get the provider, listen:false is necessary

                setState(() {
                  isDarkMode = !isDarkMode;
                }); // change the variable

                isDarkMode // call the functions
                    ? themeProvider.setDarkMode()
                    : themeProvider.setLightMode();
              },
              icon:
                  Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode_rounded),
            ),
          ),
        ],
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

class CurrencyConverterBody extends StatelessWidget {
  const CurrencyConverterBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center();
  }
}
