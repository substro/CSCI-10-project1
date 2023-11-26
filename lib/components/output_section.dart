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
    final TextEditingController outputController = TextEditingController();
    outputController.text = outputValue.toString();

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
                  DropdownMenuItem<String>(
                    value: 'meters',
                    child: Text('Meters'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'feet',
                    child: Text('Feet'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'millimeters',
                    child: Text('Millimeters'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'centimeters',
                    child: Text('Centimeters'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'yards',
                    child: Text('Yards'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'inches',
                    child: Text('Inches'),
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

        const SizedBox(height: 20),
      ],
    );
  }
}
