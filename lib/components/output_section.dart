import 'package:csci410_project1/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class OutputSection extends StatelessWidget {
  final bool isDarkMode = false;
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
            Text(
              'Output Unit:',
              style: TextStyle(color: themeProvider.white),
            ),
            const Gap(10),
            //TODO:move these items to a separate file and map them
            DropdownButton<String>(
                //!dropdown icon color
                iconEnabledColor: themeProvider.white,
                //!dropdown text color
                style: TextStyle(color: themeProvider.white),
                //!dropdown bg color
                dropdownColor: themeProvider.darkSecondaryColor,
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
                  DropdownMenuItem<String>(
                    value: 'micrometers',
                    child: Text('Micrometers'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'nanometers',
                    child: Text('Nanometers'),
                  ),
                ],
                onChanged: onOutputUnitChanged),
          ],
        ),
        const Gap(10),

        TextField(
          controller: TextEditingController(text: outputValue.toString()),
          readOnly: true,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            constraints: const BoxConstraints(maxWidth: 250, maxHeight: 250),
            labelText: 'Output Value',
            labelStyle: TextStyle(color: Colors.grey[500]),
            border: OutlineInputBorder(
                borderSide: BorderSide(
                    color: isDarkMode
                        ? themeProvider.accentColor
                        : themeProvider.white)),
            //!border color
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: themeProvider.white,
              ),
            ),
            //!border color when focused
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: themeProvider.accentColor),
            ),
          ),
        ),

        const Gap(20),
      ],
    );
  }
}
