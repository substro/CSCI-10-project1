import 'package:csci410_project1/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    IconData icon = theme.brightness == Brightness.dark
        ? Icons.sunny
        : Icons.nightlight_sharp;
    //currency converter body
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeClass.lightTheme,
      darkTheme: ThemeClass.darkTheme,
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          title: const Text(
            "Converter",
            // style: TextStyle(fontFamily: 'Electrolize'),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, top: 20, right: 20, bottom: 20),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: HexColor("FFFFFF")),
                child: IconButton(
                  color: HexColor("030320"),
                  onPressed: () {},
                  icon: Icon(icon),
                ),
              ),
            )
          ],
        ),
        body: const CurrencyConverterBody(),
      ),
    );
  }
}

class CurrencyConverterBody extends StatelessWidget {
  const CurrencyConverterBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center();
  }
}
