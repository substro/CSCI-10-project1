import 'package:csci410_project1/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class OutputSection extends StatelessWidget {
  final String outputUnit;
  final double outputValue;
  final Function(String?)? onOutputUnitChanged;

  const OutputSection({
    required this.outputUnit,
    required this.outputValue,
    required this.onOutputUnitChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(
      context,
      listen: false,
    );
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        // Add dropdown for output unit
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Output Unit:'),
            const Gap(10),
            DropdownButton<String>(
                value: outputUnit,
                items: const [
                  DropdownMenuItem<String>(
                    value: 'kilometers',
                    child: Text('Kilometers'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'miles',
                    child: Text('Miles'),
                  ),
                ],
                onChanged: onOutputUnitChanged),
          ],
        ),
        TextField(
          controller: TextEditingController(text: outputValue.toString()),
          readOnly: true,
          style: const TextStyle(color: Colors.black),
          decoration: InputDecoration(
            constraints: const BoxConstraints(maxWidth: 250, maxHeight: 250),
            labelText: 'Output Value',
            labelStyle: TextStyle(color: themeProvider.black),
            border: const OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: themeProvider.accentColor),
            ),
          ),
        ),

        // Add text field for output value
        // TextField(
        //   controller: TextEditingController(text: outputValue.toString()),
        //   readOnly: true,
        //   style: const TextStyle(color: Colors.black),
        //   decoration: const InputDecoration(
        //     constraints: BoxConstraints(maxWidth: 250, maxHeight: 250),
        //     labelText: 'Output Value',
        //     // Add other decoration properties as needed
        //   ),
        // ),

        const SizedBox(height: 20),
      ],
    );
  }
}
